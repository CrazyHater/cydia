#import "UIKit/UINavigationBar.h"
@class BKSProcessAssertion, CKMessagesController, CKRegistrationViewController, NSArray, NSString, NSURL, TLAlert, UIWindow;
//hiding the convos.. . and resetting voids
void hidecon()
{

}
void resetcons()
{

}
UINavigationBar *convobar = nil;
// getting the values of navigationbar
%hook CKNavigationController
-(void)setNavigationBar:(UINavigationBar *)arg1
{
  convobar = arg1;
  %orig;
}
%end
// hooking the new button into navigationbar
%hook CKConversationListController
-(void)editButtonTapped:(id)arg1
{
    UIBarButtonItem *righthidebutton = [[UIBarButtonItem alloc] initwithtitle:@"UnHide All"
    style:UIBarButtonItemStyleDone target:nil action:@selector(resetcons)];
    [convobar UINavigationItem:UIBarButtonItem:setRightBarButtonItem:righthidebutton];
    %orig;
}
%end
