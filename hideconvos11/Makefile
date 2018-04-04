ARCHS = arm64
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = HideConvos11
HideConvos11_FILES = Tweak.xm
HideConvos11_FRAMEWORKS = UIKit
HideConvos11_PRIVATE_FRAMEWORKS = ChatKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 Messages"
include $(THEOS_MAKE_PATH)/aggregate.mk
