ARCHS = armv7 armv7s arm64

TARGET = iphone:clang:latest:9.1

export ADDITIONAL_LDFLAGS = -Wl,-segalign,4000

include theos/makefiles/common.mk

TWEAK_NAME = Mute
Mute_FILES = Tweak.xm
Mute_FRAMEWORKS = UIKit

include $(THEOS_MAKE_PATH)/tweak.mk
