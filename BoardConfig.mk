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

# inherit CodeAurora MSM8994 Board Config
-include device/qcom/msm8994/BoardConfig.mk

# Inherit from qcom-common
include device/qcom/common/BoardConfigCommon.mk

# CPUSets
ENABLE_CPUSETS := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := device/huawei/angler/include


# Platform
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_INFO_FILE := device/huawei/angler/board-info.txt
TARGET_RELEASETOOLS_EXTENSIONS := device/huawei/angler
TARGET_USES_AOSP := true

# Kernel
KERNEL_DIR := kernel/huawei/angler
KERNEL_DEFCONFIG := cyanogenmod_angler_defconfig
TARGET_USES_UNCOMPRESSED_KERNEL := true
BOARD_KERNEL_CMDLINE := androidboot.hardware=angler androidboot.console=ttyHSL0 msm_rtb.filter=0x37 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 boot_cpus=0-3
TARGET_RECOVERY_FSTAB = device/huawei/angler/ramdisk/fstab.angler

# Audio
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_DSM_FEEDBACK := true
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/huawei/angler/bluetooth

# Secure Services
BOARD_USES_SECURE_SERVICES := true

# Vendor
BOARD_NEEDS_VENDORIMAGE_SYMLINK := true

# GPS
TARGET_NO_RPC := true

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26503790080
BOARD_CACHEIMAGE_PARTITION_SIZE := 104857600
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Sepolicy
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += \
	device/huawei/angler/sepolicy

# Power
TARGET_USES_INTERACTION_BOOST := true

# Camera
BOARD_QTI_CAMERA_32BIT_ONLY := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP := "/vendor/firmware/fw_bcmdhd_apsta.bin"

# Inherit from the proprietary version
-include vendor/huawei/angler/BoardConfigVendor.mk
