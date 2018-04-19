#import <LocalAuthentication/LAContext.h>
%hook SBLockScreenManager
-(_Bool)shouldLockUIAfterEndingCall
{
  __block BOOL shouldlock = true;
  NSError *error1 = nil;
  LAContext *context = [[LAContext alloc] init];
  if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error1])
  {
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Authenticate to Continue"
    reply:^(BOOL success, NSError * error)
    {
      if (success)
      {
        shouldlock = false;
      }
    }
    ];
      if(shouldlock)
      {
        return true;
      }
      else
      {
        return false;
      }
  }
  else
  {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BioMetric Protection" message:@"You need Password/biometrics enabled to use this tweak :( unfortunately, no existing protection is detected. Device will attempt to be locked" delegate:self cancelButtonTitle:@"Okay.."
    otherButtonTitles:nil];
    [alert show];
    return true;
  }
}
%end
%hook PHAudioCallViewController
-(void)hardwareButtonEventNotification:(id)arg1
{
  __block BOOL shouldnotify = false;
  NSError *error1 = nil;
  LAContext *context = [[LAContext alloc] init];
  if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error1])
  {
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Authenticate to Continue"
    reply:^(BOOL success, NSError * error)
    {
      if (success)
      {
        shouldnotify = true;
      }
    }
    ];
      if(shouldnotify)
      {
        return %orig;
      }
      else
      {
        return;
      }
  }
  else
  {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"BioMetric Protection" message:@"You need Password/biometrics enabled to use this tweak :( unfortunately, no existing protection is detected. Device will attempt to be locked" delegate:self cancelButtonTitle:@"Okay.."
    otherButtonTitles:nil];
    [alert show];
    return %orig;
  }
}
%end
%hook DialerController
-(void)_callButtonPressed:(id)arg1
{
  UIAlertController *callwarn = [UIAlertController alertControllerWithTitle:@"Think again!"
                                                    message:@"You might not want to call this person, we gave you a second chance to think so you wont regret later!"
                                                    preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction *yesbutton = [UIAlertAction actionWithTitle:@"Continue"
  style:(UIAlertActionStyleDefault)
  handler:^(UIAlertAction *action)
  {
    %orig;
  }];
  UIAlertAction *cancelbutton = [UIAlertAction actionWithTitle:@"Cancel"
  style:UIAlertActionStyleDefault
  handler:^(UIAlertAction *action)
  {
    return;
  }];
  [callwarn addAction:yesbutton];
  [callwarn addAction:cancelbutton];
  [self presentViewController:callwarn animated:YES completion:nil];
}
%end
