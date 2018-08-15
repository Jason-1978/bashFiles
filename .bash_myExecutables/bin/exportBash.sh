#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: To facilitate exporting of my bash environment
#  
# FileName: exportBash.sh
# Created: 08/12/18 
# Modifed: 

#############################################

REMOTE=$1

scp ~/.bash_profile $REMOTE:~/.bash_profile;
scp -r ~/.bash/ $REMOTE:~/.bash/
