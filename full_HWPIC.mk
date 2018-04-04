# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/locales_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_n.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit from frd device
$(call inherit-product, device/huawei/HWPIC/device.mk)

PRODUCT_SYSTEM_PROPERTY_BLACKLIST := ro.product.model

# Vendor
PRODUCT_RESTRICT_VENDOR_FILES := false

# Device identifier. This must come after all inclusions
PRODUCT_NAME := full_HWPIC
PRODUCT_DEVICE := HWPIC
PRODUCT_BRAND := Huawei
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := Nova-2