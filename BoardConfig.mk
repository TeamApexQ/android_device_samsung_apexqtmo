# Copyright (C) 2014
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from the proprietary version
-include vendor/samsung/apexqtmo/BoardConfigVendor.mk

TARGET_SPECIFIC_HEADER_PATH := device/samsung/apexqtmo/include

# Kernel
TARGET_KERNEL_CONFIG        := cyanogen_apexq_defconfig
BOARD_MKBOOTIMG_ARGS        := --ramdisk_offset 0x01500000
TARGET_KERNEL_SOURCE        := kernel/samsung/d2
BOARD_KERNEL_CMDLINE        := androidboot.hardware=qcom androidboot.selinux=permissive user_debug=31 zcache
BOARD_KERNEL_BASE           := 0x80200000
BOARD_KERNEL_PAGESIZE       := 2048
TARGET_KERNEL_SELINUX_CONFIG := m2selinux_defconfig
TARGET_BOOTLOADER_BOARD_NAME := MSM8960

# Adreno configuration
BOARD_EGL_CFG := device/samsung/apexqtmo/configs/egl.cfg

# Recovery
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/samsung/apexqtmo/recovery/recovery_keys.c
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
BOARD_USES_MMCUTILS := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
TARGET_RECOVERY_FSTAB := device/samsung/apexqtmo/rootdir/etc/fstab.qcom

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00A00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5515509760
BOARD_FLASH_BLOCK_SIZE := 131072
TARGET_USES_BLOCK_BASED_OTA := false

# QCOM
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE -DQCOM_BSP
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_DISPLAY_USE_RETIRE_FENCE := true
# BOARD_HAVE_NEW_QC_GPS := true

# bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/apexqtmo/bluetooth
BOARD_BLUEDROID_VENDOR_CONF := device/samsung/apexqtmo/bluetooth/vnd_d2.txt

# Disable initlogo, Samsungs framebuffer is weird
TARGET_NO_INITLOGO := true

# Use Audience A2220 chip
BOARD_HAVE_AUDIENCE_A2220 := true

# Use USB Dock Audio
BOARD_HAVE_DOCK_USBAUDIO := true

#camera abi compatiblily
TARGET_DISPLAY_INSECURE_MM_HEAP := true
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_CAMERA_ABI_HACK

# Don't build qcom camera HAL
USE_DEVICE_SPECIFIC_CAMERA := true

# Separate audio devices for VOIP
BOARD_USES_SEPERATED_VOIP := true
QCOM_ANC_HEADSET_ENABLED := false
QCOM_FLUENCE_ENABLED := false

# TWRP
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_INCLUDE_L_CRYPTO := true
PRODUCT_COPY_FILES += \
    device/samsung/apexqtmo/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

# inherit from common msm8960-common
-include device/samsung/msm8960-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := apexqtmo
TARGET_BOARD_INFO_FILE ?= device/samsung/apexqtmo/board-info.txt

# Insert contents of file near end of updater-script
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./build/tools/releasetools/ota_from_target_files -e ./device/samsung/apexqtmo/installer_extra

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/samsung/apexqtmo/bluetooth
BOARD_BLUEDROID_VENDOR_CONF :=
BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY :=
BOARD_HAVE_BLUETOOTH_BCM :=
BOARD_HAVE_BLUETOOTH_QCOM := true
#QCOM_BT_USE_SMD_TTY := true
BLUETOOTH_HCI_USE_MCT := true
QCOM_BT_USE_SMD_TTY := true

# Wifi
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_HAVE_SAMSUNG_WIFI :=
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true

WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/prima_wlan.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/prima_wlan/parameters/fwpath"
WIFI_DRIVER_MODULE_NAME     := "prima_wlan"
WIFI_DRIVER_MODULE_ARG      :=
WIFI_DRIVER_MODULE_AP_ARG   :=
WIFI_DRIVER_FW_PATH_STA     := "sta"
WIFI_DRIVER_FW_PATH_AP      := "ap"
WIFI_DRIVER_FW_PATH_P2P     :=

#Audio
BOARD_HAVE_AUDIENCE_A2220 :=
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
BOARD_USES_FLUENCE_INCALL := false
BOARD_USES_FLUENCE_FOR_VOIP := false

#camera hax
TARGET_PROVIDES_CAMERA_HAL := true
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
COMMON_GLOBAL_CFLAGS += -DDONT_USE_FENCE_SYNC
TARGET_NEED_QCOM_HARDWARE := true
TARGET_NEED_DISABLE_FACE_DETECTION := true
TARGET_NEED_DISABLE_FACE_DETECTION_BOTH_CAMERAS := true
TARGET_NEED_PREVIEW_SIZE_FIXUP := true
TARGET_NEED_DISABLE_AUTOFOCUS := true

#embedded superuser
SUPERUSER_EMBEDDED := true
SUPERUSER_PACKAGE_PREFIX := com.android.settings.cyanogenmod.superuser

#adreno hacks
TARGET_NO_ADAPTIVE_PLAYBACK := true

DEVICE_RESOLUTION := 480x800

#Audio modes
USE_TUNNEL_MODE := true
