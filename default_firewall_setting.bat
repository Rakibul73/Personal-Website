@echo off

:: Disable the "codeforces" outbound rule
netsh advfirewall firewall set rule name="codeforces" new enable=no

:: Turn on outbound connections for all profiles (public, private, and domain)
netsh advfirewall set allprofiles firewallpolicy allowinbound,allowoutbound

:: Verify the changes
:: Use netsh to display the details of the outbound rule (to confirm it's disabled)
set rule_name="codeforces"
netsh advfirewall firewall show rule name=%rule_name%

:: Check the current firewall settings for all profiles (to confirm outbound is allowed)
netsh advfirewall show allprofiles

:: Pause to keep the console window open
pause
