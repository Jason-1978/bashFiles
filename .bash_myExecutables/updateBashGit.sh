#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: Automate updating of bash from github 
#  
# FileName: updateBashGit.sh
# Created: 08/15/18 
# Modifed: 

#############################################

flag=$1
message="$2"

# Use flags to push or pull git 

if [ -n "$flag" ]; then
	if [ "$flag" == "--push" ]; then
		cd ~/.bash;
		git add . -A;
		git commit -m "$message";
		git push origin master;
		echo "Git added all, committed & pushed to remote."
		cd
	elif [ "$flag" == "--pull" ]; then
		cd ~/.bash;
		git pull origin master;
		echo "Git pulled from remote."
		cd
	else
		echo "Add '--push' or 'pull'"
	fi
else
	echo "Add '--push' or '--pull'"
fi
