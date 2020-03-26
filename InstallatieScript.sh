#!/bin/sh
V='Versie: 0.0.9'
RED='\033[0;31m'
GRN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\e[1m'
INV='\e[7m'
BLINK='\e[5m'
NC='\033[0m' # No Color
echo "${BLUE} ${BLINK} HammerTECH automatisch installatie script... ${GRN} ${V} ${BLUE} ${BOLD}";
echo "Laatste updates installeren...\n"
sudo apt update
sudo apt upgrade
echo -e "${BLUE}Klaar, MagicMirror installeren... ${RED}INTERACTIE VEREIST!${BLUE}";
#bash -c "$(curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh)" 
echo -e "${BLUE}avoid_warnings=1" >>  /boot/config.txt
sudo apt-get install unclutter 
echo "Extra modules installeren";
cd ~/MagicMirror/modules 
git clone https://github.com/htilburgs/MMM-MyTraffic
git clone https://github.com/Taolanoz/MMM-RSS-FEED
git clone https://github.com/73cirdan/MMM-rainfc
git clone https://github.com/eouia/MMM-Remote-Control-Repository
#bash -c "$(curl -sL https://raw.githubusercontent.com/Jopyth/MMM-Remote-Control/master/installer.sh)" 
echo "Wachtwoord veranderen van pi-user";
echo "${RED}BELANGRIJK! ${BLUE} Noteer het volgende als Pi wachtwoord: ${GRN} ${INV}";
echo date +%s | sha256sum | base64 | head -c 16 > test1.txt
tmp=$(<test1.txt)
echo "$value";
yes $tmp | sudo passwd pi
rm test1.txt
echo "${BOLD} ${RED}BELANGRIJK! ${BLUE} Noteer het volgende als Pi MAC-adres: ${GRN} ${INV}";
IFACE=wlan0
read MAC </sys/class/net/$IFACE/address
echo "$IFACE $MAC" ;
echo "${BOLD} ${BLUE} SSH aanzetten...";
sudo systemctl enable ssh 
sudo systemctl start ssh 
echo "WiFiSetup installeren en uitvoeren...";
sudo apt-get install unzip 
cd ~
mkdir WiFiSetup
wget "https://github.com/EHammer98/HTSMis/blob/master/WiFiSetup.zip"
unzip WiFiSetup.zip 
cd ~/WiFiSetup
sudo apt-get install -y python3-pip 
sudo python3 setup_lib.py
echo "${BLINK} Opnieuw opstarten...";
reboot
#etc.