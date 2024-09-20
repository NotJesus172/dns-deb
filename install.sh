#!/bin/bash

#   Install nala:
sudo apt-get update
sudo apt-get install -y nala
#   Update the system:
sudo nala update
sudo nala upgrade -y
#   Install curl:
sudo nala install -y curl
#   Make all nested scripts executable:
sudo chmod +x ./config/pihole.sh
sudo chmod +x ./config/setPasswd.sh
sudo chmod +x ./config/unbound.sh
sudo chmod +x ./gravity-sync.sh
#   Check in to make sure you want to install pihole:
echo "Would you like to begin the PiHole installation? (y/n)"
read readyState
if [[ $readyState == "y" || $readyState == "Y" ]]; then
    echo "Very well, the PiHole install will begin now."
else
    exit 1
fi
#   Install and configure pihole:
sudo ./config/pihole.sh
#   Set the fresh pihole password:
sudo ./config/setPasswd.sh
#   Install and configure unbound:
sudo ./config/unbound.sh
#   Check in to make sure you want to install gravity-sync:
echo "Would you like to install Gravity-Sync? (y/n)"
read syncState
if [[ $syncState == "y" || $syncState == "Y" ]]; then
    echo "Very well, the Gravity-Sync install will begin now."
    #   Install  gravity sync:
    sudo ./gravity-sync.sh
else
    #   Future install instructions:
    echo "Gravity-Sync will NOT be installed now."
    echo "If you would like to Install it at a later time, return to this directory and run './gravity-sync.sh' to begin the installer."
fi