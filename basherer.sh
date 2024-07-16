#!/bin/bash
# --------------------
# basherer.sh
# --------------------
#	@author:	Daniel Pérez Rodríguez
#	@contact:	dpr.1980@gmail.com
#	@link:		https://github.com/DaniTeleco/basherer/
#	@license:	http://www.apache.org/licenses/LICENSE-2.0
#	@version $Id: 	1.0
#
# -----
# NOTES
# -----
#
# ------------
# INSTALLATION
# ------------
#   cd $HOME
#   wget https://raw.githubusercontent.com/DaniTeleco/basherer/main/basherer.sh
#
#
#
# ------------------
# SYSTEM INTEGRATION
# ------------------
#
#   For custom users:
#
#      ln -s /route/to/your/file/basherer.sh $HOME/.basherer.sh
#
#   For ALL users:
#
#
# -----
# USAGE
# -----
#   Include the next lines at the beggining of your scripts:

#   #!/bin/bash
#   source $HOME/.basherer.sh "$@"
#   bs_initialEnvironmentsSetup "$@"                    					# [Optional]
#   bs_setExecutionPathSecure "/some/path/you/need/to/be/sure/command/has/to/be/executed/in"	# [Optional]
#   bs_checkExecutionPathSecure "$@"                    					# [Optional]
#
#
# ------------------
# BASHERER VARIABLES
# ------------------
# Common Variables
BASHERER_VERSION="1.0"
BASHERER_AUTHOR="Daniel Pérez Rodríguez"
BASHERER_AUTHOR_CONTACT="dpr.1980@gmail.com"
BASHERER_BASH_VERSION="4.3"
# ANSI Color Codes Variables
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
BASHERER_EXECUTION_PATH=`pwd`
BASHERER_EXECUTION_PATH_SECURE=""

# ---------------------
# FUNCTION DECLARATIONS
# ---------------------
# Basic echo functions
bs_echoRed() { echo -e "${BASHERER_RED_B}${1}${BASHERER_RESET}"; }
bs_echoGreen() { echo -e "${BASHERER_GREEN_B}${1}${BASHERER_RESET}"; }
bs_echoYellow() { echo -e "${BASHERER_YELLOW_B}${1}${BASHERER_RESET}"; }
bs_echoBlue() { echo -e "${BASHERER_BLUE_B}${1}${BASHERER_RESET}"; }
bs_echoPurple() { echo -e "${BASHERER_PURPLE_B}${1}${BASHERER_RESET}"; }
bs_echoCyan() { echo -e "${BASHERER_CYAN_B}${1}${BASHERER_RESET}"; }
bs_echoWhite() { echo -e "${BASHERER_WHITE_B}${1}${BASHERER_RESET}"; }
# Figlet (echo) functions
bs_echoBigRed() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_RED_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigGreen() { TEXT=`figlet -k -w 200 "${1}"`  && echo -e "${BASHERER_GREEN_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigYellow() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_YELLOW_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigBlue() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_BLUE_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigPurple() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_PURPLE_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigCyan() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_CYAN_B}${TEXT}${BASHERER_RESET}"; }
bs_echoBigWhite() { TEXT=`figlet -k -w 200 "${1}"` && echo -e "${BASHERER_WHITE_B}${TEXT}${BASHERER_RESET}"; }
# System and Exit Control functions

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
		bs_echoWarning "$BASHERER_USAGEMSG"
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
		bs_echoWarning "$BASHERER_ENVIRONMENT is not a valid value. Valid Values are DEV|TEST|PROD"
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
        bs_aborting
	fi
}

bs_correctUsage()
{
    if [ -z "$1" ]; then
        bs_echoWarning "$BASHERER_USAGEMSG"
        exit
    else
        BASHERER_ENVIRONMENT=$1
    fi
}

bs_initialEnvironmentsSetup()
{
    bs_checkEnvironmentCliParameter "$@"
    bs_correctUsage "$@"
    bs_checkEnvironments
}

bs_logMessage()
{
	bs_echoToDo
}

bs_echoDateTimeLogFormat()
{
    ONIBASH_NOW=`date +%Y/%m/%d\ -\ %T.%3N`
    echo -ne "[$ONIBASH_NOW] "
}

bs_echoSuccess()
{
    bs_echoDateTimeLogFormat
    bs_echoGreen "[INFO] $1"
}

bs_echoInfo()
{
    bs_echoDateTimeLogFormat
    bs_echoBlue "[INFO] $1"
}

bs_echoWarning()
{
    bs_echoDateTimeLogFormat
    bs_echoYellow "[WARNING] $1"
}

bs_echoPoweredByBasherer()
{
    bs_echoCyan "Powered by Basherer v.$BASHERER_VERSION"
}

bs_checkExecutionPathSecure()
{
    bs_echoInfo "Execution Path: $BASHERER_EXECUTION_PATH"
    if [[ "$BASHERER_EXECUTION_PATH" == *"$BASHERER_EXECUTION_PATH_SECURE" ]]; then
        bs_echoInfo "Execution is correctly located in $BASHERER_EXECUTION_PATH"
    else
        bs_echoWarning "We are not in the correct path to execute: $BASHERER_EXECUTION_PATH_SECURE."
        bs_aborting
    fi
}

bs_setExecutionPathSecure()
{
    BASHERER_EXECUTION_PATH_SECURE=$1
    bs_echoInfo "Execution Path Secure set to: $BASHERER_EXECUTION_PATH"
}

bs_checkRunningAsRoot()
{
    if [ `id -u` -ne 0 ]; then 
	bs_echoWarning "Please run as root ..."
        bs_aborting
	
    else
	bs_echoInfo "Correctly running as root user"
    fi
}

# Start script with BASHERER
clear
bs_echoPoweredByBasherer
#bs_initialEnvironmentsSetup
