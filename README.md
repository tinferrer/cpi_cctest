# cpi_cctest

echo "# testing" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/tinferrer/testing.git
git push -u origin master

clang -target arm-linux-gnueabi --sysroot=/usr/arm-linux-gnueabi -static test_function_call_client.c -emit-llvm -c -I /home/kijin/devel/optee/optee_client/out/export/include/ -I ../ta/include/

llc test_function_call_client.bc 
