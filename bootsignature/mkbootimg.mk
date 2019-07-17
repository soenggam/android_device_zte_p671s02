# Copyright (C) 2016 The CyanogenMod Project
#               2017 The LineageOS Project
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

LOCAL_PATH := device/ZTE/P671S02/bootsignature/verity
CUSTOM_MKBOOTIMG_VERSION_ARGS := \
    --os_version 9.0.0 \
    --os_patch_level 2019-03-05

## Overload bootimg generation: Same as the original, using prebuilt kernel with BootSignature
$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES) $(BOOT_SIGNER)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(CUSTOM_MKBOOTIMG_VERSION_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(BOOT_SIGNER) /boot $@ $(LOCAL_PATH).pk8 $(LOCAL_PATH).x509.pem $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE))
	@echo "Made boot image: $@"

## Overload recoveryimg generation: Same as the original, using prebuilt kernel with BootSignature
$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) $(recovery_ramdisk) $(recovery_kernel) \
		$(RECOVERYIMAGE_EXTRA_DEPS)
		@echo "----- Making recovery image ------"
		$(call build-recoveryimage-target, $@)
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(CUSTOM_MKBOOTIMG_VERSION_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@
	$(BOOT_SIGNER) /recovery $@ $(LOCAL_PATH).pk8 $(LOCAL_PATH).x509.pem $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE))
	@echo "Made recovery image: $@"

