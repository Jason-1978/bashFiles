#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: Automate keygen & scp to remote
#  
# FileName: ssh-keySend.sh.sh
# Created: 08/12/18 
# Modifed: 
# NOTE: brew install ssh-copy-id --> needs 
#		to check if installed & ask to install
#		automation for Mac OS

#############################################

arg=$1
remoteHostIP=""

if [[ $arg =~ ^[a-zA-Z1-9._\-]+@([0-9]{1,3}).([0-9]{1,3}).([0-9]{1,3}).([0-9]{1,3})$ ]]; then 
	remoteHostIP="$arg"
elif [[ $arg =~ ^([0-9]{1,3})$ ]]; then
	remoteHostIP="pi@10.0.1.$arg"
else 
	echo "ERROR: IP address NOT recognized as valid"
	echo "$arg"
	exit 1
fi

OS=$(uname)

if [ ! -d ~/.ssh/ ]; then
	mkdir ~/.ssh/
fi

if [ ! -f ~/.ssh/id_rsa ] && [ ! -f ~/.ssh/id_rsa.pub ]; then
	ssh-keygen -t rsa -b 4096
elif [ ! -f ~/.ssh/id_rsa ] && [ -f ~/.ssh/id_rsa.pub ]; then
	echo "ERROR: Private SSH key doesn't exist."
	exit 1
elif [  -f ~/.ssh/id_rsa ] && [ ! -f ~/.ssh/id_rsa.pub ]; then
	echo "ERROR: SSH key already exist."
	exit 1
else 
	echo "SSH keys already exist."
fi

if [ "$OS" == "Darwin" ]; then
	echo "If not installed please install this and try again..."
	echo "brew install ssh-copy-id"
	echo "This needs to be updated but I am too busy with other things to do this now."
fi

echo "Attempting ssh-copy-id $remoteHostIP"
ssh-copy-id $remoteHostIP

### Can change config file to disable password login to limit login to only ssh:
# sudo nano ~/etc/ssh/sshd_config --> Password Authentication no
# sudo service ssh restart

