#include <string.h>

#include <rte_ethdev.h>
#include <rte_eal.h>
#include <rte_pmd_qdma.h>
#include <rte_memzone.h>

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
  char *argv[argc + 1];
  argv[0] = "test";
  argv[1] = NULL;

  // Initialize the Environment Abstraction Layer (EAL)
  int ret = rte_eal_init(argc, argv);
  if (ret < 0)
    rte_exit(EXIT_FAILURE, "Error with EAL initialization - %s\n",
             rte_strerror(rte_errno));

  struct rte_eth_conf port_conf;


  ret = rte_eth_dev_configure(0, 1, 1, &port_conf);
  if (ret < 0)
    rte_exit(EXIT_FAILURE, "Device configuration failed - %s\n",
             rte_strerror(rte_errno));

  // Reserve a portion of physical memory with alignment on 4k boundary
  const struct rte_memzone *memzone;
  memzone = rte_memzone_reserve_aligned(
      "eth_devices", RTE_MAX_ETHPORTS * sizeof(*rte_eth_devices), 0, 0, 4096);
  if (memzone == NULL)
    rte_exit(EXIT_FAILURE, "eth_devices memzone allocation failed - %s\n", rte_strerror(rte_errno));
  //RTE_MEMZONE_IOVA_CONTIG

  return FLETCHER_STATUS_OK;
}

fstatus_t platformWriteMMIO(uint64_t offset, uint32_t value) {
  int portid = 0;
  uint32_t qid = 0;
  // int ret =
  //     rte_pmd_qdma_set_mm_endpoint_addr(portid, qid, RTE_PMD_QDMA_TX, offset);
  // if (ret < 0) rte_panic("Failed to set mm endpoint addr\n");
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

fstatus_t platformTerminate(void *arg) { return FLETCHER_STATUS_OK; }
