#
# Copyright (C) 2017 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := device/ZTE/P671S02

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_USES_64_BIT_BINDER := true

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MT6771
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mt6771
TARGET_BOARD_PLATFORM_GPU := Mali-G72

# Kernel
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_BASE        := 0x40078000
BOARD_KERNEL_OFFSET      := 0x00008000
BOARD_RAMDISK_OFFSET     := 0x14f88000
BOARD_KERNEL_TAGS_OFFSET := 0x13f88000
BOARD_KERNEL_CMDLINE     := bootopt=64S3,32N2,64N2
BOARD_BOOTIMG_HEADER_VERSION := 1
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_PREBUILT_DTBOIMAGE := $(LOCAL_PATH)/prebuilt/recovery-dtbo
TARGET_PREBUILT_KERNEL   := $(LOCAL_PATH)/prebuilt/Image.gz-dtb
BOARD_CUSTOM_BOOTIMG_MK  := $(LOCAL_PATH)/bootsignature/mkbootimg.mk

# Partitions
BOARD_FLASH_BLOCK_SIZE               := 131072 # BOARD_KERNEL_PAGESIZE * 64
BOARD_BOOTIMAGE_PARTITION_SIZE       := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE   := 33554432
BOARD_SYSTEMIMAGE_PARTITION_SIZE     := 5368709120
BOARD_SYSTEMIMAGE_PARTITION_TYPE     := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE      := 452984832
BOARD_CACHEMIMAGE_PARTITION_TYPE     := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE   := 26427768832 # -16384
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_PARTITION_SIZE     := 897581056
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE   := ext4

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_SUPPRESS_SECURE_ERASE := true

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true

# Crypto
# TW_INCLUDE_CRYPTO := true
# TW_INCLUDE_FBE := true

# TW_CRYPTO_USE_SYSTEM_VOLD := true
# TW_CRYPTO_SYSTEM_VOLD_MOUNT := system_root vendor
# TW_CRYPTO_SYSTEM_VOLD_DEBUG := true

# Keymaster
# TARGET_PROVIDES_KEYMASTER := true

# TWRP Configuration
TW_THEME := portrait_hdpi
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 180
TW_EXTRA_LANGUAGES := true
TW_DEFAULT_LANGUAGE := zh_CN
TW_INCLUDE_NTFS_3G := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_TWRPAPP := true
TW_INPUT_BLACKLIST := "hbtp_vm"
# TW_USE_TOOLBOX := true
TW_INCLUDE_REPACKTOOLS := true
PLATFORM_SECURITY_PATCH := 2099-12-31

# Debug flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
