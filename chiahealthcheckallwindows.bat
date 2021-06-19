@echo off
cls
echo [32mThis Chia Checker Tool Is For All Current and Hopefully Future Chia Client Versions.[0m
echo.
echo [32mThis tool was Created During 1.1.7 Chia Client Release and last updated 6/19/2021.[0m
echo [94mYou are currently running Chia Client Version[0m [94m
cd %LocalAppData%\chia-blockchain\app-*\resources\app.asar.unpacked\daemon\
chia version
echo.
echo [32mYou can update Chia by getting the latest offical version at[0m
echo [32mhttps://github.com/Chia-Network/chia-blockchain/releases[0m
:choice
set /P c=[94mWould you like to me to launch that page for you?[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
explorer "https://github.com/Chia-Network/chia-blockchain/releases"
echo [32mDone![0m

:next
echo [32mMoving to next process[0m
echo.
echo [32mCreated By Reddit User: Toaster Potato[0m
echo [32mSpecial Thanks to Reddit User: SMC0881 For Modifying the Linux, Mac and Pi Ports of this tool[0m
echo [32malso availible as releases on github, probably wouldn't of got done without him.[0m
echo [32mSpecial Thanks to Reddit Users: ChuckUF4rley and powershellnut for providing bug reports and code[0m
echo [32madditions to make this tool even better.[0m
echo.
echo [32mYou can find peer review, code checking and additional info comments about this on reddit.[0m
echo [32mreddit.com/r/chia/comments/o2eute/release_chia_health_check_tool_for_chia_client_117/[0m
echo.
echo [94m!~~~Make sure Chia GUI is currently open and running before continuing.~~~! [0m
echo [94m~~This tool uses the offical chia commands to run and needs the processes from Chia to do so.~~~~[0m [94m
pause [0m

cd %LocalAppData%\chia-blockchain\app-*\resources\app.asar.unpacked\daemon\
echo [32mMoving to working directory for chia[0m
echo.
echo [32m!!!!Check and Verify Your Plot Directory Locations!!!![0m

chia plots show
echo.
echo [32mDirectories listed above will be your working plot directories for any tests you are about to perform.[0m
echo [32mIf you are missing a directory make sure you have added the directory to your chia GUI or in a command line.[0m
echo [32mAny directory specific tests are populated from chias config.yaml file.[0m [94m
pause [0m

echo.
:choice
set /P c=[94mDo you want to check your Chia Farm summary[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
echo [32mShowing chia farm summary[0m
chia farm summary
echo [32mDone! If you are seeing connection errors or unknown reports you should restart your farm processes in the next step.[0m

:next
echo [32mMoving to next process[0m

echo.
:choice
set /P c=[94mDo you want to display your Chia keys[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
chia keys show
echo [32mDone! You can copy and paste these keys for any reason needed.[0m

:next
echo [32mMoving to next process[0m

echo.
:choice
set /P c=[94mDo you want to restart default chia processes used with the GUI of windows[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
cd %LocalAppData%\chia-blockchain\app-*\resources\app.asar.unpacked\daemon\
echo [32mStopping Chia processes[0m
chia stop farmer
rem [32mMaking sure processes are closed with 5 second delay.[0m
timeout /t 5

echo [32mStarting Chia processes[0m
chia start farmer
rem [32mMaking sure processes are started with 7 second delay.[0m
timeout /t 7
echo.
echo [32mShowing Chia Farm status after restart[0m
chia farm summary

:next
echo [32mMoving to next process[0m

echo.
:choice
set /P c=[94mDo you want to restart ALL chia processes including additional stuff that dosn't launch with the GUI !~~Unless you are running a timelord outside of the chia GUI you'll want to push NO here.~~![Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
cd %LocalAppData%\chia-blockchain\app-*\resources\app.asar.unpacked\daemon\
echo [32mStopping Chia processes[0m
chia stop all
rem [32mMaking sure processes are closed with 5 second delay.[0m
timeout /t 5

echo [32mStarting Chia processes[0m
chia start all
rem [32mMaking sure processes are started with 7 second delay.[0m
timeout /t 7
echo.
echo [32mShowing Chia Farm status after restart[0m
chia farm summary

:next
echo [32mMoving to next process[0m

echo.
:choice
set /P c=[94mDo you want to check for duplicate plots and plots with any file name errors[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
echo [32mstarting chia plot checker[0m
cd %LocalAppData%\chia-blockchain\app-*\resources\app.asar.unpacked\daemon\
chia plots check -l -n 0
echo [32mDone! Duplicate files will be listed at the end of the report with a WARNING message and plot file name. These should be deleted! If no specific plot files are listed, nothing needs to be deleted.[0m

:next
echo.
echo [32mMoving to next process[0m
echo.
echo [32mChecking your plots can take awhile. I have included the options for a quick -10 test and the full recommened -30 test flags. I would recommend starting with a 10 test as this can still take quite a while with alot of plots. Thanks to reddit user ChuckUF4rley for pointing out both tests ran if not seperate options.[0m
echo.
:choice
set /P c=[94mDo you want to run Chia Check Plots QUICK 10 (~Full 30 test is the next option~)[y/n]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
echo [32mstarting chia plot checker Quick[0m
cd %LocalAppData%\chia-blockchain\app-*\resources\app.asar.unpacked\daemon\
chia plots check -n 10
echo.
echo [32mQuick Plot check finished. Check your results above.[0m

:next
echo [32mMoving to next process.[0m
echo.
:choice
set /P c=[94mDo you want to run Chia Check Plots FULL 30 [y/n]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
echo [32mstarting chia plot checker Full[0m
cd %LocalAppData%\chia-blockchain\app-*\resources\app.asar.unpacked\daemon\
chia plots check -n 30
echo.
echo [32mFull Plot check finished. Check your results above.[0m

:next
echo [32mMoving to next process.[0m
echo.
:choice
set /P c=[94mDo you want to check if port 8444 is open[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
echo [32mChecking if port 8444 is open on local pc[0m
netstat -anon | findstr 127.0.0.1:8444
echo [32mCheck Complete - You should see a few ESTABLISHED connections on your local machine[0m

:next
echo [32mMoving to next process[0m
echo.
:choice
set /P c=[94mDo you want to check if port 8444 is making connections outside your network[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
echo Checking all connections with port 8444
netstat -anon | findstr 8444
echo [32mCheck complete, you should see several connections ESTABLISHED[0m

:next
echo [32mMoving to next process[0m
echo.
echo.
echo [94mIf you found this tool useful or just hate your money and want us to have some of it,[0m
echo [94mplease consider donating to help keep us motived to keep this updated in the future. [0m
echo.
echo ----------*Windows Author Version Reddit User:Toaster Potato-----------
echo [32mChia Wallet Address: xch1xwnsx8n5zzlhy8hy6h6l0xw49kwf69xw7lcwsqprk8j528cpnr9q9f0jxc [0m
echo [32mETH Wallet Address:  0xd84A4Ccd7F2Af328b47c93d23fc75542111651c7 [0m
echo.
echo ----------*Ported Author PI:Linux:Mac Reddit User:smc0881-----------
echo [32mChia Wallet Address: xch18uf4hnp0euevya30knr0a4zdrm7mmfl28hvu9sjzwgef8lgdk06qddlrag [0m
echo [32mETH Wallet Address:  0x261B0EF34Cd4dc8f1303769BeC93873ddE26670A [0m
echo.
:choice
set /P c=[94mAre you ready to exit[Y/N]?
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
exit

:next
echo [32mClick the X on this window or push any button when ready to close![0m

pause

