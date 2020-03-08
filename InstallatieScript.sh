#!/bin/sh
echo "HammerTECH automatisch installatie script... Even geduld a.u.b., uw systeem kan meerdere malen opnieuw opstarten."
echo "Laatste updates installere..."
apt-get update -y
apt-get upgrade -y
echo "Klaar, MagicMirror installeren..."
bash -c "$(curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh)"
npm install -g electron@1.7.6
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