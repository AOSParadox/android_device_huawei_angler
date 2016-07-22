#
# Copyright (C) 2015 The Android Open-Source Project
# Copyright (C) 2016 The AOSParadox Project
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

# Vendor files
$(call inherit-product-if-exists, vendor/huawei/angler/angler-vendor.mk)

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/huawei/angler/ramdisk,root)

# Prebuilt
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/huawei/angler/prebuilt/system,system)

# Dalvik/HWUI
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxxhdpi-3072-hwui-memory.mk)

# copy wlan firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4358/device-bcm.mk)

# CodeAurora msm8916_64 Tree
include device/qcom/msm8994/msm8994.mk

# Overlay
DEVICE_PACKAGE_OVERLAYS += device/huawei/angler/overlay
PRODUCT_PACKAGE_OVERLAYS += device/huawei/angler/overlay

# CAF Branch
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.par.branch=LA.BF64.1.2.2-06140-8x94.0

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi xxhdpi xhdpi hdpi

# Haters gonna hate ...
PRODUCT_CHARACTERISTICS := nosdcard

# OEM customization
PRODUCT_OEM_PROPERTIES := \
    ro.oem.* \
    oem.*

# Dalvik
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.boot-dex2oat-threads=4 \
    dalvik.vm.dex2oat-threads=2 \
    dalvik.vm.image-dex2oat-threads=4

# GPS
PRODUCT_PACKAGES += \
    gps.msm8994

# Keystore
PRODUCT_PACKAGES += \
    keystore.msm8994 \
    keystore.qcom

# Lights
PRODUCT_PACKAGES += \
    lights.msm8994

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.cpp.duplication=false

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    libnfc-nci \
    nfc_nci.msm8994 \
    NfcNci \
    Tag

# Power HAL
PRODUCT_PACKAGES += \
    power.angler

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
   ro.frp.pst=/dev/block/platform/soc.0/f9824900.sdhci/by-name/frp
