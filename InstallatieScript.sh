#!/bin/sh
BLUE='\033[0;34m'
NC='\033[0m' # No Color
echo -e "${BLUE}HammerTECH automatisch installatie script... Even geduld a.u.b., uw systeem kan meerdere malen opnieuw opstarten."
echo -e "${BLUE}Laatste updates installere..."
apt-get update -y
apt-get upgrade -y
apt-get install curl
echo "Klaar, MagicMirror installeren..."
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
apt-get install -y nodejs
git clone https://github.com/MichMich/MagicMirror
cd MagicMirror/
npm install -g electron@6.0.12
echo "Klaar, automatisch MagicMirror opstarten inschakelen"
pm2 startup
cd ~
echo "cd ~/MagicMirror" >> mm.sh
echo "DISPLAY=:0 npm start" >> mm.sh
chmod +x mm.sh
pm2 start mm.sh
pm2 save
echo "Klaar, laatste dingen inorde maken..."
echo "@xset s noblank" >>  ~/.config/lxsession/LXDE/autostart
echo "@xset s off" >>  ~/.config/lxsession/LXDE/autostart
echo "@xset s -dpms" >>  ~/.config/lxsession/LXDE/autostart
echo "avoid_warnings=1" >>  /boot/config.txt
apt-get install unclutter
echo "Opnieuw opstarten..."
reboot
#etc.
