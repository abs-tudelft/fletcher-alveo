#ifndef FLETCHER_ALVEO_H
#define FLETCHER_ALVEO_H

#ifdef __cplusplus
extern "C" {
#endif

typedef enum {FL_TR_DEVICE_DMA, FL_TR_HOST_SHADOW_BUFF, FL_TR_HOST_ONLY_BUFF, FL_TR_NONE} data_trans_mech;

typedef struct {
    uint8_t device_id;
    data_trans_mech transfer_mech;
    const char* xclbin;
    const char* kernel_name;
    uint64_t memory_bank;
} platform_init; 


#ifdef __cplusplus
}
#endif
#endif
