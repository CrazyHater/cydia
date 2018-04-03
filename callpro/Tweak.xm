#import <LocalAuthentication/LAContext.h>
%hook SBLockScreenManager
-(_Bool)shouldLockUIAfterEndingCall
{
  __block BOOL shouldlock = true;
  LAContext *context = [[LAContext alloc] init];
  if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
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
    return true;
  }
}
%end
%hook PHAudioCallViewController
-(void)hardwareButtonEventNotification:(id)arg1
{
  __block BOOL shouldnotify = false;
  LAContext *context = [[LAContext alloc] init];
  if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
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
    return %orig;
  }
}
