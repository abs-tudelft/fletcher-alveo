#include <string.h>

#include <rte_config.h>
#include <rte_eal.h>
#include <rte_debug.h>
#include <rte_pmd_qdma.h>

#include "fletcher/fletcher.h"
#include "fletcher_alveo.h"

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
  int argc = 1;
  char * argv[argc + 1];
  argv[0] = "test";
  argv[1] = NULL;

  int ret = rte_eal_init(argc, argv);
  if (ret < 0)
    rte_panic("Error with EAL initialization\n");

  return FLETCHER_STATUS_OK;
}

fstatus_t platformWriteMMIO(uint64_t offset, uint32_t value) {
  int portid = 0;
  uint32_t qid = 0;
  int ret = rte_pmd_qdma_set_mm_endpoint_addr(portid, qid, RTE_PMD_QDMA_TX, offset);
  if (ret < 0)
    rte_panic("Failed to set mm endpoint addr\n");
  return FLETCHER_STATUS_OK;
}

fstatus_t platformReadMMIO(uint64_t offset, uint32_t *value) {
  return FLETCHER_STATUS_ERROR;
}

fstatus_t platformCopyHostToDevice(const uint8_t *host_source,
                                   da_t device_destination, int64_t size) {
  return FLETCHER_STATUS_ERROR;
}

fstatus_t platformCopyDeviceToHost(const da_t device_source,
                                   uint8_t *host_destination, int64_t size) {
  return FLETCHER_STATUS_ERROR;
}

fstatus_t platformDeviceMalloc(da_t *device_address, int64_t size) {
  return FLETCHER_STATUS_ERROR;
}

fstatus_t platformDeviceFree(da_t device_address) {
  return FLETCHER_STATUS_ERROR;
}

fstatus_t platformPrepareHostBuffer(const uint8_t *host_source,
                                    da_t *device_destination, int64_t size,
                                    int *alloced) {
  return FLETCHER_STATUS_ERROR;
}

fstatus_t platformCacheHostBuffer(const uint8_t *host_source,
                                  da_t *device_destination, int64_t size) {
  return FLETCHER_STATUS_ERROR;
}

fstatus_t platformTerminate(void *arg) {
  return FLETCHER_STATUS_OK;
}
