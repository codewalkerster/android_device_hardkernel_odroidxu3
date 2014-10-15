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

# Libs
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

# for now include gralloc here. should come from hardware/samsung_slsi/exynos5
PRODUCT_PACKAGES += \
    gralloc.exynos5

PRODUCT_PACKAGES += \
    libion

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
    Utility \
    ExpansionBoardExample

PRODUCT_PACKAGES += \
    Superuser \
    su

# gps
PRODUCT_PACKAGES += \
    gps.odroidxu3

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

PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/drivers/rtl8192cu.ko:system/lib/modules/rtl8192cu.ko \
    device/hardkernel/odroidxu3/drivers/rt5572sta.ko:system/lib/modules/rt5572sta.ko \
    device/hardkernel/odroidxu3/drivers/RT2870STA.dat:system/etc/Wireless/RT2870STA/RT2870STA.dat

#
# USB Ethernet Module
#
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/drivers/smsc95xx.ko:system/lib/modules/smsc95xx.ko \
    device/hardkernel/odroidxu3/drivers/ax88179_178a.ko:system/lib/modules/ax88179_178a.ko

#
# sound card Module
#
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu3/drivers/snd-usb-audio.ko:system/lib/modules/snd-usb-audio.ko \
    device/hardkernel/odroidxu3/drivers/snd-usbmidi-lib.ko:system/lib/modules/snd-usbmidi-lib.ko


# Input device calibration files
PRODUCT_COPY_FILES += \
    device/hardkernel/proprietary/bin/odroid-ts.idc:system/usr/idc/odroid-ts.idc \
    device/hardkernel/proprietary/bin/odroid-ts.kl:system/usr/keylayout/odroid-ts.kl \
    device/hardkernel/proprietary/bin/odroid-ts.kcm:system/usr/keylayout/odroid-ts.kcm \
    device/hardkernel/proprietary/bin/odroid-keypad.kl:system/usr/keylayout/odroid-keypad.kl \
    device/hardkernel/proprietary/bin/odroid-keypad.kcm:system/usr/keychars/odroid-keypad.kcm

# for USB HID MULTITOUCH
PRODUCT_COPY_FILES += \
    device/hardkernel/proprietary/bin/Vendor_03fc_Product_05d8.idc:system/usr/idc/Vendor_03fc_Product_05d8.idc \
    device/hardkernel/proprietary/bin/Vendor_1870_Product_0119.idc:system/usr/idc/Vendor_1870_Product_0119.idc \
    device/hardkernel/proprietary/bin/Vendor_1870_Product_0100.idc:system/usr/idc/Vendor_1870_Product_0100.idc \
    device/hardkernel/proprietary/bin/Vendor_2808_Product_81c9.idc:system/usr/idc/Vendor_2808_Product_81c9.idc

# XBox 360 Controller kl keymaps
PRODUCT_COPY_FILES += \
    device/hardkernel/proprietary/bin/Vendor_045e_Product_0291.kl:system/usr/keylayout/Vendor_045e_Product_0291.kl \
    device/hardkernel/proprietary/bin/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
    device/hardkernel/proprietary/bin/Vendor_045e_Product_0719.kcm:system/usr/keychars/Vendor_045e_Product_0719.kcm

PRODUCT_COPY_FILES += \
    device/hardkernel/proprietary/apk/Ultra_Explorer.apk:system/app/Ultra_Explorer.apk \
    device/hardkernel/proprietary/apk/jackpal.androidterm.apk:system/app/jackpal.androidterm.apk \
    device/hardkernel/proprietary/lib/libjackpal-androidterm4.so:system/lib/libjackpal-androidterm4.so

PRODUCT_COPY_FILES += \
    device/hardkernel/proprietary/apk/DicePlayer.apk:system/app/DicePlayer.apk \
    device/hardkernel/proprietary/lib/libSoundTouch.so:system/lib/libSoundTouch.so \
    device/hardkernel/proprietary/lib/libdice_kk.so:system/lib/libdice_kk.so \
    device/hardkernel/proprietary/lib/libdice_loadlibrary.so:system/lib/libdice_loadlibrary.so \
    device/hardkernel/proprietary/lib/libdice_software.so:system/lib/libdice_software.so \
    device/hardkernel/proprietary/lib/libdice_software_kk.so:system/lib/libdice_software_kk.so \
    device/hardkernel/proprietary/lib/libffmpeg_dice.so:system/lib/libffmpeg_dice.so \
    device/hardkernel/proprietary/lib/libsonic.so:system/lib/libsonic.so

# init.d support
PRODUCT_COPY_FILES += \
    device/hardkernel/proprietary/bin/sysinit:system/bin/sysinit

PRODUCT_PROPERTY_OVERRIDES := \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=160

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage \
    ro.kernel.android.checkjni=0

PRODUCT_PROPERTY_OVERRIDES += \
    debug.hwui.render_dirty_regions=false

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi xxhdpi

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

$(call inherit-product-if-exists, vendor/samsung_slsi/exynos5422/exynos5422-vendor.mk)

PRODUCT_TAGS += dalvik.gc.type-precise
$(call inherit-product, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product, hardware/samsung_slsi/exynos5422/exynos5422.mk)
