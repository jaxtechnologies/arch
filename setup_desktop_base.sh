#!/usr/bin/env bash
# NAME: JTOS
# DESC: An installation and deployment script for JaxTech's Arch Cinnamon desktop.
# Adapted from Derek Taylor's (DistroTube) DTOS script...
# Top logo inspiration came from Chris Titus's ArchTitus script...
### TODO

clear

echo -ne "
   ████████╗  █████╗  ██╗   ██╗  ████████╗ ███████╗  ██████╗ ██╗  ██╗
   ╚══██╔══╝ ██╔══██╗  ██╗ ██╔╝  ╚══██╔══╝ ██╔════╝ ██╔════╝ ██║  ██║
      ██║    ███████║   ████╔╝      ██║    ███████╗ ██║      ███████║
   ██ ██║    ██╔══██║  ██╔╝██╗      ██║    ██╔════╝ ██║      ██╔══██║
   ╚███╔╝    ██║  ██║ ██╔╝  ██╗     ██║    ███████╗ ╚██████╗ ██║  ██║
    ╚══╝     ╚═╝  ╚═╝ ╚═╝   ╚═╝     ╚═╝    ╚══════╝  ╚═════╝ ╚═╝  ╚═╝
"
echo " JTOS script will launch in 5 seconds..."

sleep 5

install_path=$(pwd)

sudo pacman -Syu

sudo pacman -S openssh
sudo pacman -S vim
sudo pacman -S dos2unix
sudo pacman -S xrdp -y		#Allows RDP Connections to Linux
sudo adduser xrdp ssl-cert


clear
echo ""
read -p "Is this a Dual Boot Machine where the Grub Menu is needed to control the OS... (y/n)? "
if [ "$REPLY" = "n" ]; then

  echo ""
  echo Modifying Grub Menu to not display...  Please be patient...
  echo ""
  echo ""
  sudo sed -i 's/GRUB_TIMEOUT=5/GRUB_TIMEOUT=0/g' /etc/default/grub
  sudo update-grub

else
	cancel
fi


clear
echo ""
read -p "Does this machine need Synergy setup to connect to Synergy Server...  Say NO on SYNERGY SERVER CONTROLLER & VM INSTALLS... (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  echo ""
  echo ""
  echo " Enter the Synergy Server Hostname"
  echo ""
  echo ""
  read synergy_host
  echo ""
  echo ""
  echo Setting up Synergy...  Please be patient...
  echo ""
  echo ""
  sudo gdebi $install_path/synergy_1.14.5-stable.1b7140f2_ubuntu22_amd64.deb
  echo -e "\ngreeter-setup-script=/usr/bin/synergyc $synergy_host" | sudo tee -a /etc/lightdm/lightdm.conf.d/70-linuxmint.conf
  echo ""
  echo ""
  
else
	cancel
fi


clear
echo ""
read -p "Setup is Complete - Reboot the Machine NOW (y/n)? "
if [ "$REPLY" = "y" ]; then
	
  sudo reboot
  
else
	cancel
fi

exit
