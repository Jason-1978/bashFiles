#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: 
#  
# FileName: sshd_config-Changer.sh
# Created: 08/22/18 
# Modifed: 

#############################################

read -p "Would you like to change password settings for remote login through ssh to this system? " answer

answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [ "$answer" == "yes" ]; then 
	answer="y"
fi

if [ "$answer" == "y" ]; then
	read -p "Change line 58 (press enter to continue using vi)" -n 1 -s
	echo " "
	sudo vi /etc/ssh/sshd_config
fi
