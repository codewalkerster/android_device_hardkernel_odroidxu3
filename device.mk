#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/hardkernel/odroidxu3/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

include $(LOCAL_PATH)/BoardConfig.mk

DEVICE_PACKAGE_OVERLAYS := \
    device/hardkernel/odroidxu3/overlay

# Init files
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/conf/init.odroidxu3.rc:root/init.odroidxu3.rc \
    device/hardkernel/odroidxu3/conf/init.odroidxu3.usb.rc:root/init.odroidxu3.usb.rc \
    device/hardkernel/odroidxu3/conf/fstab.odroidxu3:root/fstab.odroidxu3 \
    device/hardkernel/odroidxu3/conf/fstab.odroidxu3.sdboot:root/fstab.odroidxu3.sdboot

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/conf/ueventd.odroidxu3.rc:root/ueventd.odroidxu3.rc

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# audio
PRODUCT_PACKAGES += \
    audio_policy.odroidxu3 \
    audio.primary.odroidxu3 \
    audio.a2dp.default \
    audio.usb.default \
    tinyplay \
    tinymix \
    tinycap

# audio mixer paths
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/makebootini.sh:system/bin/makebootini.sh \
    device/hardkernel/odroidxu3/rotation.sh:system/bin/rotation.sh \
    device/hardkernel/odroidxu3/fb_ili9340.sh:system/bin/fb_ili9340.sh \
    device/hardkernel/odroidxu3/ogst.sh:system/bin/ogst.sh \
    device/hardkernel/odroidxu3/boot.ini.template:system/etc/boot.ini.template

# Libs
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# for now include gralloc here. should come from hardware/samsung_slsi/exynos5
PRODUCT_PACKAGES += \
    gralloc.exynos5

PRODUCT_PACKAGES += \
    libion \
    libcec

PRODUCT_PACKAGES += \
    camera.odroidxu3

# Video Editor
PRODUCT_PACKAGES += \
    VideoEditorGoogle

# Misc other modules
PRODUCT_PACKAGES += \
    lights.odroidxu3

# MobiCore setup
PRODUCT_PACKAGES += \
    libMcClient \
    libMcRegistry \
    libgdmcprov \
    mcDriverDaemon

# WideVine modules
PRODUCT_PACKAGES += \
    com.google.widevine.software.drm.xml \
    com.google.widevine.software.drm \
    WidevineSamplePlayer \
    libdrmwvmplugin \
    libwvm \
    libWVStreamControlAPI_L1 \
    libwvdrm_L1

# WideVine DASH modules
PRODUCT_PACKAGES += \
    libwvdrmengine

# Custom Update packages
PRODUCT_PACKAGES += \
    OdroidUpdater \
    Utility

PRODUCT_PACKAGES += \
    Superuser \
    su

# gps
PRODUCT_PACKAGES += \
    gps.odroidxu3

# odroid sensor
PRODUCT_PACKAGES += \
    sensors.odroidxu3

# odroid sensor
PRODUCT_PACKAGES += \
    usb_modeswitch

# WideVine DRM setup
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/media_profiles.xml:system/etc/media_profiles.xml \
    device/hardkernel/odroidxu3/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml

#cp kl file for adc keyboard
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/Vendor_0001_Product_0001.kl:/system/usr/keylayout/Vendor_0001_Product_0001.kl

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rt2870.bin:root/lib/firmware/rt2870.bin \
    $(LOCAL_PATH)/rtl8712u.bin:root/lib/firmware/rtlwifi/rtl8712u.bin \
    $(LOCAL_PATH)/wifi_id_list.txt:system/etc/wifi_id_list.txt

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/odroid-usbgps.xml:root/odroid-usbgps.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/format_userdata.sh:/system/bin/format_userdata.sh \
    $(LOCAL_PATH)/mk_e2fs:/system/bin/mk_e2fs

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/usb_modeswitch.conf.template:system/etc/usb_modeswitch.conf.template

PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp \
    ro.kernel.android.checkjni=0

PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi xxhdpi

$(call inherit-product-if-exists, device/hardkernel/proprietary/proprietary.mk)

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product-if-exists, vendor/samsung_slsi/exynos5422/exynos5422-vendor.mk)

PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi/exynos5422/exynos5422.mk)
