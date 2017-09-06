export V?=0
ROOT := $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/../)
export TA_DEV_KIT_DIR=${ROOT}/optee_os/out/arm/export-ta_arm32
ca_name=test_function_call_client
uuid=08430668-3463-4c83-9593-a18350f54b57
filelist-tee-path=$(ROOT)/gen_rootfs/filelist-tee.txt

.PHONY: all
all:
	$(MAKE) -C host CROSS_COMPILE="$(HOST_CROSS_COMPILE)"
	$(MAKE) -C ta CROSS_COMPILE="$(TA_CROSS_COMPILE)"

.PHONY: clean
clean:
	$(MAKE) -C host clean
	$(MAKE) -C ta clean

add-to-file-list:
	@echo "# CPI test files" >> $(filelist-tee-path)
	@echo "file /bin/$(ca_name) $(PWD)/host/$(ca_name) 755 0 0" >> $(filelist-tee-path)
	@echo "file /lib/optee_armtz/$(uuid).ta $(PWD)/ta/$(uuid).ta 444 0 0" >> $(filelist-tee-path)
