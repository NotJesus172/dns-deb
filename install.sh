#!/bin/bash
sudo apt-get update
sudo apt-get install -y nala
sudo nala update
sudo nala upgrade -y
sudo nala install -y curl
curl -sSL https://install.pi-hole.net | bash
pihole -a -p 9soHsy