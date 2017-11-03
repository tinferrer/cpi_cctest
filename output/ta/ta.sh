#prepare##############
rm .ta.ld.d 08* ta.lds ta.o ta.s
cp ~/cpi_test/ta/ta.s .
######################


/home/optee/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-gcc -fPIC  -Wno-error -I/home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/include -I./include -c -o ta.o ta.s

/home/optee/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-cpp -Wp,-P,-MT,ta.lds,-MD,./.ta.ld.d -DASM=1 -nostdinc -isystem /home/optee/qemu-optee/toolchains/aarch32/bin/../lib/gcc/arm-linux-gnueabihf/6.2.1/include -I./include -I. -DARM32=1 -D__ILP32__=1 -DTRACE_LEVEL=2 -I. -I/home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/include /home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/src/ta.ld.S > ta.lds


/home/optee/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-ld.bfd -pie -T ./ta.lds -Map=./08430668-3463-4c83-9593-a18350f54b57.map --sort-section=alignment  ./ta.o ./user_ta_header.o  -L /home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/lib -lutee -lpng -lzlib -lutils -lmpa -lutee -lutils  -o 08430668-3463-4c83-9593-a18350f54b57.elf


/home/optee/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-objdump -l -x -d 08430668-3463-4c83-9593-a18350f54b57.elf > 08430668-3463-4c83-9593-a18350f54b57.dmp


/home/optee/qemu-optee/toolchains/aarch32/bin/arm-linux-gnueabihf-objcopy --strip-unneeded 08430668-3463-4c83-9593-a18350f54b57.elf 08430668-3463-4c83-9593-a18350f54b57.stripped.elf


/home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/scripts/sign.py --key /home/optee/qemu-optee/optee_os/out/arm/export-ta_arm32/keys/default_ta.pem --in 08430668-3463-4c83-9593-a18350f54b57.stripped.elf --out 08430668-3463-4c83-9593-a18350f54b57.ta

