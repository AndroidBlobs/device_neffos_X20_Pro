# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from X20_Pro device
$(call inherit-product, $(LOCAL_PATH)/device.mk)

PRODUCT_BRAND := neffos
PRODUCT_DEVICE := X20_Pro
PRODUCT_MANUFACTURER := neffos
PRODUCT_NAME := lineage_X20_Pro
PRODUCT_MODEL := Neffos X20 Pro

PRODUCT_GMS_CLIENTID_BASE := android-neffos
TARGET_VENDOR := neffos
TARGET_VENDOR_PRODUCT_NAME := X20_Pro
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="TP9131A-user 9 PPR1.180610.011 3118 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := TP9131A-user-9-PPR1.180610.011-3118-release-keys
