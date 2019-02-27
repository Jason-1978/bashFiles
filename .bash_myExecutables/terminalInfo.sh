#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: Print terminal info
#  
# FileName: terminalInfo.sh
# Created: 02/27/19 
# Modifed: 

#############################################

echo $TERM

echo "Terminal longname: "
tput longname

echo "Screen longname: "
tput -T screen longname

echo "Available colors: "
tput colors

echo "Window columns available: "
tput cols
