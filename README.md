# cpi_cctest

echo "# testing" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/tinferrer/testing.git
git push -u origin master


clang -target arm-linux-gnueabihf --sysroot=/usr/arm-linux-gnueabihf -static hello.c -emit-llvm -c

clang -target arm-linux-gnueabihf --sysroot=/usr/aarm-linux-gnueabihfi -static test_function_call_client.c -emit-llvm -c -I /home/kijin/devel/optee/optee_client/out/export/include/ -I ../ta/include/

clang -target arm-linux-gnueabihf --sysroot=/usr/arm-linux-gnueabihf -static test_function_call_client.c -emit-llvm -c -I /home/kijin/devel/optee/optee_client/out/export/include/ -I ../ta/include/

clang -target arm-linux-gnueabi --sysroot=/usr/arm-linux-gnueabi -static test_function_call_client.c -emit-llvm -c -I /home/kijin/devel/optee/optee_client/out/export/include/ -I ../ta/include/


llc test_function_call_client.bc 

arm-linux-gnueabihf-gcc -c test_function_call_client.s -I /home/kijin/devel/optee/optee_client/out/export/include/




Yes, You can use gcc to compile your asm code. Use -c for compilation like this:

gcc -c file.S -o file.o

This will give object code file named file.o. To invoke linker perform following after above command:

gcc file.o -o file

shareimprove this answer
	
answered Aug 25 '11 at 12:31
cyber_raj
1,027821

