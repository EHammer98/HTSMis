#!/bin/sh'
V='0.3.1'
RED='\033[0;31m'
GRN='\033[0;32m'
BLUE='\033[0;34m'
BOLD='\e[1m'
NC='\033[0m' 
echo -e "${BOLD}HammerTECH automatisch installatie script...";
echo -e "${GRN} ${V} ${NC}";
echo "Laatste updates installeren...";
yes | sudo apt update
yes | sudo apt upgrade
echo -e "Klaar, MagicMirror installeren... ${RED}INTERACTIE VEREIST!${NC}";
yes | bash -c "$(curl -sL  https://raw.githubusercontent.com/sdetweil/MagicMirror_scripts/master/raspberry.sh)" 
sleep 2m
pm2 stop MagicMirror
echo "avoid_warnings=1" | sudo tee -a /boot/config.txt
sudo rm /etc/rc.local
echo "#!bin/sh -e
sudo apt-get update -y
sudo apt-get upgrade -y
sudo python3 setup_lib.py
exit 0" | sudo tee -a /etc/rc.local
echo "@xset s noblank
@xset s off
@xset -dmps" | sudo tee -a /etc/xdg/lxsession/LXDE-pi/autostart
yes | sudo apt-get install unclutter 
echo "cd ~/MagicMirror
DISPLAY:0 npm start" >> ~/mm.sh
sudo chmod +x ~/mm.sh
echo "Extra modules installeren";
git clone https://github.com/htilburgs/MMM-MyTraffic ~/MagicMirror/modules 
git clone https://github.com/Taolanoz/MMM-RSS-FEED ~/MagicMirror/modules 
git clone https://github.com/73cirdan/MMM-rainfc ~/MagicMirror/modules 
git clone https://github.com/eouia/MMM-Remote-Control-Repository ~/MagicMirror/modules 
yes | bash -c "$(curl -sL https://raw.githubusercontent.com/Jopyth/MMM-Remote-Control/master/installer.sh)" 
echo "Wachtwoord veranderen van pi-user";
echo -e "${RED}BELANGRIJK! ${NC} Noteer het volgende als Pi wachtwoord: ${GRN}";
echo date +%s | sha256sum | base64 | head -c 16 > test1.txt
tmp=$(<test1.txt)
echo -e "$tmp";
echo -e "${NC}";
yes $tmp | sudo passwd pi
rm test1.txt
echo -e "${RED}BELANGRIJK! ${NC} Noteer het volgende als Pi MAC-adres: ${GRN}";
IFACE=wlan0
read MAC </sys/class/net/$IFACE/address
echo "$IFACE $MAC" ;
sleep 1m
echo -e "${NC} SSH aanzetten...";
sudo systemctl enable ssh 
sudo systemctl start ssh 
echo "WiFiSetup installeren en uitvoeren...";
yes | sudo apt-get install unzip 
mkdir ~/WiFiSetup
sudo curl -L "https://github.com/EHammer98/HTSMis/raw/master/WiFiSetup.zip" > ~/WiFiSetup.zip
yes | sudo unzip ~/WiFiSetup.zip -d ~/WiFiSetup
cd ~/WiFiSetup
yes | sudo apt-get install -y python3-pip 
sudo python3 initial_setup.py
pm2 start MagicMirror
echo "Opnieuw opstarten...";
shutdown -r now
#etc.