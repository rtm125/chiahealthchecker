# Chia Health Checker
Is a simple batch file of chia run commands walking you through all of the typical Chia Farm Checking with a guided yes or no prompt process

So far what it does

- Lists your current plot directories so you can make sure they are all there and will be tested

- Option to check & displays your current farm summary

- Option to display your current keys and wallet. If you need them for anything i.e. mad max, hpool or what ever else.

- Option to restart all running chia processes

- Option to check for duplicate plots and any filename errors

- Option to check plots using -10 quick method, -30 full method and skip

- Option to check if port 8444 is open and reachable by your internal network/local computer

- Option to check if port 8444 is open and reachable by your external network and verify connections are being made to you

- Color coded text areas to easily distinguish between user input needed, working processes and program reported data.

~CURRENT BETA USER SUBMISSION FOR MAC, LINUX AND PI~

This is for testing purposes. A user submitted this to me to help out the MAC, Linux and PI clients.

PLEASE REVIEW AND USE AT YOUR OWN RISK - I quickly reviewed the code and saw nothing malicious. Please review and confirm as well.

Also if modifications are needed for mac/linux please feel free to make them and submit to me by either a commit suggestion on git hub or message me on reddit.

Once I have recieved confirmation on nothing malicous I will push it out to a release and as I recieve confirmations it works on OS's outside of raspberry PI I will remove or confirm those OS's for release.

All credit for this goes to reddit user SMC0881

User's notes on needing a specific netstat package to run the port checks below.
#!/bin/sh
#Tested on Ubuntu running on Raspberry Pi4
#My version of Ubuntu for Pi did not have netstat installed. Run sudo apt install net-tools.
#This should work for Mac and regular Linux versions too.
#
