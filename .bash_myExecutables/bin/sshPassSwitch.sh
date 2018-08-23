#!/bin/bash

### THIS SCRIPT DOES NOT WORK FOR UNKNOWN REASONS

#############################################

# Author: Jason Kralik
# Purpose: 
#  
# FileName: sshPassSwitch.sh
# Created: 08/22/18 
# Modifed: 

#############################################

OS=$(uname)
###
declare default="#PasswordAuthentication yes"
declare yes="PasswordAuthentication yes"
declare no="PasswordAuthentication no"
###
declare FILE="/etc/ssh/sshd_config"
###
declare DEFAULT="^#PasswordAuthentication[[:space:]]yes"
declare YES="^PasswordAuthentication[[:space:]]yes"
declare NO="^PasswordAuthentication[[:space:]]no"
###
declare NEW="$1"
###

###find /etc/ssh/sshd_config -type f -exec sudo sed -i "" 's/PasswordAuthentication yes/#PasswordAuthentication yes/g' {} \;

if grep -q "$DEFAULT" $FILE; then
	OLD="OLD: Default"
	old="$default"
elif grep -q "$YES" $FILE; then
	OLD="OLD: Yes"
	old="$yes"
elif grep -q "$NO" $FILE; then
	OLD="OLD: No"
	old="$no"
else
	echo "Problem"
fi

# OLD="YES: $yes"
# NEW="NEW: default $INPUT"

if [ "$1" == "default" ]; then
	NEW="NEW: Default"
	new="$default"
elif [ "$1" == "yes" ]; then
	NEW="NEW: Yes"
	new="$yes"
elif [ "$1" == "no" ]; then
	NEW="NEW: No"
	new="$no"
else
	echo "ERROR"
fi

# Darwin
if [ "$OS" == "Darwin" ]; then
	echo "Darwin running"
	echo "$OLD"
	echo "$old"
	echo "$NEW"
	echo "$new"
	echo "find $FILE -type f -exec sudo sed -i \"\" 's/$old/$new/g' {} \;"
	find $FILE -type f -exec sudo sed -i "" 's/$old/$new/g' {} \;
fi

# Linux
if [ "$OS" == "Linux" ]; then
	echo "Linux running"
	echo "$OLD"
	echo "$old"
	echo "$NEW"
	echo "$new"
	find /etc/ssh/sshd_config -type f -exec sudo sed -i 's/$old/$new/g' {} \;
fi
