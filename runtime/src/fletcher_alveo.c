#include <stdio.h>
#include <string.h>
#include "experimental/xrt_kernel.h"
#include "experimental/xrt_aie.h"
#include "./fletcher_alveo_priv.h"

platform_state platform;
device_buffer buffer_map[FLETCHER_PLATFORM_BUFFER_MAP_CAPACITY];
size_t buffer_map_size = 0;

fstatus_t getBufferByDA(da_t device_address, device_buffer **device_buffer) {
    for (int i = 0; i < buffer_map_size; i++) {
        if (buffer_map[i].device_address <= device_address &&
            buffer_map[i].device_address + buffer_map[i].size > device_address) {
            *device_buffer = & buffer_map[i];
            return FLETCHER_STATUS_OK;
        }
    }
    fprintf(stderr, "[FLETCHER_ALVEO] Buffer address not found in platform buffer map\n");
    return FLETCHER_STATUS_ERROR;
}

fstatus_t getBufferByHA(uint8_t *host_ptr, device_buffer **device_buffer) {
    for (int i = 0; i < buffer_map_size; i++) {
        if (buffer_map[i].host_address <= (uint64_t)host_ptr &&
            buffer_map[i].host_address + buffer_map[i].size > (uint64_t)host_ptr) {
            *device_buffer = & buffer_map[i];
            return FLETCHER_STATUS_OK;
        }
    }
    fprintf(stderr, "[FLETCHER_ALVEO] Buffer address not found in platform buffer map\n");
    return FLETCHER_STATUS_ERROR;
}

fstatus_t platformGetName(char *name, size_t size) {
    size_t len = strlen(FLETCHER_PLATFORM_NAME);
    if (len > size) {
        memcpy(name, FLETCHER_PLATFORM_NAME, size - 1);
        name[size - 1] = '\0';
    } else {
        memcpy(name, FLETCHER_PLATFORM_NAME, len + 1);
    }
    return FLETCHER_STATUS_OK;
}

fstatus_t platformInit(void *arg) {
    platform_init *config;
    if (arg != NULL) {
        config = (platform_init *) arg;
    } else {
        fprintf(stderr, "Error missing platform init configuration\n");
        return FLETCHER_STATUS_ERROR;
    }

    int rc;
    platform.transfer_mech = config->transfer_mech;
    platform.memory_bank = config->memory_bank;

    debug_print("[FLETCHER_ALVEO] Opening device %d.\n", config->device_id);
    platform.device = xrtDeviceOpen(config->device_id);
    if (platform.device == 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error while opening device %d.\n", config->device_id);
        return FLETCHER_STATUS_ERROR;
    }
    platform.xclbin = xrtXclbinAllocFilename(config->xclbin);
    debug_print("[FLETCHER_ALVEO] Loading %s.\n", config->xclbin);
    rc = xrtDeviceLoadXclbinHandle(platform.device, platform.xclbin);
    if (rc != 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error while loading %s.\n", config->xclbin);
        return FLETCHER_STATUS_ERROR;
    }

    xuid_t xclbin_uuid;
    xrtXclbinGetUUID(platform.xclbin, xclbin_uuid);
    debug_print("[FLETCHER_ALVEO] Opening XRT kernel.\n", config->xclbin);
    platform.kernel = xrtPLKernelOpenExclusive(platform.device, xclbin_uuid, config->kernel_name);
    if (platform.kernel == 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error while opening kernel.\n");
        return FLETCHER_STATUS_ERROR;
    }

    size_t buffer_map_size = 0;

    return FLETCHER_STATUS_OK;
}

fstatus_t platformTerminate(void *arg) {
    int rc;
    //Free all device buffers
    for (int i = 0; i < buffer_map_size; i++) {
        if (buffer_map[i].active) {
            platformDeviceFree(buffer_map[i].device_address);
        }
    }
    rc = xrtKernelClose(platform.kernel);
    if (rc != 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error while closing kernel.\n");
        return FLETCHER_STATUS_ERROR;
    }
    return FLETCHER_STATUS_OK;
}

fstatus_t platformWriteMMIO(uint64_t offset, uint32_t value) {
    int rc;
    debug_print("[FLETCHER_ALVEO] Writing MMIO register.       %04lu <= 0x%08X\n", offset, value);
    rc = xrtKernelWriteRegister(platform.kernel, ALVEO_MMIO_OFFSET + offset *sizeof(uint32_t), value);
    if (rc != 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error while writing MMIO register.       %04lu <= 0x%08X\n", offset, value);
        return FLETCHER_STATUS_ERROR;
    }
    return FLETCHER_STATUS_OK;
}

