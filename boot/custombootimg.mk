LOCAL_PATH := $(call my-dir)

HIJACK_PATH := $(PRODUCT_OUT)/system/hijack

INSTALLED_BOOTIMAGE_TARGET := $(PRODUCT_OUT)/boot.img
$(INSTALLED_BOOTIMAGE_TARGET): $(PRODUCT_OUT)/kernel \
		$(INSTALLED_RAMDISK_TARGET) \
		$(PRODUCT_OUT)/utilities/busybox
	@echo -e ${CL_CYN}"----- Optimizing boot ramdisk ------"${CL_RST}
	$(hide) mkdir -p $(HIJACK_PATH)
	$(hide) $(MKBOOTFS) $(TARGET_ROOT_OUT) > $(HIJACK_PATH)/ramdisk.cpio
	$(hide) cp $(PRODUCT_OUT)/utilities/busybox $(HIJACK_PATH)/
	@echo -e ${CL_CYN}"----- Copy prebuilt stock kernel ------"${CL_RST}
	$(hide) cp $(LOCAL_PATH)/boot.elf $(INSTALLED_BOOTIMAGE_TARGET)

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk) $(recovery_kernel)
	@echo -e ${CL_CYN}"----- Optimizing recovery ramdisk ------"${CL_RST}
	$(hide) mkdir -p $(HIJACK_PATH)
	$(hide) cp $(recovery_ramdisk) $(HIJACK_PATH)/
