@echo off

:: turn off outbound connections for all profiles (public, private, and domain)

netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

:: check the current firewall settings for all profiles

netsh advfirewall show allprofiles




:: Define the IP addresses separated by commas
set remote_ips=2606:4700:3037::ac43:836d,2606:4700:3031::6815:a6a,172.67.131.109,194.58.31.81,2606:4700:20::ac43:44fe,2606:4700:20::681a:7a4,2606:4700:20::681a:6a4,172.67.68.254,2404:6800:4002:825::2003,142.250.194.227,2404:6800:4002:817::2008,142.250.194.8,2606:4700:3037::ac43:836d,2606:4700:3031::6815:a6a,172.67.131.109,2404:6800:4002:819::200a,142.250.193.10,2606:4700:20::681a:6a4,2606:4700:20::ac43:44fe,2606:4700:20::681a:7a4,104.26.7.164

:: Create a single outbound rule to allow connections to multiple remote IP addresses
netsh advfirewall firewall add rule name="codeforces" dir=out action=allow remoteip=%remote_ips% profile=any

:: Verify the added rule
:: Define the name of the outbound rule
set rule_name="codeforces"

:: Use netsh to display the details of the outbound rule
netsh advfirewall firewall show rule name=%rule_name%




:: Pause to keep the console window open
pause
