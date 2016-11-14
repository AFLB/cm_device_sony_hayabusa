$(call inherit-product, device/sony/hayabusa/full_hayabusa.mk)

# Inherit CM common GSM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit CM common Phone stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=LT29i \
    BUILD_FINGERPRINT=Sony/LT29i/LT29i:4.3/9.2.A.1.215/KPv_tg:user/release-keys \
    PRIVATE_BUILD_DESC="LT29i-user 4.3 BLUE-3.2-R1-MR-140528-1410 11 test-keys"

CM_BUILDTYPE := EXPERIMENTAL

PRODUCT_NAME := cm_hayabusa
PRODUCT_DEVICE := hayabusa
