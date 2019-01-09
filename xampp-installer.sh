#!/bin/bash
# --------------------------------------
# @name: XAMPP Ubuntu installer
# @Description: XAMPP Ubuntu installer script, downloads required packages, creates icon and leaves ready to use.
# @author: drodmun@gmail.com
# @version: 0.0.1
# --------------------------------------

clear

echo ""
echo ""

echo "     __  __    _     __  __   ___   ___         _   _   ___   _   _   _  _   _____   _   _     _               _            _   _             "
echo "     \ \/ /   /_\   |  \/  | | _ \ | _ \  ___  | | | | | _ ) | | | | | \| | |_   _| | | | |   (_)  _ _    ___ | |_   __ _  | | | |  ___   _ _ "
echo "      >  <   / _ \  | |\/| | |  _/ |  _/ |___| | |_| | | _ \ | |_| | | .\ |   | |   | |_| |   | | | ' \  (_-< |  _| / _\ | | | | | / -_) | '_|"
echo "     /_/\_\ /_/ \_\ |_|  |_| |_|   |_|          \___/  |___/  \___/  |_|\_|   |_|    \___/    |_| |_||_| /__/  \__| \__,_| |_| |_| \___| |_|  "

echo ""
echo ""

# Uncommment for old ubuntu version < 17.10
# which gksu > /dev/null 2>&1
# if [ $? != 0 ] 
# then
#     echo "gksu is not installed. "
#     sudo apt-get install gksu
# fi

echo ""
echo ""

cd /tmp
echo "------> Downloading installer in" $(pwd) "..."

echo ""
echo -n "------> Default PHP version 7, prefer PHP5? (y/N): "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    wget https://www.apachefriends.org/xampp-files/5.6.33/xampp-linux-x64-5.6.33-0-installer.run
    XAMPP_INSTALLER_FILE="xampp-linux-x64-5.6.33-0-installer.run"
else
    wget https://www.apachefriends.org/xampp-files/7.2.2/xampp-linux-x64-7.2.2-0-installer.run
    XAMPP_INSTALLER_FILE="xampp-linux-x64-7.2.2-0-installer.run"
fi

echo ""
echo "------> Giving installer sudo permissions..."
sudo chmod +x $XAMPP_INSTALLER_FILE

echo ""
echo "------> Running installer..."
sudo ./$XAMPP_INSTALLER_FILE

echo ""
echo "------> Creating launcher..."
echo -e ‘[Desktop Entry]\n Version=1.0\n Name=xampp\n Exec=pkexec /opt/lampp/manager-linux-x64.run\n Icon=/opt/lampp/icons/world1.png\n Type=Application\n Categories=Application’ | sudo tee /usr/share/applications/xampp.desktop