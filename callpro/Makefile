include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CallPro
CallPro_FILES = Tweak.xm
CallPro_FRAMEWORKS = UIKit LocalAuthentication

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard; killall -9 MobilePhone"
include $(THEOS_MAKE_PATH)/aggregate.mk
