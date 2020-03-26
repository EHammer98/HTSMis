#!/bin/sh
V='Versie: 0.1.0'
RED='\033[0;31m'
GRN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\e[1m'
NC='\033[0m' 
echo -e "${BOLD}$ {BLUE}HammerTECH automatisch installatie script... ";" ${GRN} ${V} ${BLUE}";
echo "Laatste updates installeren...\n"
apt update
apt upgrade
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
echo -e "${RED}BELANGRIJK! ${BLUE} Noteer het volgende als Pi wachtwoord: ${GRN}";
echo date +%s | sha256sum | base64 | head -c 16 > test1.txt
tmp=$(<test1.txt)
echo "$value";
yes $tmp | sudo passwd pi
rm test1.txt
echo -e "${RED}BELANGRIJK! ${BLUE} Noteer het volgende als Pi MAC-adres: ${GRN}";
IFACE=wlan0
read MAC </sys/class/net/$IFACE/address
echo "$IFACE $MAC" ;
echo -e "${BLUE} SSH aanzetten...";
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
echo "Opnieuw opstarten...";
reboot
#etc.