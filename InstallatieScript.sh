#!/bin/sh
V='0.0.3'
RED='\033[0;31m'
GRN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color
echo -e "${BLUE}HammerTECH automatisch installatie script... ${GRN}[${V}]${BLUE}"
echo "Laatste updates installeren..."
sudo apt-get update --assume-yes
sudo apt-get upgrade --assume-yes
sudo apt-get install curl
echo -e "${BLUE}Klaar, MagicMirror installeren... ${RED}INTERACTIE VEREIST!${BLUE}"
bash -c "$(curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh)" -y
echo -e "${BLUE}avoid_warnings=1" >>  /boot/config.txt
sudo apt-get install unclutter --assume-yes
echo "Extra modules installeren
cd ~/MagicMirror/modules 
git clone https://github.com/htilburgs/MMM-MyTraffic
git clone https://github.com/Taolanoz/MMM-RSS-FEED
git clone https://github.com/73cirdan/MMM-rainfc
echo "Opnieuw opstarten..."
reboot
#etc.
