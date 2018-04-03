ARCHS = arm64
include $(THEOS)/makefiles/common.mk
TWEAK_NAME = CallPro
CallLock_FILES = Tweak.xm
CallLock_FRAMEWORKS = LocalAuthentication UIKit
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += hideconvos11
include $(THEOS_MAKE_PATH)/aggregate.mk
