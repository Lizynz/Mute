ARCHS = armv7 armv7s arm64 arm64e
DEBUG = 0
TARGET = iphone:clang:latest:9.3

export SYSROOT = $(THEOS)/sdks/iPhoneOS9.3.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mute
Mute_FILES = Tweak.xm
Mute_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk

before-stage::
	find . -name ".DS_Store" -delete
