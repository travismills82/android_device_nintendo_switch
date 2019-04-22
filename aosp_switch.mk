# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
#$(call inherit-product, $(SRC_TARGET_DIR)/product/mainline.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

TARGET_GRAPHICS_DRIVER := swiftshader

$(call inherit-product, device/nintendo/switch/switch.mk)

PRODUCT_NAME := aosp_switch
PRODUCT_DEVICE := switch
PRODUCT_BRAND := Nintendo
PRODUCT_MODEL := Nintendo Switch
PRODUCT_MANUFACTURER := Nvidia
