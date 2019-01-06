#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: 
#  
# FileName: coreTemp.sh
# Created: 01/04/19 
# Modifed: 

#############################################

OS=$(uname)

if [ $OS == "Darwin" ]; then
	istats
fi

if [ $OS == "Linux" ]; then
	/opt/vc/bin/vcgencmd measure_temp
fi
