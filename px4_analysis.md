1.run docker which is one of optee

``docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix soptee``

2.Build PX4 with cross-compilation, then you will get px4 executable in rpi3

``make posix_rpi_cross``

3.I have tested px4 on host-side by editing common.mk in build folder of qemu_optee

4. Now I need to check compiliation method of collaborators


../../modules/sensors/libmodules__sensors.a(host.o): In function `prologue':
host.bc:(.text+0x3134): undefined reference to `TEEC_OpenSession'
../../modules/sensors/libmodules__sensors.a(host.o): In function `epilogue':
host.bc:(.text+0x31f0): undefined reference to `TEEC_CloseSession'
host.bc:(.text+0x31f8): undefined reference to `TEEC_FinalizeContext'
../../modules/sensors/libmodules__sensors.a(host.o): In function `RPC_secureFn':
host.bc:(.text+0x3260): undefined reference to `TEEC_AllocateSharedMemory'
host.bc:(.text+0x32d4): undefined reference to `TEEC_InvokeCommand'
collect2: error: ld returned 1 exit status
make[3]: *** [px4] Error 1
make[2]: *** [src/firmware/posix/CMakeFiles/px4.dir/all] Error 2
make[1]: *** [all] Error 2
make: *** [posix_rpi_cross] Error 2

