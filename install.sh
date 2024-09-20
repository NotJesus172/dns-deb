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
sudo chmod +x ./pihole.sh
sudo chmod +x ./resetPasswd.sh
sudo chmod +x ./unbound.sh
sudo chmod +x ./gravity-sync.sh
#   Pihole install prompt:
echo "Would you like to begin the pihole installation? (y/n)"
read piholeState
if [[ $piholeState == "y" || $piholeState == "Y" ]]; then
    echo "Very well."
    #   Install and configure pihole:
    sudo ./pihole.sh
    #   Set the fresh pihole password:
    sudo ./resetPasswd.sh
else
    exit 1
fi
#   Unbound install prompt
echo "Would you like to begin the unbound installation? (y/n)"
read unboundState
if [[ $unboundState == "y" || $unboundState == "Y" ]]; then
    echo "Very well."
#   Install and configure unbound:
sudo ./unbound.sh
else
    #   Future install instructions:
    echo "Unbound will NOT be installed now."
    echo "If you would like to install it at a later time, return to this directory and run './unbound.sh' to begin the installer."
    sleep 3
fi
#   Gravity-sync install prompt:
echo "Would you like to install gravity-sync? (y/n)"
read gravityState
if [[ $gravityState == "y" || $gravityState == "Y" ]]; then
    echo "Very well."
    #   Install gravity sync:
    sudo ./gravity-sync.sh
else
    #   Future install instructions:
    echo "Gravity-sync will NOT be installed now."
    echo "If you would like to install it at a later time, return to this directory and run './gravity-sync.sh' to begin the installer."
    sleep 3
fi
# Clear before ending:
clear
echo "Installation complete."
