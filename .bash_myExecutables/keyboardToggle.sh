#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: Keyboard Toggle Script to disable
#		or reenable builtin keyboard on MacBook
# FileName: keyboardToggle.sh
# Created: 11/06/18 
# Modifed: 

#############################################


read -p "Turn builtin keyboard off (y or n)?" input

if [ "$input" == "y" ]
	then
		sudo kextunload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext
elif [ "$input" == "n" ]
	then
		sudo kextload /System/Library/Extensions/AppleUSBTopCase.kext/Contents/PlugIns/AppleUSBTCKeyboard.kext
else
		echo "Script aborted (Please enter valid arg)"
fi
