LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := cch_pbc_static
LOCAL_MODULE_FILENAME := pbc
LOCAL_SRC_FILES := $(TARGET_ARCH_ABI)/libpbc.a
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../../include
include $(PREBUILT_STATIC_LIBRARY)
