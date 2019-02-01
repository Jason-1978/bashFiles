#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: Password authentication toggle for 
#  increased security in ssh
# FileName: sshPasswordSwitch.sh
# Created: 08/17/18 
# Modifed: 

#############################################

OS=$(uname)
declare FILE="/etc/ssh/sshd_config"
declare DEFAULT='#PasswordAuthentication[[:space:]]yes'
declare YES='PasswordAuthentication[[:space:]]yes'
declare NO='PasswordAuthentication[[:space:]]no'
declare default='#PasswordAuthentication yes'
declare yes='PasswordAuthentication yes'
declare no='PasswordAuthentication no'

if grep -qe ^$YES "$FILE"; then
   #echo $?
   CURRENT=$yes
	 #echo "yes"
elif grep -qe ^$NO "$FILE"; then
   #echo $? 
   CURRENT=$no
   #echo "no"
elif grep -qe ^$DEFAULT "$FILE"; then
   #echo $? 
   CURRENT=$default
   #echo "default"
else 
	# Error catch (File/string missing):
   echo "ERROR: File missing or string does not exist"
	 echo "$FILE"
   exit 1
fi

# NEW variable set & error catch (wrong flag):
if [ "$1" == "--yes" ]; then
	NEW=$yes
elif [ "$1" == "--no" ]; then
	NEW=$no
elif [ "$1" == "--default" ]; then
	NEW=$default
else 
	echo "Options: --yes --no --default"
	exit 1
fi

if [ "$OS" == "Darwin" ]; then
	echo "OS: $OS"
	echo "FILE: $FILE"
	echo "CURRENT: $CURRENT"
	echo "NEW: $NEW"
	if [ $CURRENT == $yes ] && [ $NEW == $default ]; then
		 find /etc/ssh/sshd_config -type f -exec sudo sed -i "" 's/PasswordAuthentication yes/#PasswordAuthentication yes/g' {} \;
	fi
	#find $FILE -name $CURRENT -type f -exec sudo sed -i "" 's/$CURRENT/$NEW/1' {} \;
	# grep "$NEW" "$FILE" 
fi

if [ "$OS" == "Linux" ]; then
	echo "LINUX"
	find "$FILE" -type f -exec sudo sed -i 's/$CURRENT/$NEW/g' {} \;
fi

# find /etc/ssh/sshd_config -type f -exec sudo sed -i "" 's/PasswordAuthentication yes/#PasswordAuthentication yes/g' {} \;

