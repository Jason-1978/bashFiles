#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: To ensure that all systems have same
#  brew & apt-get installed
# FileName: brewInstalls.sh
# Created: 02/16/19 
# Modifed: 

#############################################

declare -a brewPackages=( bash-snippets cask tree htop )
declare -a aptPackages=()

OS=$(uname)

echo "This command is for setting up my familiar packages for the OS."

if [ $OS == "Darwin" ]; then
	read -p "Using Darwin... Would you like to sync brew with git(y or n)? " input
	if [ $input == "y" ]; then
		output=$(which -s brew)
		if [ $? == 1 ]; then
			echo "Installing brew to this machine... "
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		fi
		echo "Installing brew packages... "
		
		for i in "${brewPackages[@]}"
			do
					brew install $i
			done
	fi
	echo "Current Brew Packages: "
	brew list
elif [ $OS == "Linux" ]; then
	read -p "Using Linux... Would you like to sync apt-get with git(y or no)?" input
	echo "Linux not setup for this command..."
	echo "Configure in packageIntaller.sh"
else
	echo "OS not managed"
fi
