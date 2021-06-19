# Chia Health Checker
Is a simple batch file of chia run commands walking you through all of the typical Chia Farm Checking with a guided yes or no prompt process

----THE CHIA CLIENT AND PROCESSES NEED TO BE ALLREADY RUNNING ON THE MACHINE FOR THE BAT TO RUN CORRECTLY----
I didn't initally realize this until after making and releasing this as I had the Chia Client GUI open the entire time doing it.

Check out the peer reviews and comments on my reddit post for more in depth information etc.
https://www.reddit.com/r/chia/comments/o2eute/release_chia_health_check_tool_for_chia_client_117/

----What it does (includes most recent revision notes)----

- Lists your current plot directories so you can make sure they are all there and will be tested

- Option to check & displays your current farm summary

- Option to display your current keys and wallet. If you need them for anything i.e. mad max, hpool or what ever else.

- Option to restart all running chia processes

- Option to check for duplicate plots and any filename errors

- Option to check plots using -10 quick method, -30 full method and skip

- Option to check if port 8444 is open and reachable by your internal network/local computer

- Option to check if port 8444 is open and reachable by your external network and verify connections are being made to you

- Color coded text areas to easily distinguish between user input needed, working processes and program reported data.

---- New 2.0v does everything the old one did but also ----
- Displays your current chia version and an option to launch a browser directly from the tool to the official Chia git hub to easily update your chia client with new releases when needed.

- Added a wildcard in the chia root directory so I don't need to update this everytime a release is pushed out and for any previous releases
ex = cd %LocalAppData%\chia-blockchain\app-1.1.7\resources\app.asar.unpacked\daemon
is now = cd %LocalAppData%\chia-blockchain\app-\resources\app.asar.unpacked\daemon
(notice the cute little star here? \app-)

- Fixed the quick and full plot checker completing both tasks when selecting quick instead of just one or the other. They are now separate options but both still exist and work.

- Added a user suggested edit to include a separate restart option for Chia ALL, which only restarts time lords additionally to the previous one, probably not needed but why not. If you run a time lord, you can now restart it with this! lol

- Added a note that the chia GUI must be open and running for this tool to work as it is all the official Chia commands being used, just packaged up so you don't need to type them. Besides the windows port check, that's a window thing.

- Added credit for the user that created the Linux, Mac and Rasp PI ports and donation addresses for him on the windows version. HUGE THANK YOU to him!

- Added credit to two other users that provided the wild card * entry to make this not chia client version dependent and reported the issue of the tool running both plot checks instead of just one.

- Added reddit link, cause I can?!

- Added spacing and breaks to make the text more human readable and fixed some typos and spelling errors. (don't worry, I am sure something is still misspelled).

----CURRENT BETA USER SUBMISSION FOR MAC, LINUX AND PI - Release under beta releases seperate from above.----

PLEASE REVIEW AND USE AT YOUR OWN RISK - I quickly reviewed the code and saw nothing malicious. Please review and confirm as well.

Also if modifications are needed for mac/linux please feel free to make them and submit to me by either a commit suggestion on git hub or message me on reddit.

----So far several users on reddit have reviewed the code and tested on Linux and Rasp Pi, still need a Mac confirmation it works----
I will probably move this to a release very soon even without Mac's testing, people have suggested that it should work on Mac. I'm sure i'll hear about it if it dosn't.

All credit for this goes to reddit user SMC0881 - This is for testing purposes. SMC0881 submitted this to me to help out the M, Linux and PI clients.

User's notes on needing a specific netstat package to run the port checks below.

#!/bin/sh

#Tested on Ubuntu running on Raspberry Pi4

#My version of Ubuntu for Pi did not have netstat installed. Run sudo apt install net-tools.

#This should work for Mac and regular Linux versions too.
