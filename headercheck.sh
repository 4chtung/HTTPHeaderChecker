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

echo 
echo " _ _  ___  ___  ___   _ _              _             ___           _ "
echo "| | ||_ _||_ _|| . \ | | | ___  ___  _| | ___  _ _  |_ _|___  ___ | |"
echo "|   | | |  | | |  _/ |   |/ ._><_> |/ . |/ ._>| '_>  | |/ . \/ . \| |"
echo "|_|_| |_|  |_| |_|   |_|_|\___.<___|\___|\___.|_|    |_|\___/\___/|_|"
echo "                                                                     "
echo "HTTP Header Scanning Tool - 4chtung"
echo
echo -e "${BGRED}[+] Scanning ${BGRESET} $1 ${RESET}"

HEADER=$(curl -sS --head $1)

echo
echo

#echo HEADER TEST
#echo "${HEADER}"

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
if echo "$HEADER" | grep -qiF --regexp=Strict-Transport-Security; then
        echo -e "[+] X-Frame-Options:           ${GREEN}Header Present${RESET}"
else
        echo -e "[+] X-Frame-Options:           ${RED}Header Not Present${RESET}"
fi

#X-XSS-Protection
if echo "$HEADER" | grep -qiF --regexp=Strict-Transport-Security; then
        echo -e "[+] X-XSS-Protection:          ${GREEN}Header Present${RESET}"
else
        echo -e "[+] X-XSS-Protection:          ${RED}Header Not Present${RESET}"
fi

#Content-Security-Policy
if echo "$HEADER" | grep -qiF --regexp=Strict-Transport-Security; then
        echo -e "[+] Content-Security-Policy:   ${GREEN}Header Present${RESET}"
else
        echo -e "[+] Content-Security-Policy:   ${RED}Header Not Present${RESET}"
fi

#Referrer Policy
if echo "$HEADER" | grep -qiF --regexp=Strict-Transport-Security; then
        echo -e "[+] Referrer-Policy:           ${GREEN}Header Present${RESET}"
else
        echo -e "[+] Referrer-Policy:           ${RED}Header Not Present${RESET}"
fi

echo
echo

echo "${HEADER}"

########################################################################
# This would be the best way to do it. But its not case insensitive :( #
########################################################################
#
#shopt -s nocasematch
#
#case "$HEADER" in
#	*[["Strict-Transport-Security"]]* ) echo "Found!"
#	;;
#	* ) echo "Not Found!"
#	;;
#esac
#
#shopt -u nocasematch
