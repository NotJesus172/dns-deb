#!/bin/bash
echo "Enter your new password."
read PiHolePassword
pihole -a -p $PiHolePassword
