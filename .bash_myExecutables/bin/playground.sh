#!/bin/bash

### NOTE: Do not remove this. It is intended to prevent accidental
#		use of this script which could damage this system

if [ "--safe" != "$1" ]; then 
	echo "Please check the script before running"
	echo "--safe flag must be used"
	exit 1
fi

#############################################

# Author: Jason Kralik
# Purpose: A place to test syntax and ideas for bash 
#  
# FileName: playground.sh
# Created: 08/21/18 
# Modifed: 

#############################################

### Additional flags start with $2...

OS=$(uname)

echo $OS
