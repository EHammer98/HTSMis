#!/bin/sh
V='0.0.3'
RED='\033[0;31m'
GRN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
echo -e "${BLUE}HammerTECH automatisch installatie script... ${GRN}[${V}]${BLUE}"
echo "Laatste updates installeren..."
apt-get update --assume-yes
apt-get upgrade --assume-yes
apt-get install curl
echo -e "${BLUE}Klaar, MagicMirror installeren... ${RED}INTERACTIE VEREIST!${BLUE}"
bash -c "$(curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh)" -y
echo -e "${BLUE}avoid_warnings=1" >>  /boot/config.txt
apt-get install unclutter --assume-yes
echo "Opnieuw opstarten..."
reboot
#etc.
