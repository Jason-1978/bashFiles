#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: 
#  
# FileName: tester.sh
# Created: 03/05/19 
# Modifed: 

#############################################

git ls-remote --exit-code origin >> /dev/null
if test $? = 0; then 
	echo "true"
else
	echo "false"
fi
