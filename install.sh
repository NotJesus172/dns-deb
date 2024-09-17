#!/bin/bash

#   Install nala:
sudo apt-get update
sudo apt-get install -y nala

#   Update the system:
sudo nala update
sudo nala upgrade -y

#   Install curl:
sudo nala install -y curl

#   Install and configure pihole:
echo "Would you like to begin the PiHole installation? (y/n)"
read readyState
if [ $readyState == "y" ]; then
    echo "Very well, the PiHole install will begin now."
    sudo ./config/pihole.sh
elif [ $readyState == "Y" ]; then
    echo "Very well, the PiHole install will begin now."
    sudo ./config/pihole.sh
else
    exit 1
fi



#   
sudo ./config/setPasswd.sh