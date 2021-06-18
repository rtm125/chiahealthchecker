#!/bin/sh
#Tested on Ubuntu running on Raspberry Pi4
#My version of Ubuntu for Pi did not have netstat installed. Run sudo apt install net-tools.
#This should work for Mac and regular Linux versions too.
#

#Color Definitions
GREEN='\033[0;32m'
WHITE='\033[0;0m'
BLUE='\033[0;94m'

#Variables
CHIABLOCKCHAIN=~/chia-blockchain/
CHIA_BIN=${CHIABLOCKCHAIN}/app-1.1.7/resources/app.asar.unpacked/daemon/chia
CHIA_HOME=~/.chia/
PROCEED=""

clear
. ${CHIABLOCKCHAIN}/activate
clear

echo "${GREEN}This Chia Checker Tool Is Only For Chia Version 1.1.7${WHITE}"
echo "${GREEN}The Chia Checker Tool For 1.1.6 Can Be Downloaded From Git Hub${WHITE}"
echo "${GREEN}Created By Reddit User For Windows: Toaster Potato${WHITE}"
echo "${GREEN}*nix Port By Reddit User: smc0881${WHITE}"
#pause ${WHITE}"

echo ""
echo "${GREEN}Moving to working directory for chia version 1.1.7${WHITE}"
echo "${GREEN}!!!!Check and Verify Your Plot Directory Locations!!!!${WHITE}"

chia plots show

echo ""
echo "${GREEN}Directories listed above will be your working plot directories for any tests you are about to perform. If you are missing a directory make sure you have added the directory to your chia GUI or in a command line. Any directory specific tests are populated from chias config.yaml file.${BLUE}"
#pause ${WHITE}"

echo "${BLUE}Do you want to check your Chia Farm summary[Y/N]?${WHITE} \c"
read PROCEED

case "${PROCEED}" in
        [yY][eE][sS]|[yY])
                echo "${GREEN}Showing chia farm summary${WHITE}"
                        chia farm summary
                echo "${GREEN}Done! If you are seeing connection errors or unknown reports you should restart your farm processes in the next step.${WHITE}"

        ;;
        *)
                continue
        ;;
esac

echo "${GREEN}Moving to next process${WHITE}"

echo "${BLUE}Do you want to display your Chia keys[Y/N]?${WHITE} \c"
read PROCEED

case "${PROCEED}" in
        [yY][eE][sS]|[yY])
                chia keys show
		echo "${GREEN}Done! You can copy and paste these keys for any reason needed.${WHITE}"
        ;;
        *)
                continue
        ;;
esac

echo "${GREEN}Moving to next process${WHITE}"

echo "${BLUE}Do you want to restart chia processes[Y/N]?${WHITE} \c"
read PROCEED

case "${PROCEED}" in
        [yY][eE][sS]|[yY])
		echo "${GREEN}Stopping Chia processes${WHITE}"
			chia stop farmer
			sleep 5
		echo "${GREEN}Starting Chia processes${WHITE}"
			chia start farmer
			sleep 7
		echo "${GREEN}Showing Chia Farm status after restart${WHITE}"
			chia farm summary
        ;;
        *)
                continue
        ;;
esac

echo "${GREEN}Moving to next process${WHITE}"

echo "${BLUE}Do you want to check for duplicate plots and plots with any file name errors[Y/N]?${WHITE} \c"
read PROCEED

case "${PROCEED}" in
        [yY][eE][sS]|[yY])
		echo "${GREEN}starting chia plot checker${WHITE}"
		chia plots check -l -n 0
		echo "${GREEN}Done duplicate files will be listed at the end of the report with a WARNING message and plot file name. These should be deleted! If no specific plot files are listed, nothing needs to be deleted.${WHITE}"
        ;;
        *)
                continue
        ;;
esac

echo "${GREEN}Moving to next process${WHITE}"

echo "${GREEN}Checking your plots can take awhile. I have included the options for a quick -10 test and the full recommened -30 test flags. I would recommend starting with a 10 test as this can still take quite a while with alot of plots.${WHITE}"
echo "${BLUE}Do you want to run Chia check plots Quick - Full - Skip [Q/F/S]?${WHITE} \c"
read PROCEED

case "${PROCEED}" in
        [qQ])
		echo "${GREEN}starting chia plot checker Quick${WHITE}"
			chia plots check -n 10
		echo "${GREEN}Quick plot check finished. Check your results above.${WHITE}"
        ;;
	[fF])
		echo "${GREEN}starting chia plot checker Full${WHITE}"
			chia plots check -n 30
		echo "${GREEN}Plot check finished. Check your results above.${WHITE}"
	;;
	*)
                continue
        ;;
esac

echo "${GREEN}Moving to next process.${WHITE}"

echo "${BLUE}Do you want to check if port 8444 is open[Y/N]?${WHITE} \c"
read PROCEED

case "${PROCEED}" in
        [yY][eE][sS]|[yY])
		echo "${GREEN}Checking if port 8444 is open on local pc${WHITE}"
		netstat -anon | grep 127.0.0.1:8444
		echo "${GREEN}Check complete - You should see a few ESTABLISHED connections on your local machine${WHITE}"
        ;;
        *)
                continue
        ;;
esac

echo "${GREEN}Moving to next process${WHITE}"

echo "${BLUE}Do you want to check if port 8444 is making connections outside your network[Y/N]?${WHITE} \c"
read PROCEED

case "${PROCEED}" in
        [yY][eE][sS]|[yY])
		echo "${GREEN}Checking all connections with port 8444${WHITE}"
		netstat -anon | grep 8444
		echo "${GREEN}Check complete, you should see several connections ESTABLISHED${WHITE}"
        ;;
        *)
                continue
        ;;
esac

echo ""
echo "${BLUE}If you found this tool useful or just hate your money and want me to have some of it.${WHITE}"
echo "${GREEN}Please consider donating to help keep me motived to keep this updated in the future. ${WHITE}"
echo "------------------*Windows Author Version: Reddit User:Toaster Potato--------------"
echo "${GREEN}Chia Wallet Address: xch1xwnsx8n5zzlhy8hy6h6l0xw49kwf69xw7lcwsqprk8j528cpnr9q9f0jxc ${WHITE}"
echo "${GREEN}ETH Wallet Address: 0xd84A4Ccd7F2Af328b47c93d23fc75542111651c7 ${WHITE}"
echo "------------------*Ported Author Version:nix Reddit User:smc0881--------------"
echo "${GREEN}Chia Wallet Address: xch18uf4hnp0euevya30knr0a4zdrm7mmfl28hvu9sjzwgef8lgdk06qddlrag${WHITE}"
echo "${GREEN}ETH Wallet Address: 0x261B0EF34Cd4dc8f1303769BeC93873ddE26670A${WHITE}"

echo "${WHITE}"