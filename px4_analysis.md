1.run docker which is one of optee
``docker run -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix soptee``

2.Build PX4 with cross-compilation, then you will get px4 executable in rpi3
``make posix_rpi_cross``

3.I have tested px4 on host-side by editing common.mk in build folder of qemu_optee

4. Now I need to check compiliation method of collaborators

