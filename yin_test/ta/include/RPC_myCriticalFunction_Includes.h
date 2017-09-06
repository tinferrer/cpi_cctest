
#include <string.h>
#include <stdlib.h>


#define TA_myCriticalFunction_CMD_WRAPPER 0
#define TA_PROGRAM_UUID {0x8430668, 0x3463, 0x4c83,{0x95, 0x93, 0xa1, 0x83, 0x50, 0xf5, 0x4b, 0x57}}

static void read_basic(void* dest, unsigned int **src, int move){
memcpy(dest, *src, move);
*src += move;
}

static void read_bytearray(void** dest, unsigned int **src) {
int move = sizeof(int);
int len = 0;
memcpy(&len, *src, move);
*src += move;
move = len;
*dest = malloc(move);
memcpy(*dest, *src, move);
*src += move;
}

static void write_basic(unsigned int **p, void* src, int move) {
memcpy(*p, src, move);
*p += move;
}

static void write_bytearray(unsigned int **p, void* src, int len) {
int move = sizeof(int);
memcpy(*p, &len, move);
*p += move;
move = len;
memcpy(*p, src, move);
*p += move;
}

