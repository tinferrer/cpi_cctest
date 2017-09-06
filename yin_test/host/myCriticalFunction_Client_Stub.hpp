#include <tee_client_api.h>
#include <err.h>
#include <stdio.h>
#include <string.h>
#include <RPC_myCriticalFunction_Includes.h>
extern int vGlobal;
static TEEC_Result res;
static TEEC_Context ctx;
static TEEC_Session sess;
static TEEC_Operation op;
static TEEC_UUID uuid = TA_PROGRAM_UUID;
static uint32_t err_origin;
static TEEC_SharedMemory commsSM;
static TEEC_SharedMemory resultSM;

void prologue()  {
res=TEEC_InitializeContext(NULL, &ctx);
if(res != TEEC_SUCCESS)errx(1, " TEEC_InitializeContext failed with code 0x%x ", res);
res=TEEC_OpenSession(&ctx, &sess, &uuid, TEEC_LOGIN_PUBLIC, NULL, NULL, &err_origin);
if(res != TEEC_SUCCESS)errx(1, "TEEC_Opensession failed with code 0x%x origin 0x%x", res, err_origin);
}

void epilogue()  {
TEEC_CloseSession(&sess);
TEEC_FinalizeContext(&ctx);
}

int RPC_myCriticalFunction( int a, double* b, float* c, char* d)  {
prologue();
memset(&op, 0, sizeof(op));
op.paramTypes=TEEC_PARAM_TYPES(TEEC_VALUE_INOUT, TEEC_MEMREF_PARTIAL_INOUT, TEEC_NONE, TEEC_MEMREF_PARTIAL_INOUT);

resultSM.size = 1024;
resultSM.flags = TEEC_MEM_INPUT | TEEC_MEM_OUTPUT;
res = TEEC_AllocateSharedMemory(&ctx,&resultSM);
if(res != TEEC_SUCCESS)errx(1, "TEEC_InvokeCommand failed with code 0x%x origin 0x%x", res, err_origin);
op.params[3].memref.parent = &resultSM;
op.params[3].memref.offset = 0;
op.params[3].memref.size = resultSM.size;

commsSM.size = sizeof(int) + sizeof(int) + 32 + sizeof(int) + 32 + sizeof(int) + 64;
commsSM.flags = TEEC_MEM_INPUT | TEEC_MEM_OUTPUT;
res = TEEC_AllocateSharedMemory(&ctx,&commsSM);
if(res != TEEC_SUCCESS)errx(1, "TEEC_InvokeCommand failed with code 0x%x origin 0x%x", res, err_origin);
op.params[1].memref.parent = &commsSM;
op.params[1].memref.offset = 0;
op.params[1].memref.size = commsSM.size;
unsigned int *ptr = (unsigned int *)commsSM.buffer;
int move = 0; 
int len = 0; 
write_basic(&ptr, &a, sizeof(int));
write_bytearray(&ptr, b, 32);
write_bytearray(&ptr, c, 32);
write_bytearray(&ptr, d, 64);
res = TEEC_InvokeCommand(&sess, TA_myCriticalFunction_CMD_WRAPPER, &op, &err_origin); 
if(res != TEEC_SUCCESS)errx(1, "TEEC_InvokeCommand failed with code 0x%x origin 0x%x", res, err_origin);
ptr = (unsigned int *)commsSM.buffer;
move = 0; 
len = 0; 
read_basic(&a, &ptr, sizeof(int));
read_bytearray(&b, &ptr);
read_bytearray(&c, &ptr);
read_bytearray(&d, &ptr);
int ret ;
unsigned int * retPtr =  (unsigned int *)resultSM.buffer;
int size = sizeof(int);
memcpy(&ret, retPtr, size);
epilogue();
return ret;
}

