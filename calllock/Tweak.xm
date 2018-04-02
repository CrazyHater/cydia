%hook SBLockScreenManager
-(_Bool)shouldLockUIAfterEndingCall
{
  return true;
}
%end
