#!/bin/bash
echo 'Debian 10 Script'
sleep 5
cat /dev/null > /etc/apt/sources.list
echo "#------------------------------------------------------------------------------#
#                   OFFICIAL DEBIAN REPOS                    
#------------------------------------------------------------------------------#

###### Debian Main Repos
deb http://deb.debian.org/debian/ stable main contrib non-free
deb-src http://deb.debian.org/debian/ stable main contrib non-free

deb http://deb.debian.org/debian/ stable-updates main contrib non-free
deb-src http://deb.debian.org/debian/ stable-updates main contrib non-free

deb http://deb.debian.org/debian-security stable/updates main
deb-src http://deb.debian.org/debian-security stable/updates main

deb http://ftp.debian.org/debian buster-backports main
deb-src http://ftp.debian.org/debian buster-backports main

#------------------------------------------------------------------------------#
#                      UNOFFICIAL  REPOS                       
#------------------------------------------------------------------------------#

###### 3rd Party Binary Repos
###Google Chrome Browser
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main

###Spotify
deb http://repository.spotify.com stable non-free

###Sublime Text
deb https://download.sublimetext.com/ apt/stable/

###Teamviewer
deb http://linux.teamviewer.com/deb stable main

###Virtualbox
deb [arch=i386,amd64] http://download.virtualbox.org/virtualbox/debian buster contrib

###Visual Studio Code
deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys A87FF9DF48BF1C90
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -
wget -O - https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
apt-key adv --keyserver ha.pool.sks-keyservers.net --recv-keys 818A435C5FCBF54A
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90

apt update
apt install libcanberra-gtk-module sublime-text code software-properties-common apt-transport-https wget terminator vlc synaptic openvpn git network-manager-openvpn curl wget apt-transport-https dirmngr -y
apt install google-chrome-stable qt4-qtconfig vpnc wine libavcodec-extra ffmpeg gcc build-essential linux-headers-$(uname -r) -y
####
echo "OK"

####sudoers
echo "Agregando a $USER a sudoers"
echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

