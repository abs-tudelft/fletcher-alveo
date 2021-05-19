#ifndef FLETCHER_ALVEO_PRIV_H
#define FLETCHER_ALVEO_PRIV_H

#include <stddef.h>
#include "fletcher/fletcher.h"
#include "fletcher_alveo.h"


#ifndef NDEBUG
#define ENABLE_DEBUG_PRINT 1
#else
#define ENABLE_DEBUG_PRINT 0
#endif

#define debug_print(...) do { if (ENABLE_DEBUG_PRINT) fprintf(stderr, __VA_ARGS__); } while (0)

#define FLETCHER_PLATFORM_NAME "alveo"

#define ALVEO_MMIO_OFFSET 16

#define FLETCHER_PLATFORM_BUFFER_MAP_CAPACITY 4096

#define ALVEO_CHECK_RESULT(result, label)                             \
    if (result != FPGA_OK)                                            \
    {                                                                 \
        fprintf(stderr, "Error %s: %s\n", label, fpgaErrStr(result)); \
        return FLETCHER_STATUS_ERROR;                                 \
    }

#ifdef __cplusplus
extern "C" {
#endif

typedef struct {
    data_trans_mech transfer_mech;
    xrtDeviceHandle device;
    xrtXclbinHandle xclbin;
    xrtKernelHandle kernel;
    uint64_t memory_bank;
} platform_state;

typedef struct {
    xrtBufferHandle handle;
    da_t device_address;
    uint64_t host_address;
    size_t size;
    bool active;
} device_buffer;

fstatus_t platformGetName(char *name, size_t size);

fstatus_t platformInit(void *arg);

fstatus_t platformWriteMMIO(uint64_t offset, uint32_t value);

fstatus_t platformReadMMIO(uint64_t offset, uint32_t *value);

fstatus_t platformCopyHostToDevice(const uint8_t *host_source,
                                   da_t device_destination,
                                   int64_t size);

fstatus_t platformCopyDeviceToHost(const da_t device_source,
                                   uint8_t *host_destination,
                                   int64_t size);

fstatus_t platformDeviceMalloc(da_t *device_address, int64_t size);

fstatus_t platformDeviceFree(da_t device_address);

fstatus_t platformPrepareHostBuffer(const uint8_t *host_source,
                                    da_t *device_destination,
                                    int64_t size,
                                    int *alloced);

fstatus_t platformCacheHostBuffer(const uint8_t *host_source,
                                  da_t *device_destination,
                                  int64_t size);

fstatus_t platformTerminate(void *arg);

#ifdef __cplusplus
}
#endif
#endif
