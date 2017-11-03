#rm host host.o host.s
#cp ~/cpi_test/host/host.s .



/home/optee/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -fPIC -g -c host.s -o host.o -I ~/qemu-optee/optee_client/out/export/include/

/home/optee/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -g -shared -Wl,-soname,libSNOb.so -o libSNOb.so libSNOb.o -lc

#~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -o host host.o ~/qemu-optee/optee_client/out/export/lib/libteec.so



#/home/optee/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -c aes_test.s -o host.o -I~/qemu-optee/optee_client/out/export/include/ 
#~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -I~/qemu-optee/my_test/host/headers/ host.o libtomcrypt.a ~/qemu-optee/optee_client/out/export/lib/libteec.so -o host
#~/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -I./headers/ -o host libtomcrypt.a host.o ~/qemu-optee/optee_client/out/export/lib/libteec.so

