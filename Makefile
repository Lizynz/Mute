ARCHS = armv7 armv7s arm64
DEBUG = 0
TARGET = iphone:clang:latest:9.2

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Mute
Mute_FILES = Tweak.xm
Mute_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
