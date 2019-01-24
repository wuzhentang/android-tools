
LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
 
define all-c-files-under
	$(patsubst ./%,%, $(shell find $(LOCAL_PATH) -name "platform" -prune -o -name "*.c" -and -not -name ".*"))
endef

define all-subdir-c-files
	$(call all-c-files-under,.)
endef
	   
EXCLUES := $(wildcard $(LOCAL_PATH)/test-*.c)
#$(warning $(EXCLUES))
C_FILES := $(filter-out $(EXCLUES), $(call all-subdir-c-files))
#$(warning $(C_FILES))
 
  
LOCAL_SRC_FILES :=$(C_FILES:$(LOCAL_PATH)/%=%)
   
LOCAL_SHARED_LIBRARIES := \
			libcutils \
			libutils 
#			libcrypto
 
  
LOCAL_C_INCLUDES :=  $(KERNEL_HEADERS)
 
#LOCAL_CFLAGS := -DANDROID_CHANGES -DCHAPMS=1 -DMPPE=1 -Iexternal/openssl/include
LOCAL_CFLAGS := -DANDROID_CHANGES -DCHAPMS=1 -DMPPE=1 #-Iexternal/openssl/include
 
LOCAL_MODULE :=ethtool
LOCAL_MODULE_TAGS := optional

PACKAGE=ethtool
include $(BUILD_EXECUTABLE)
