#!/bin/bash

#HTTP HEADER CHECKER
#Written By 4chtung

# HOLY CRAP COLOUR!
ESC="\e["
RESET=$ESC"39m"

RED=$ESC"31m"
BLUE=$ESC"94m"
GREEN=$ESC"32m"

BGRED=$ESC"101m"$ESC"30m"
BGRESET=$ESC"49m"$ESC"39m"

# Other Variables
TARGET=""

function fancyintro {

echo
echo " _ _  ___  ___  ___   _ _              _             ___           _ "
echo "| | ||_ _||_ _|| . \ | | | ___  ___  _| | ___  _ _  |_ _|___  ___ | |"
echo "|   | | |  | | |  _/ |   |/ ._><_> |/ . |/ ._>| '_>  | |/ . \/ . \| |"
echo "|_|_| |_|  |_| |_|   |_|_|\___.<___|\___|\___.|_|    |_|\___/\___/|_|"
echo "                                                                     "
echo "HTTP Header Scanning Tool --- 4chtung - (FriedSec)"
echo "V1.2 - Added Redirect Support"
echo "V1.1 - Added Support For Text File Analysis"
echo

}

function usage {
echo
echo "A fairly quick a dirty shell script to see which recommended HTTP Headers are missing."
echo
echo "Usage: "
echo
echo "-u <URL>  : Connect to a URL and check the HTTP Headers."
echo "-f <FILE> : Look at a file for HTTP Headers."
echo
echo

}

function urlscan {
	echo -e "${BGRED}[+] Scanning ${BGRESET} $URLTARGET ${RESET}"
	HEADER=$(curl -L -k -sS --head $URLTARGET)
	echo
	echo
}

function filescan {
	echo -e "${BGRED}[+] Reading ${BGRESET} $FILETARGET ${RESET}"
	HEADER=$(cat $FILETARGET)
	echo
	echo
}

###############################################################################

fancyintro

while getopts ":u:f:" opt;
do
	case $opt in

	u) URLTARGET="${OPTARG}"
	urlscan
	;;
	f) FILETARGET="${OPTARG}"
	filescan
	;;
	*) usage 
	exit 1
	;;
	esac
done

################
#HEADER TESTING#
################

#Strict-Transport-Security
if echo "$HEADER" | grep -qiF --regexp=Strict-Transport-Security; then
	echo -e "[+] Strict Transport Security: ${GREEN}Header Present${RESET}"
else
	echo -e "[+] Strict Transport Security: ${RED}Header Not Present${RESET}"
fi

#X-Content-Type-Options
if echo "$HEADER" | grep -qiF --regexp=X-Content-Type-Options; then
        echo -e "[+] X-Content-Type-Options:    ${GREEN}Header Present${RESET}"
else
        echo -e "[+] X-Content-Type-Options:    ${RED}Header Not Present${RESET}"
fi

#X-Frame-Options
if echo "$HEADER" | grep -qiF --regexp=X-Frame-Options; then
        echo -e "[+] X-Frame-Options:           ${GREEN}Header Present${RESET}"
else
        echo -e "[+] X-Frame-Options:           ${RED}Header Not Present${RESET}"
fi

#X-XSS-Protection
if echo "$HEADER" | grep -qiF --regexp=X-XSS-Protection; then
        echo -e "[+] X-XSS-Protection:          ${GREEN}Header Present${RESET}"
else
        echo -e "[+] X-XSS-Protection:          ${RED}Header Not Present${RESET}"
fi

#Content-Security-Policy
if echo "$HEADER" | grep -qiF --regexp=Content-Security-Policy; then
        echo -e "[+] Content-Security-Policy:   ${GREEN}Header Present${RESET}"
else
        echo -e "[+] Content-Security-Policy:   ${RED}Header Not Present${RESET}"
fi

#Referrer Policy
if echo "$HEADER" | grep -qiF --regexp=Referrer-Policy; then
        echo -e "[+] Referrer-Policy:           ${GREEN}Header Present${RESET}"
else
        echo -e "[+] Referrer-Policy:           ${RED}Header Not Present${RESET}"
fi

echo
echo

echo "${HEADER}"
echo
echo
