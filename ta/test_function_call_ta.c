#define STR_TRACE_USER_TA "HELLO_WORLD"
#include <tee_internal_api.h>
#include <tee_internal_api_extensions.h>
#include <string.h>
#include "RPC_myCriticalFunction_Includes.h"


TEE_Result TA_CreateEntryPoint(void){return TEE_SUCCESS;}

void TA_DestroyEntryPoint(void){}

TEE_Result TA_OpenSessionEntryPoint(uint32_t param_types, TEE_Param params[4], void **sess_ctx)
{
uint32_t exp_param_types = TEE_PARAM_TYPES(TEE_PARAM_TYPE_NONE, TEE_PARAM_TYPE_NONE, TEE_PARAM_TYPE_NONE, TEE_PARAM_TYPE_NONE);
if (param_types != exp_param_types)
return TEE_ERROR_BAD_PARAMETERS;
(void)&params;
(void)&sess_ctx;
DMSG("Hello World!\n");
return TEE_SUCCESS;
}

void TA_CloseSessionEntryPoint(void *sess_ctx){
(void)&sess_ctx;
DMSG("Goodbye!\n");
}

static TEE_Result myCriticalFunction_WRAPPER(uint32_t param_types, TEE_Param params[4])
{
uint32_t exp_param_types = TEE_PARAM_TYPES(TEE_PARAM_TYPE_VALUE_INOUT, TEE_PARAM_TYPE_MEMREF_INOUT, TEE_PARAM_TYPE_NONE, TEE_PARAM_TYPE_MEMREF_INOUT);
if (param_types != exp_param_types)
return TEE_ERROR_BAD_PARAMETERS;
int a;
double* b;
float* c;
char* d;
unsigned int *ptr = (unsigned int *)params[1].memref.buffer;
int move = 0; 
int len = 0; 
read_basic(&a, &ptr, sizeof(int));
read_bytearray(&b, &ptr);
read_bytearray(&c, &ptr);
read_bytearray(&d, &ptr);
DMSG("call client function!!!");
int ret = myCriticalFunction(a, b, c, d);
unsigned int *retPtr = (unsigned int *)params[3].memref.buffer;
int bufferLen  = sizeof(int);
memcpy(retPtr, &ret, bufferLen);
ptr = (unsigned int *)params[1].memref.buffer;
move = 0; 
len = 0; 
write_basic(&ptr, &a, sizeof(int));
write_bytearray(&ptr, b, 32);
write_bytearray(&ptr, c, 32);
write_bytearray(&ptr, d, 64);
return TEE_SUCCESS;
}

TEE_Result TA_InvokeCommandEntryPoint(void *sess_ctx, uint32_t cmd_id, uint32_t param_types, TEE_Param params[4])
{
(void)&sess_ctx;
switch(cmd_id) {
case TA_myCriticalFunction_CMD_WRAPPER :return myCriticalFunction_WRAPPER(param_types, params);
default:
return TEE_ERROR_BAD_PARAMETERS;
}}

