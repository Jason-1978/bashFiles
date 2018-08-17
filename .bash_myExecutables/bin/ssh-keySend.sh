#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: Automate keygen & scp to remote
#  
# FileName: ssh-keySend.sh.sh
# Created: 08/12/18 
# Modifed: 

#############################################

remoteHostIP=$1
OS=$uname

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
	brew install ssh-copy-id
fi

ssh-copy-id pi@10.0.1.$remoteHostIP

### Can change config file to disable password login to limit login to only ssh:
# sudo nano ~/etc/ssh/sshd_config --> Password Authentication no
# sudo service ssh restart

