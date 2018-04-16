LOCAL_PATH := device/huawei/HWPIC

#Ninja
USE_NINJA := false

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HIGH_OPTIMIZATION := true
TARGET_USES_64_BIT_BINDER := true

TARGET_BOARD_PLATFORM := hi6250
BOARD_VENDOR_PLATFORM := hi6250

# Enable CPUSETS
ENABLE_CPUSETS := true

# Enable SCHEDBOOST
ENABLE_SCHEDBOOST := true

# Assert
TARGET_OTA_ASSERT_DEVICE := hi6250,picasso,Nova 2,HWPIC,PIC-LX9,PIC-L29,PIC-L09,PIC-AL00,pic_al00,PIC-TL00

# Audio
BOARD_USES_ALSA_AUDIO := true
TARGET_PROVIDES_LIBAUDIO := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_SUPPORTS_SOUND_TRIGGER := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := hi6250
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Bootanimation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Charger 
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BACKLIGHT_PATH := /sys/class/leds/lcd_backlight0/brightness

# CMHW
BOARD_HARDWARE_CLASS := \
    $(LOCAL_PATH)/cmhw \
    hardware/cyanogen/cmhw

# Display
USE_OPENGL_RENDERER := true
TARGET_HARDWARE_3D := true
ANDROID_ENABLE_RENDERSCRIPT := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_USES_ION := true

# GPS
USE_DEVICE_SPECIFIC_GPS := true
TARGET_NO_RPC := true

# Kernel
BOARD_KERNEL_BASE := 0x00078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := loglevel=4 initcall_debug=n page_tracker=on slub_min_objects=16 androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x07b88000 --tags_offset 0x07988000
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_KERNEL_HEADER_ARCH := arm64

TARGET_KERNEL_SOURCE := kernel/huawei/HWPIC
TARGET_KERNEL_CONFIG := hisi_6250_defconfig

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4915724288
BOARD_USERDATAIMAGE_PARTITION_SIZE := 55113154560
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_FLASH_BLOCK_SIZE := 131072

# Init
TARGET_INIT_VENDOR_LIB := libhuawei_init

HWPIC_SHIMS := '/hwvendor/lib64/hwcam/hwcam.hi6250.m.HWPIC.so|libshim_libui.so:/hwvendor/lib64/hwcam/hwcam.hi6250.m.HWPIC.so|libshim.so'
COMMON_SHIMS := '/hwvendor/lib/hw/audio.primary.hisi.so|libshim.so:/hwvendor/lib64/libcamera_algo.so|libshim_libui.so:/hwvendor/lib64/hw/fingerprint.hi6250.so|libshim.so'

# Linker
LD_SHIM_LIBS := $(COMMON_SHIMS):$(HWPIC_SHIMS)

# Properties
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/recovery.fstab

# RIL
TARGET_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING
BOARD_RIL_CLASS := ../../../device/huawei/HWPIC/ril
PROTOBUF_SUPPORTED := true
TARGET_RIL_VARIANT := proprietary

# Enable WEBGL
ENABLE_WEBGL := true

# Vendor
BOARD_NEEDS_VENDORIMAGE_SYMLINK := true
TARGET_COPY_OUT_VENDOR := system

# Vendor Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_hi6250
TARGET_LIBINIT_DEFINES_FILE := $(LOCAL_PATH)/init/init_HWPIC.cpp

# Sepolicy
BOARD_SEPOLICY_DIRS += \
	device/huawei/HWPIC/sepolicy

# Wifi
TARGET_USES_64_BIT_BCMDHD	 := true
BOARD_WLAN_DEVICE                := bcmdhd
BOARD_WLAN_DEVICE_REV            := bcm4345
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM        := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA          := "/huawei/HWPIC/proprietary/system/vendor/firmware/fw_bcm43455_hw.bin"
WIFI_DRIVER_FW_PATH_AP           := "/huawei/HWPIC/proprietary/system/vendor/firmware/fw_bcm43455_apsta_hw.bin"
WIFI_DRIVER_FW_PATH_P2P          := "/huawei/HWPIC/proprietary/system/vendor/firmware/fw_bcm43455_hw.bin"
WIFI_BAND                        := 802_11_ABG

# inherit from the proprietary version
-include vendor/huawei/HWPIC/BoardConfigVendor.mk
