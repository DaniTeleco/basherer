#!/bin/bash
# --------------------
# basherer.sh
# --------------------
#	@author:		Daniel Pérez Rodríguez
#	@contact:
#	@link:
#	@license:
#	@version $Id: 	1.0

# -----
# NOTES
# -----
#

# -----------------
# GENERAL VARIABLES
# -----------------
# Common Variables

BASHERER_VERSION="1.0"
BASHERER_AUTHOR="Daniel Pérez Rodríguez"
BASHERER_AUTHOR_CONTACT="dpr.1980@gmail.com"
BASHERER_BASH_VERSION="4.3"

BASHERER_RED_B='\e[1;91m'
BASHERER_GREEN_B='\e[1;92m'
BASHERER_YELLOW_B='\e[1;93m'
BASHERER_BLUE_B='\e[1;94m'
BASHERER_PURPLE_B='\e[1;95m'
BASHERER_CYAN_B='\e[1;96m'
BASHERER_WHITE_B='\e[1;97m'
BASHERER_RESET='\e[0m'

# Environment values DEV|TEST|PROD
BASHERER_ENVIRONMENTS="DEV TEST PROD"
BASHERER_ENVIRONMENT=$1
BASHERER_ENVIRONMENT_OK=0
BASHERER_USAGEMSG="[ERROR] Correct Usage: bash $0 DEV|TEST|PROD"

# Runtime Variables
BASHERER_START_PATH=`pwd`

BASHERER_INIT_DATE_DAY=`date '+%d'`
BASHERER_INIT_DATE_MONTH_NAME=`date '+%B'`
BASHERER_INIT_DATE_MONTH=`date '+%m'`
BASHERER_INIT_DATE_YEAR=`date '+%Y'`
BASHERER_INIT_TIME_HOUR=`date '+%H'`
BASHERER_INIT_TIME_MIN=`date '+%M'`
BASHERER_INIT_TIME_SEC=`date '+%S'`
BASHERER_START_DATE=`date +%Y/%m/%d`
BASHERER_START_TIME=`date +%H:%M:%S`

# ---------------------
# FUNCTION DECLARATIONS
# ---------------------
# echo and print functions
bs_echoRed() { echo -e "${BASHERER_RED_B}${1}${BASHERER_RESET}"; }
bs_echoGreen() { echo -e "${BASHERER_GREEN_B}${1}${BASHERER_RESET}"; }
bs_echoYellow() { echo -e "${BASHERER_YELLOW_B}${1}${BASHERER_RESET}"; }
bs_echoBlue() { echo -e "${BASHERER_BLUE_B}${1}${BASHERER_RESET}"; }
bs_echoPurple() { echo -e "${BASHERER_PURPLE_B}${1}${BASHERER_RESET}"; }
bs_echoCyan() { echo -e "${BASHERER_CYAN_B}${1}${BASHERER_RESET}"; }
bs_echoWhite() { echo -e "${BASHERER_WHITE_B}${1}${BASHERER_RESET}"; }

bs_echoBigRed() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_RED_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigGreen() { TEXT=`figlet -k -w 200 "${1}"`  && echo -e "${BASHERER_GREEN_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigYellow() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_YELLOW_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigBlue() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_BLUE_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigPurple() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_PURPLE_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigCyan() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_CYAN_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigWhite() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_WHITE_B}${TEXT}${BASHERER_RESET}"; }

bs_aborting()
{
    bs_echoRed "\nAborting execution of $0...\n"
    exit 1
}

bs_echoFuckNvidia()
{
	bs_echoCyan "\nFuck NVidia! ┌∩┐(◣_◢)┌∩┐\n"
}

bs_bye()
{
    bs_echoGreen "\nExecution of $0 ended correctly. Bye!\n"
    exit 0
}

bs_echoToDo()
{
    bs_echoBigPurple "TODO"
}

bs_echoOK()
{
    bs_echoBigGreen "OK"
}

bs_echoNOTOK()
{
    bs_echoBigRed "!OK"
}

# Environment Functions
bs_checkEnvironmentCliParameter()
{
	if [ -z "$1" ]; then
		echo -e "\n$BASHERER_USAGEMSG"
		bs_aborting
	else
		BASHERER_ENVIRONMENT=$1
	fi
}

# Checking ENVIRONMENTS Value
bs_checkEnvironments()
{
	for ENV in $BASHERER_ENVIRONMENTS
	do
		if [ $BASHERER_ENVIRONMENT = $ENV ]; then
			BASHERER_ENVIRONMENT_OK=1
		fi
	done
	if [ $BASHERER_ENVIRONMENT_OK = 0 ];then
		echo -e "\n$BASHERER_ENVIRONMENT is not a valid value. Valid Values are DEV|TEST|PROD"
		bs_aborting
	fi
}

bs_showHeader()
{
    figlet "BASHERER" -k
    echo -ne "Version $BASHERER_VERSION\n"
}

bs_checkBashVersion()
{
    bs_echoToDo
}

bs_checkBashererDependencies()
{
    bs_echoToDo
}

bs_areYouSure()
{
    bs_echoRed "Press [y] to proceed OR any other key to abort: "

    read -p "$1" BASHERER_CONTINUE

	if [ "$BASHERER_CONTINUE" = "y" ]; then
		bs_echoGreen "Continue!"
	else
        #bs_echoRed "Aborted"
        bs_aborting
	fi
}

bs_correctUsage()
{
    if [ -z "$1" ]; then
        showError
        echo -ne "\n$BASHERER_USAGEMSG\n"
        exit
    else
        BASHERER_ENVIRONMENT=$1
    fi
}

bs_logMessage()
{
	bs_echoToDo
}

bs_echoDateTimeLogFormat()
{
    ONIBASH_NOW=`date +%Y/%m/%d\ -\ %T.%3N`
    echo -ne "\n[$ONIBASH_NOW] "
}

bs_echoInfo()
{
    bs_echoDateTimeLogFormat
    echo -ne "[INFO] $1"
}

bs_echoWarning()
{
    bs_echoDateTimeLogFormat
    echo -ne "[WARNING] $1"
}

bs_echoPoweredByBasherer()
{
    bs_echoCyan "Powered by Basherer v.$BASHERER_VERSION"
}

bs_initialEnvironmentsSetup
{
    bs_correctUsage
    bs_checkEnvironments
}

clear
bs_echoPoweredByBasherer
#bs_initialEnvironmentsSetup
