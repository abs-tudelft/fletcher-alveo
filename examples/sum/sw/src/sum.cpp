// Copyright 2018 Delft University of Technology
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include <arrow/api.h>
#include <fletcher/api.h>
#include "fletcher_alveo.h"

#include <memory>
#include <iostream>

using std::vector;
using std::shared_ptr;
using fletcher::Platform;
using fletcher::Context;
using fletcher::Kernel;
using fletcher::ReadRecordBatchesFromFile;

/**
 * Main function for the Sum example.
 */
int main(int argc, char **argv) {
  // Check number of arguments.
  if (argc != 2) {
    std::cerr << "Incorrect number of arguments. Usage: sum path/to/recordbatch.rb" << std::endl;
    return -1;
  }

  // Variable declarations.
  vector<shared_ptr<arrow::RecordBatch>> batches;
  shared_ptr<arrow::RecordBatch> number_batch;
  shared_ptr<Platform> platform;
  shared_ptr<Context> context;
  uint32_t result;

  // Read the RecordBatch from storage.
  ReadRecordBatchesFromFile(argv[1], &batches);
  number_batch = batches[0];

  fletcher::Status status;
  status = Platform::Make("alveo", &platform, false);  // Create an interface to an auto-detected FPGA Platform.
  if (!status.ok())
    {
      std::cerr << status.message << std::endl;
      return -1;
    }

  platform_init config{
      0,                                                    // Device ID
      FL_TR_DEVICE_DMA,                                     // Data transfer mechanism
      "./fletcher.hw_emu.xilinx_u280_xdma_201920_3.xclbin", // Kernel xclbin
      "krnl_fletcher_rtl:{krnl_fletcher_rtl_1}",            // Kernel name
      0                                                     // Kernel memory bank ID
  };
  platform->init_data = &config;
  platform->Init();                             // Initialize the Platform.

  Context::Make(&context, platform);            // Create a Context for our data on the Platform.
  context->QueueRecordBatch(number_batch);      // Queue the RecordBatch to the Context.
  context->Enable();                            // Enable the Context, (potentially transferring the data to FPGA).

  Kernel kernel(context);                       // Set up an interface to the Kernel, supplying the Context.
  kernel.Start();                               // Start the kernel.
  kernel.PollUntilDone();                       // Wait for the kernel to finish.

  kernel.GetReturn(&result);                    // Obtain the result.
  std::cout << "Sum: " << signed(result) << std::endl;  // Print the result.

  return 0;
}