fstatus_t platformReadMMIO(uint64_t offset, uint32_t *value) {
    int rc;
    rc = xrtKernelReadRegister(platform.kernel, ALVEO_MMIO_OFFSET + offset * sizeof(uint32_t), value);
    if (rc != 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error while reading MMIO register %04lu.\n", offset);
        return FLETCHER_STATUS_ERROR;
    }
    debug_print("[FLETCHER_ALVEO] Read MMIO register.          %04lu => 0x%08X\n", offset, *value);
    return FLETCHER_STATUS_OK;
}

fstatus_t platformCopyHostToDevice(const uint8_t *host_source,
    da_t device_destination,
    int64_t size) {

    debug_print("[FLETCHER_ALVEO] Copy: [host] 0x%016lX --> [device] 0x%016lX (%10lu bytes).\n",
        (unsigned long) host_source,
        (unsigned long) device_destination,
        size);
    fstatus_t rc;
    device_buffer *buffer;
    rc = getBufferByDA(device_destination, & buffer);
    if (rc != FLETCHER_STATUS_OK) {
        return FLETCHER_STATUS_ERROR;
    }
    rc = xrtBOWrite(buffer->handle, host_source, size, device_destination-buffer->device_address);
    if (rc != 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error: platformCopyHostToDevice: xrtBOWrite.\n");
        return FLETCHER_STATUS_ERROR;
    }
    rc = xrtBOSync(buffer->handle, XCL_BO_SYNC_BO_TO_DEVICE, size, device_destination-buffer->device_address);
    if (rc != 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error: platformCopyHostToDevice: xrtBOSync.\n");
        return FLETCHER_STATUS_ERROR;
    }

    return FLETCHER_STATUS_OK;
}

fstatus_t platformCopyDeviceToHost(const da_t device_source,
    uint8_t *host_destination,
    int64_t size) {

    debug_print("[FLETCHER_ALVEO] Copy: [device] 0x%016lX --> [host] 0x%016lX (%10lu bytes).\n",
        (unsigned long) device_source,
        (unsigned long) host_destination,
        size);

    fstatus_t rc;
    device_buffer *buffer;
    rc = getBufferByDA(device_source, & buffer);
    if (rc != FLETCHER_STATUS_OK) {
        return FLETCHER_STATUS_ERROR;
    }
    
    rc = xrtBOSync(buffer->handle, XCL_BO_SYNC_BO_FROM_DEVICE, size, 0);
    if (rc != 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error: platformCopyDeviceToHost: xrtBOSync.\n");
        return FLETCHER_STATUS_ERROR;
    }
    rc = xrtBORead(buffer->handle, host_destination, size, device_source-buffer->device_address);
    if (rc != 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error: platformCopyDeviceToHost: xrtBORead.\n");
        return FLETCHER_STATUS_ERROR;
    }

    return FLETCHER_STATUS_OK;
}

uint64_t platformDeviceMalloc(da_t *device_address, int64_t size) {
    device_buffer buf;

    buf.handle = xrtBOAlloc(platform.device, size, XRT_BO_FLAGS_NONE, platform.memory_bank);
    
    switch (platform.transfer_mech) {
        case FL_TR_DEVICE_DMA:
            buf.handle = xrtBOAlloc(platform.device, size, XRT_BO_FLAGS_NONE, platform.memory_bank);
            break;
        case FL_TR_HOST_SHADOW_BUFF:
           buf.handle = xrtBOAlloc(platform.device, size, XRT_BO_FLAGS_HOST_ONLY, platform.memory_bank);
            break;
        case FL_TR_HOST_ONLY_BUFF:
            buf.handle = xrtBOAlloc(platform.device, size, XRT_BO_FLAGS_HOST_ONLY, platform.memory_bank);
            break;
        case FL_TR_NONE:
            buf.handle = xrtBOAlloc(platform.device, size, XRT_BO_FLAGS_NONE, platform.memory_bank);
            break;
        default:
            fprintf(stderr, "[FLETCHER_ALVEO] Error: unsupported data transfer mechanism.\n");
    }
    
    
    if (buf.handle == 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error: allocating device memory.\n");
        return FLETCHER_STATUS_ERROR;
    }

    *device_address = xrtBOAddress(buf.handle);
    buf.device_address = *device_address;
    buf.active = true;
    buf.size = size;
    buffer_map[buffer_map_size] = buf;
    buffer_map_size += 1;

    return FLETCHER_STATUS_OK;
}

