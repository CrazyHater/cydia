#line 1 "Tweak.xm"
#import "UIKit/UINavigationBar.h"
@class BKSProcessAssertion, CKMessagesController, CKRegistrationViewController, NSArray, NSString, NSURL, TLAlert, UIWindow;

void hidecon()
{

}
void resetcons()
{

}
UINavigationBar *convobar = nil;


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class CKConversationListController; @class CKNavigationController; 
static void (*_logos_orig$_ungrouped$CKNavigationController$setNavigationBar$)(_LOGOS_SELF_TYPE_NORMAL CKNavigationController* _LOGOS_SELF_CONST, SEL, UINavigationBar *); static void _logos_method$_ungrouped$CKNavigationController$setNavigationBar$(_LOGOS_SELF_TYPE_NORMAL CKNavigationController* _LOGOS_SELF_CONST, SEL, UINavigationBar *); static void (*_logos_orig$_ungrouped$CKConversationListController$editButtonTapped$)(_LOGOS_SELF_TYPE_NORMAL CKConversationListController* _LOGOS_SELF_CONST, SEL, id); static void _logos_method$_ungrouped$CKConversationListController$editButtonTapped$(_LOGOS_SELF_TYPE_NORMAL CKConversationListController* _LOGOS_SELF_CONST, SEL, id); 

#line 14 "Tweak.xm"


static void _logos_method$_ungrouped$CKNavigationController$setNavigationBar$(_LOGOS_SELF_TYPE_NORMAL CKNavigationController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UINavigationBar * arg1) {
  convobar = arg1;
  _logos_orig$_ungrouped$CKNavigationController$setNavigationBar$(self, _cmd, arg1);
}




static void _logos_method$_ungrouped$CKConversationListController$editButtonTapped$(_LOGOS_SELF_TYPE_NORMAL CKConversationListController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    UIBarButtonItem *righthidebutton = [[UIBarButtonItem alloc] initwithtitle:@"UnHide All"
    style:(UIBarButtonItemStyleDone) target:nil action:@selector(resetcons)];
    [convobar UINavigationItem:UIBarButtonItem:setRightBarButtonItem:righthidebutton];
    _logos_orig$_ungrouped$CKConversationListController$editButtonTapped$(self, _cmd, arg1);
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$CKNavigationController = objc_getClass("CKNavigationController"); MSHookMessageEx(_logos_class$_ungrouped$CKNavigationController, @selector(setNavigationBar:), (IMP)&_logos_method$_ungrouped$CKNavigationController$setNavigationBar$, (IMP*)&_logos_orig$_ungrouped$CKNavigationController$setNavigationBar$);Class _logos_class$_ungrouped$CKConversationListController = objc_getClass("CKConversationListController"); MSHookMessageEx(_logos_class$_ungrouped$CKConversationListController, @selector(editButtonTapped:), (IMP)&_logos_method$_ungrouped$CKConversationListController$editButtonTapped$, (IMP*)&_logos_orig$_ungrouped$CKConversationListController$editButtonTapped$);} }
#line 31 "Tweak.xm"
