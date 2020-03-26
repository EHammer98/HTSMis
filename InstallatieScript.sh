#!/bin/bash
V='Versie: 0.1.1'
#RED='\033[0;31m'
#GRN='\033[0;32m'
#BLUE='\033[0;34m'
#BOLD='\e[1m'
#NC='\033[0m' 
echo -e "HammerTECH automatisch installatie script... ";"${V}";
echo "Laatste updates installeren...\n"
apt update
apt upgrade
echo "Klaar, MagicMirror installeren... INTERACTIE VEREIST!";
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
echo "BELANGRIJK! Noteer het volgende als Pi wachtwoord: ";
echo date +%s | sha256sum | base64 | head -c 16 > test1.txt
tmp=$(<test1.txt)
echo "$value";
yes $tmp | sudo passwd pi
rm test1.txt
echo "BELANGRIJK! Noteer het volgende als Pi MAC-adres: ";
IFACE=wlan0
read MAC </sys/class/net/$IFACE/address
echo "$IFACE $MAC" ;
echo "SSH aanzetten...";
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
shutdown -r now
#etc.