include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

ifeq ($(TARGET_GRAPHICS_DRIVER),mesa)
include device/nintendo/switch/graphics-mesa.mk
endif

ifeq ($(TARGET_GRAPHICS_DRIVER),nvgpu)
include vendor/nvidia/nvgpu/nvgpu-vendor.mk
endif

ifeq ($(TARGET_GRAPHICS_DRIVER),swiftshader)
include device/nintendo/switch/graphics-swiftshader.mk
endif

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=213 \
	wifi.interface=wlan0

# system packages
PRODUCT_PACKAGES += \
	wpa_supplicant \
	wpa_supplicant.conf

# hardware/interfaces
PRODUCT_PACKAGES += \
	android.hardware.graphics.allocator@2.0-impl \
	android.hardware.graphics.allocator@2.0-service \
	android.hardware.graphics.mapper@2.0-impl \
	android.hardware.graphics.composer@2.1-impl \
	android.hardware.audio@2.0-impl \
	android.hardware.audio.effect@2.0-impl \
	android.hardware.keymaster@3.0-impl \
	android.hardware.memtrack@1.0-impl

PRODUCT_PACKAGES += android.hardware.bluetooth@1.0-service.btlinux

PRODUCT_COPY_FILES := \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	$(PRODUCT_COPY_FILES)

fw_files := $(shell git -C external/linux-firmware ls-files | grep -v -E '(WHENCE|LICEN|NOTICE|README|*.txt)')
PRODUCT_COPY_FILES := $(join \
	$(patsubst %,external/linux-firmware/%, $(fw_files)), \
	$(patsubst %,:$(TARGET_COPY_OUT_VENDOR)/firmware/%, $(fw_files))) \
	$(PRODUCT_COPY_FILES)
# system configurations
PRODUCT_COPY_FILES := \
	hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	$(LOCAL_PATH)/manifest.xml:system/vendor/manifest.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	$(LOCAL_PATH)/init.switch.rc:root/init.switch.rc \
	$(LOCAL_PATH)/init.switch.usb.rc:root/init.switch.usb.rc \
	$(LOCAL_PATH)/fstab.switch:root/fstab.switch \
	$(LOCAL_PATH)/firmware/brcm/BCM.hcd:root/lib/firmware/brcm/BCM.hcd \
	$(LOCAL_PATH)/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
	$(PRODUCT_COPY_FILES)

# media configurations
PRODUCT_COPY_FILES := \
	device/generic/goldfish/camera/media_profiles.xml:system/etc/media_profiles.xml \
	device/generic/goldfish/camera/media_codecs.xml:system/etc/media_codecs.xml \
	frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	$(PRODUCT_COPY_FILES)

DEVICE_PACKAGE_OVERLAYS := device/nintendo/switch/overlay
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_LOCALES := en_US,ko_KR,ja_JP,zh_CN,hi_IN,en_GB,de_DE,fr_FR,it_IT,ru_RU,es_ES,pt_PT,nl_BE,nl_NL
