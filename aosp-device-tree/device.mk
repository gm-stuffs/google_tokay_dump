#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# API levels
BOARD_API_LEVEL := 202404
PRODUCT_SHIPPING_API_LEVEL := 34

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    dump_gsc.sh \
    dump_modem.sh \
    dump_pcie.sh \
    dump_thermal.sh \
    dump_touch.sh \
    dump_trusty.sh \
    predump_gti0.sh \
    disable_contaminant_detection.sh \
    init.radio.sh \
    insmod.sh \
    predump_touch.sh \

PRODUCT_PACKAGES += \
    fstab.zram.6g \
    init.tokay.rc \
    init.zuma.soc.rc \
    init.zumapro.board.rc \
    init.zumapro.soc.rc \
    init.zumapro.usb.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.zram.6g:$(TARGET_VENDOR_RAMDISK_OUT)/first_stage_ramdisk/fstab.zram.6g

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/google/generic/generic-vendor.mk)
