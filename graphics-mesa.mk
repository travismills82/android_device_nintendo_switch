PRODUCT_PACKAGES += \
	libGLES_mesa \
	gralloc.gbm \
	hwcomposer.drm

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware.gralloc=gbm \
	ro.hardware.hwcomposer=drm \
	hwc.drm.device=/dev/dri/card1 \
	gralloc.gbm.device=/dev/dri/renderD129 \
	drm.gpu.vendor_name=tegra
