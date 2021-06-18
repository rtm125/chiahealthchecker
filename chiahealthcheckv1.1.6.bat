@echo off
cls
echo [32mThis Chia Checker Tool Is Only For Chia Version 1.1.6[0m
echo [32mThe Chia Checker Tool For 1.1.7 Can Be Downloaded From Git Hub[0m
echo [32mCreated By Reddit User: Toaster Potato[0m [94m
pause [0m

cd %LocalAppData%\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\
echo [32mMoving to working directory for chia version 1.1.6[0m

echo [32m!!!!Check and Verify Your Plot Directory Locations!!!![0m

chia plots show

echo [32mDirectories listed above will be your working plot directories for any tests you are about to perform. If you are missing a directory make sure you have added the directory to your chia GUI or in a command line. Any directory specific tests are populated from chias config.yaml file.[0m [94m
pause [0m

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


:choice
set /P c=[94mDo you want to restart chia processes[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
cd %LocalAppData%\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\
echo [32mStopping Chia processes[0m
chia stop farmer
rem [32mMaking sure processes are closed with 5 second delay.[0m
timeout /t 5

echo [32mStarting Chia processes[0m
chia start farmer
rem [32mMaking sure processes are started with 7 second delay.[0m
timeout /t 7


echo [32mShowing Chia Farm status after restart[0m
chia farm summary

:next
echo [32mMoving to next process[0m

:choice
set /P c=[94mDo you want to check for duplicate plots and plots with any file name errors[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
echo [32mstarting chia plot checker[0m
cd %LocalAppData%\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\
chia plots check -l -n 0
echo [32mDone duplicate files will be listed at the end of the report with a WARNING message and plot file name. These should be deleted! If no specific plot files are listed, nothing needs to be deleted.[0m

:next
echo [32mMoving to next process[0m

echo [32mChecking your plots can take awhile. I have included the options for a quick -10 test and the full recommened -30 test flags. I would recommend starting with a 10 test as this can still take quite a while with alot of plots.[0m
:choice
set /P c=[94mDo you want to run Chia check plots Quick - Full - Skip [Q/F/S]?[0m
if /I "%c%" EQU "Q" goto :process1
if /I "%c%" EQU "F" goto :process2
if /I "%c%" EQU "S" goto :next
goto :choice

:process1
echo [32mstarting chia plot checker Quick[0m
cd %LocalAppData%\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\
chia plots check -n 10
echo [32mQuick plot check finished. Check your results above.[0m

:process2
echo [32mstarting chia plot checker Full[0m
cd %LocalAppData%\chia-blockchain\app-1.1.6\resources\app.asar.unpacked\daemon\
chia plots check -n 30
echo [32mPlot check finished. Check your results above.[0m

:next
echo [32mMoving to next process.[0m

:choice
set /P c=[94mDo you want to check if port 8444 is open[Y/N]?[0m
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
echo [32mChecking if port 8444 is open on local pc[0m
netstat -anon | findstr 127.0.0.1:8444
echo [32mCheck complete - You should see a few ESTABLISHED connections on your local machine[0m

:next
echo [32mMoving to next process[0m

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

echo [94mIf you found this tool useful or just hate your money and want me to have some of it.[0m
echo [32mPlease consider donating to help keep me motived to keep this updated in the future. [0m
echo [32mChia Wallet Address: xch1xwnsx8n5zzlhy8hy6h6l0xw49kwf69xw7lcwsqprk8j528cpnr9q9f0jxc [0m
echo [32mETH Wallet Address: 0xd84A4Ccd7F2Af328b47c93d23fc75542111651c7 [0m
:choice
set /P c=[94mAre you ready to exit[Y/N]?
if /I "%c%" EQU "Y" goto :process1
if /I "%c%" EQU "N" goto :next
goto :choice

:process1
exit

:next
echo [32mClick the X on this window or push any button when ready to close![0m [94m

pause [0m

