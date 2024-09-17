#!/bin/bash

#   Install nala:
sudo apt-get update
sudo apt-get install -y nala

#   Update the system:
sudo nala update
sudo nala upgrade -y

#   Install curl:
sudo nala install -y curl


echo "Would you like to begin the PiHole installation? (y/n)"
read readyState
if [ $readyState == "y" ]; then
    echo "Very well, the PiHole install will begin now."
elif [ $readyState == "Y" ]; then
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