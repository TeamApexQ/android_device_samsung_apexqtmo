$(call inherit-product, device/samsung/apexqtmo/full_apexqtmo.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/omni/config/gsm.mk)

# Enhanced NFC
#$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=apexqtmo TARGET_DEVICE=apexqtmo BUILD_FINGERPRINT="samsung/apexqtmo/apexqtmo:4.4.2/KVT49L/T699UVBMC5:user/release-keys" PRIVATE_BUILD_DESC="apexqtmo-user 4.4.2 KVT49L T699UVBMC5 release-keys"


PRODUCT_NAME := omni_apexqtmo
PRODUCT_DEVICE := apexqtmo

