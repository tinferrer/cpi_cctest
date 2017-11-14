# cpi_cctest

How to Cross-Complie
This document is based on https://github.com/jenswi-linaro/lcu14_optee_hello_world

1. clone this repository and https://github.com/jenswi-linaro/lcu14_optee_hello_world and cd host

	```
	git clone https://github.com/jenswi-linaro/lcu14_optee_hello_world
	cd host
	```

2. clang's cross compile to the target arm-linux-gnueabihf with optee. Before this, you need to install arm-linux and it assumes you have /usr/arm-linux-gnueabihf(https://packages.ubuntu.com/trusty/devel/gcc-arm-linux-gnueabihf).
And please check optee build in https://github.com/OP-TEE/build.(target:default.xml)

	```
	clang -target arm-linux-gnueabihf --sysroot=/usr/arm-linux-gnueabihf -static hello_world.c -emit-llvm -c -I ~/devel/optee/optee_client/out/export/include/ -I ../ta/include/

	```

3. then compile the IR with llvm system compiler
	```
	llc hello_world.bc
	```
4. you will get the hello_world.s


5. Then you can continue the cross-compilation at docker. Copy the intermidate binary code to docker 
	```
	sudo docker exec -it cpi-test bash
	```
6. .s to .o
	```
	~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -c hello_world.s -o test_function_call_client.o -I ~/qemu-optee/optee_client/out/export/include/
	```

7. .o to executable hello_world
	```
	~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -o hello_world hello_world.o ~/qemu-optee/optee_client/out/export/lib/libteec.so
	```


9. Don't forget to change the ~/qemu-optee/build/Makefile and ~/qemu-optee/build/common.mk in case you deal with different names of the above project.


#For ta part

1. Host cross-compilation: clone this repository and change directory to lcu14_optee_hello_world/ta

	```
	cd ta
	```
2. Clang compile for hello_world_ta.bc and hello_world_ta.s
	```
	clang -target arm-linux-gnueabihf --sysroot=/usr/arm-linux-gnueabihf -static hello_world_ta.c user_ta_header_defines.h -emit-llvm -c -I ./include/ -I ~/devel/optee/optee_os/out/arm/export-ta_arm32/include/
	```
	```
	llc hello_world_ta.bc
	```
2. Clang compile for user_ta_header.bc and user_ta_header.s
	```
	clang -target arm-linux-gnueabihf --sysroot=/usr/arm-linux-gnueabihf -static hello_world_ta.c ~/devel/optee/optee_os/out/arm/export-ta_arm32/src/user_ta_header.c -emit-llvm -c -I ./include/ -I ~/devel/optee/optee_os/out/arm/export-ta_arm32/include/ -I .
	```
	```
	llc user_ta_header.bc
	```
5. Then you can continue the cross-compilation at docker. Copy the intermidate binary code to docker 
	```
	sudo docker exec -it cpi-test bash

6. Generate ta.lds (it seems not to require .c)

	```
	~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-cpp -Wp,-P,-MT,ta.lds,-MD,./.ta.ld.d -DASM=1 -nostdinc -isystem ~/qemu-optee/toolchains/aarch32/bin/../lib/gcc/arm-linux-gnueabihf/6.2.1/include -I./include -I. -DARM32=1 -D__ILP32__=1 -DTRACE_LEVEL=2 -I. -I/~/qemu-optee/optee_os/out/arm/export-ta_arm32/include ~/qemu-optee/optee_os/out/arm/export-ta_arm32/src/ta.ld.S > ta.lds
	```
7. Generate .elf, map
	```
	~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-ld.bfd -pie -T ./ta.lds -Map=./8aaaf200-2450-11e4-abe2-0002a5d5c51b.map --sort-section=alignment  ./test_function_call_ta.o ./user_ta_header.o -L /home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/lib -lutee -lpng -lzlib -lutils -lmpa -lutee -lutils -o 8aaaf200-2450-11e4-abe2-0002a5d5c51b.elf
	```

8.   Generate .dmp  
	```
	~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-objdump -l -x -d 8aaaf200-2450-11e4-abe2-0002a5d5c51b.elf > 8aaaf200-2450-11e4-abe2-0002a5d5c51b.dmp
	```
8.   Generate .stripped.elf
	```
	 ~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-objcopy --strip-unneeded 8aaaf200-2450-11e4-abe2-0002a5d5c51b.elf 8aaaf200-2450-11e4-abe2-0002a5d5c51b.stripped.elf
	```

9.   Generate .ta	
	```
	/home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/scripts/sign.py --key /home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/keys/default_ta.pem --in 8aaaf200-2450-11e4-abe2-0002a5d5c51b.stripped.elf --out 8aaaf200-2450-11e4-abe2-0002a5d5c51b.ta
	```


10. Copy cpi_test to qemu-optee and make & run

	```
	cp -r ${pwd}/lcu14_optee_hello_world ~/qemu-optee/
	cd ~/qemu-optee/build
	make all run
	```  
	
	
# Coarsely flush jre(it was jre.tar.gz) to normal world
copy jre to ```/bin/jre``` using ```common.mk```
```
@if [ -e $(JRE_PATH)/jre ]; then \
	echo "file /bin/jre" \
	"$(JRE_PATH)/jre 755 0 0"	>> $(fl); \
fi
```

(In normal world terminal)
```
cd /bin
mv jre jre.tar.gz && tar xvf jre.tar.gz && cp -r jre/bin/* /bin/ && cp -r jre/lib/* /lib/
```
# Secure Bit-coin wallet build and test
```
cd /home/optee/qemu-optee
git clone https://github.com/Miraje/TrustZone-backed-Bitcoin-Wallet.git wallet
cd wallet
```
```
 export HOST_CROSS_COMPILE=$PWD/../toolchains/aarch32/bin/arm-linux-gnueabihf-

 export TA_CROSS_COMPILE=$PWD/../toolchains/aarch32/bin/arm-linux-gnueabihf-
 export TEEC_EXPORT=$PWD/../optee_client/out/export
 export TA_DEV_KIT_DIR=$PWD/../optee_os/out/arm/export-ta_arm32
```
# build
```
  make
```
# edit common.mk
```
BITCOIN_PATH                    ?= $(ROOT)/wallet
...
        @if [ -e $(BITCOIN_PATH)/host/wallet ]; then \
                echo "file /bin/wallet" \
                        "$(BITCOIN_PATH)/host/wallet 755 0 0"   >> $(fl); \
                echo "file /lib/optee_armtz/f894e6e0-1215-11e6-92810002a5d5c51b.ta" \
                        "$(BITCOIN_PATH)/ta/f894e6e0-1215-11e6-92810002a5d5c51b.ta" \
                "444 0 0" >> $(fl); \
        fi

```



