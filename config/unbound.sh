#!/bin/bash
sudo nala install -y unbound
sudo cp ./config/pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
