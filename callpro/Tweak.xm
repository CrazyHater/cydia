#import <LocalAuthentication/LAContext.h>
%hook SBLockScreenManager
-(_Bool)shouldLockUIAfterEndingCall
{
  __block int i = 0;
  LAContext *context = [[LAContext alloc] init];
  if([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error])
  {
    [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:@"Authenticate to Continue"
    reply:^(BOOL success, NSError * error)
    {
      if (success)
      {
        i = 1;
      }
    }
    ];
    if(i==0)
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
