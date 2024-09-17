#!/bin/bash
sudo nala install -y unbound
sudo cp pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
