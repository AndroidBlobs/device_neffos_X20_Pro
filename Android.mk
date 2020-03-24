LOCAL_PATH := $(call my-dir)
ifeq ($(TARGET_DEVICE),X20_Pro)
include $(call all-makefiles-under,$(LOCAL_PATH))
include $(CLEAR_VARS)
endif