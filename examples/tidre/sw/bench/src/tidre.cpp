#include <iostream>
#include <iomanip>
#include <chrono>

#include <arrow/api.h>
#include <arrow/ipc/api.h>
#include <arrow/io/api.h>

#include "tidre.hpp"
using Tidre = tidre::Tidre<16>;

/**
 * Builds the schema that we expect for the input record batch.
 */
std::shared_ptr<arrow::Schema> schema_in() {
  return arrow::schema({arrow::field("text", arrow::utf8(), false)});
}

/**
 * Builds the schema that we will use for the output record batch.
 */
std::shared_ptr<arrow::Schema> schema_out() {
  return arrow::schema({arrow::field("match", arrow::uint32(), false)});
}

/**
 * Reads a record batch file.
 */
std::shared_ptr<arrow::RecordBatch> ReadBatch(const std::string &file_name) {
  auto file = arrow::io::ReadableFile::Open(file_name).ValueOrDie();
  auto reader = arrow::ipc::RecordBatchFileReader::Open(file).ValueOrDie();
  auto batch = reader->ReadRecordBatch(0);
  return batch.ValueOrDie();
}

/**
 * Writes a record batch file.
 */
arrow::Status WriteBatch(const std::string &file_name, const arrow::RecordBatch &batch) {
  arrow::Status status;
  auto file = arrow::io::FileOutputStream::Open(file_name).ValueOrDie();
  auto writer = arrow::ipc::NewFileWriter(file.get(), batch.schema()).ValueOrDie();
  status = writer->WriteRecordBatch(batch);
  if (!status.ok()) {
    return status;
  }
  return writer->Close();
}

/**
 * Application entry point.
 */
int main(int argc, char **argv) {

  // Check number of input args.
  if (argc != 3) {
    std::cout << "Usage: " << argv[0] << " <input.rb> <output.rb>" << std::endl;
    return 2;
  }

  arrow::Status status;

  // Read batch from file.
  std::cout << "Loading dataset..." << std::endl;
  auto batch_in = ReadBatch(argv[1]);

  // Check if input schema matches (except metadata).
  batch_in->schema()->Equals(schema_in(), false);

  // Cast to utf8 string array.
  auto array = std::dynamic_pointer_cast<arrow::StringArray>(batch_in->column(0));

  if (array == nullptr) {
    std::cerr << "Could not cast Array to StringArray" << std::endl;
    return 1;
  }

  // Obtain the number of rows, number of data bytes, and the raw buffer
  // pointers.
  size_t num_rows = array->length();
  const auto *offsets = reinterpret_cast<const int32_t *>(array->value_offsets()->data());
  size_t num_bytes = offsets[num_rows] - offsets[0];
  const auto *values = reinterpret_cast<const uint8_t *>(array->value_data()->data());
  std::cout << "Loaded dataset with " << num_rows << " row(s) and " << num_bytes << " data byte(s)." << std::endl;
  
    // Unfortunately, when you're loading record batch files, the buffer pointers
  // are not aligned to 64 bytes. That slows down the DMA transfers by about a
  // factor 4. The code below reallocates the buffers with proper alignment.
  // You can easily get rid of this by changing the true to false. Note that
  // when buffers are allocated by Arrow (versus being pointers to a mmap'd
  // record batch file), the buffers will already be aligned from the start.
  if (true) {
    int32_t *aligned_offsets = nullptr;
    const size_t offsets_size = (num_rows + 1) * sizeof(uint32_t);
    posix_memalign(reinterpret_cast<void**>(&aligned_offsets), 64, offsets_size);
    memcpy(aligned_offsets, offsets, offsets_size);
    offsets = aligned_offsets;

    uint8_t *aligned_values = nullptr;
    const size_t values_size = num_bytes;
    posix_memalign(reinterpret_cast<void**>(&aligned_values), 64, values_size);
    memcpy(aligned_values, values, values_size);
    values = aligned_values;
  }
  
  // Make an output buffer that's large enough to handle the case where all
  // records match.
  uint32_t *matches = nullptr;
  const size_t matches_size = num_rows * sizeof(uint32_t);
  posix_memalign(reinterpret_cast<void**>(&matches), 64, matches_size);
  size_t num_matches = 0;
  

  // Connect to the FPGA.
  std::shared_ptr<Tidre> t;
  auto tidre_status = Tidre::Make(
    &t, "alveo",
    1, // Number of pipeline beats; tweakable, at least 1.
    1  // Number of kernels to use; tweakable from 1 to 16.
  );
  if (!tidre_status.ok()) {
    std::cerr << "Could not connect to FPGA: " << tidre_status.message << std::endl;
    return 1;
  }

  // Process the dataset with the FPGA.
  std::cout << "Starting FPGA run for " << num_rows << " rows..." << std::endl;
  size_t num_errors = 0;
  auto start = std::chrono::system_clock::now();
  tidre_status = t->RunRaw(
    offsets, values, num_rows, matches, matches_size, &num_matches, &num_errors,
    2   // Verbosity level; 0, 1, or 2.
  );
  auto end = std::chrono::system_clock::now();
  if (!tidre_status.ok()) {
    std::cerr << "Failed to run on FPGA: " << tidre_status.message << std::endl;
    return 1;
  }

  // Print some results.
  auto time = std::chrono::duration<double>(end - start).count();
  std::cout << "Run complete in " << std::fixed << std::setprecision(4) << time << " seconds, ";
  std::cout << "or about " << (num_bytes / time) * 1e-9 << " GB/s" << std::endl;
  std::cout << num_matches << " match(es) were recorded." << std::endl;
  if (num_errors) {
    std::cout << "Note: there was/were " << num_errors << " UTF8 decode error(s) ";
    std::cout << "while reading the dataset!" << std::endl;
  }

  // Wrap the resulting buffer in an output record batch.
  size_t num_matches_bytes = num_matches * sizeof(uint32_t);
  auto matches_values_buffer = arrow::Buffer::Wrap(matches, num_matches_bytes);
  auto matches_array = std::make_shared<arrow::PrimitiveArray>(
    arrow::uint32(), num_matches, matches_values_buffer);
  auto batch_out = arrow::RecordBatch::Make(schema_out(), num_matches, {matches_array});

  // Write the record batch to a file.
  std::cout << "Writing match data..." << std::endl;
  status = WriteBatch(argv[2], *batch_out);
  if (!status.ok()) {
    std::cout << "Failed to write output record batch: " << status.message() << std::endl;
  }
  std::cout << "Done!" << std::endl;

  return 0;
}
 