uint64_t platformHostMalloc(uint8_t **host_ptr, int64_t size) {
    device_buffer buf;
    da_t device_address;

    buf.handle = xrtBOAlloc(platform.device, size, XRT_BO_FLAGS_HOST_ONLY, platform.memory_bank);
    if (buf.handle == 0) {
        fprintf(stderr, "[FLETCHER_ALVEO] Error: allocating host memory.\n");
        return FLETCHER_STATUS_ERROR;
    }
        
    *host_ptr = (uint8_t*)xrtBOMap(buf.handle);
    device_address = xrtBOAddress(buf.handle);
    buf.device_address = device_address;
    buf.host_address = (uint64_t)*host_ptr;
    buf.active = true;
    buf.size = size;
    buffer_map[buffer_map_size] = buf;
    buffer_map_size += 1;

    return FLETCHER_STATUS_OK;
}

fstatus_t platformDeviceFree(da_t device_address) {
    int rc;
    device_buffer *buffer;
    rc = getBufferByDA(device_address, & buffer);
    if (rc != 0) {
        return FLETCHER_STATUS_ERROR;
    }
    if (buffer->active) {
        rc = xrtBOFree(buffer->handle);
        buffer->active = false;
        if (rc != 0) {
            fprintf(stderr, "[FLETCHER_ALVEO] Error: free device buffer.\n");
            return FLETCHER_STATUS_ERROR;
        }
    } else {
        fprintf(stderr, "[FLETCHER_ALVEO] Error: double free of device buffer at 0x%016lX.\n", buffer->device_address);
        return FLETCHER_STATUS_ERROR;
    }
    return FLETCHER_STATUS_OK;
}

fstatus_t platformPrepareHostBuffer(const uint8_t *host_source,
    da_t *device_destination,
    int64_t size,
    int *alloced) {
    fstatus_t rc;

    switch (platform.transfer_mech) {
        case FL_TR_DEVICE_DMA:
            rc = platformDeviceMalloc(device_destination, size);
            if (rc != FLETCHER_STATUS_OK) {
                return FLETCHER_STATUS_ERROR;
            }

            rc = platformCopyHostToDevice(host_source, *device_destination, size);
            if (rc != 0) {
                fprintf(stderr, "[FLETCHER_ALVEO] Error: copying to device buffer (0x%016lX).\n", (unsigned long) *device_destination);
                return FLETCHER_STATUS_ERROR;
            }
            break;

        case FL_TR_HOST_SHADOW_BUFF:
            uint8_t *host_address;
            rc = platformHostMalloc(&host_address, size*sizeof(uint8_t));
            if (rc != FLETCHER_STATUS_OK) {
                return FLETCHER_STATUS_ERROR;
            }
              device_buffer *buffer;
             rc = getBufferByHA(host_address, &buffer);
             if (rc != FLETCHER_STATUS_OK) {
                return FLETCHER_STATUS_ERROR;
             }
             *device_destination = buffer->device_address;
             memcpy(host_address, host_source, size);
             
            break;

        case FL_TR_HOST_ONLY_BUFF:
            rc = getBufferByHA((uint8_t*)host_source, &buffer);
             if (rc != FLETCHER_STATUS_OK) {
                return FLETCHER_STATUS_ERROR;
             }
             *device_destination = buffer->device_address;             
            break;
        case FL_TR_NONE:
            break;
        default:
            fprintf(stderr, "[FLETCHER_ALVEO] Error: unsupported data transfer mechanism.\n");
    }


    debug_print("[FLETCHER_ALVEO] Preparing buffer for device. [host] 0x%016lX --> 0x%016lX (%10lu bytes).\n",
        (unsigned long) host_source,
        (unsigned long) *device_destination,
        size);

    return FLETCHER_STATUS_OK;
}

fstatus_t platformCacheHostBuffer(const uint8_t *host_source,
    da_t *device_destination,
    int64_t size) {
    fprintf(stderr, "[FLETCHER_ALVEO] Cache host buffer not supported\n");
    return FLETCHER_STATUS_ERROR;
}
