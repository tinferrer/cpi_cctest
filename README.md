# cpi_cctest



1. Host cross-compilation: clone this repository and change directory to cpi_test/host

	```
	git clone https://github.com/tinferrer/cpi_cctest.git
	cd cpi_test/host
	```

2. clang's cross compile to the target arm-linux-gnueabihf with optee. Before this, you need to install arm-linux and it assumes you have /usr/arm-linux-gnueabihf(https://packages.ubuntu.com/trusty/devel/gcc-arm-linux-gnueabihf).
And please check optee build in https://github.com/OP-TEE/build.

	```
	clang -target arm-linux-gnueabihf --sysroot=/usr/arm-linux-gnueabihf -static test_function_call_client.c -emit-llvm -c -I ~/devel/optee/optee_client/out/export/include/ -I ../ta/include/

	```

3. then compile the IR with llvm system compiler
	```
	llc test_function_call_client.bc
	```
4. you will get the test_function_call_client.s


5. Then you can continue the cross-compilation at docker. Copy the intermidate binary code to docker 
	```
	sudo docker exec -it cpi-test bash
	```
6. .s to .o
	```
	~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -c test_function_call_client.s -o test_function_call_client.o -I ~/qemu-optee/optee_client/out/export/include/
	```

7. .o to executable test_function_call_client
	```
	~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -o test_function_call_client test_function_call_client.o ~/qemu-optee/optee_client/out/export/lib/libteec.so
	```

8. Copy cpi_test to qemu-optee and make & run
	```
	cp -r ${pwd}/cpi_test ~/qemu-optee/
	cd ~/qemu-optee/build
	make all run
	```
9. Don't forget to change the ~/qemu-optee/build/Makefile and ~/qemu-optee/build/common.mk in case you deal with different names of the above project.

  
