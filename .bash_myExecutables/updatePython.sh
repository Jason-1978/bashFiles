#!/bin/bash

### Need to finish fixing 3.7 to $updateVersion syntax using variables

#############################################

# Author: Jason Kralik
# Purpose: Automate updating python
#
# FileName: updatePython.sh
# Created: 02/01/19
# Modifed:

#############################################

currentVersion="$(python -V 2>&1)"
declare -a dependencies=(build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev libffi-dev)

read -p "Update Python to what version (current version is $currentVersion)? " updateVersion
echo "Upgrading Python from $currentVersion to $updateVersion"
read -p "Do you want to update/install dependencies(y or n)? " input

shortVersion="$(echo $updateVersion | head -c 3)"
shortVersionCurrent="$(echo $currentVersion | head -c 3)"

# Dependencies:
if [ "$input" == y ]; then
	sudo apt-get update
	sudo apt-get install -y "${dependencies[@]}"
fi

echo "Do you want to compile and make $updateVersion now(y or n)? "
read -p "NOTE: This easily takes 10+ minutes. " compile

# Compile (takes a while!):
if [ "$compile" == y ]; then
	check=$(source $HOME/.bash/.bash_myExecutables/checkURL.sh https://www.python.org/ftp/python/$updateVersion/Python-$updateVersion.tar.xz)
	echo "File URL status: $check"
	if [ "$check" == 200 ]; then
		wget https://www.python.org/ftp/python/$updateVersion/Python-$updateVersion.tar.xz
		tar xf Python-$updateVersion.tar.xz
		cd Python-$updateVersion
		./configure --prefix=/usr/local/opt/python-$updateVersion
		make -j 4

		echo "Installing..."
		sudo make altinstall

		read -p "Would you like to make Python $updateVersion default version(y or n)?" defaultVersion

		#Make Python 3.7 the default version, make aliases
		if [ "$defaultVersion" == y ]; then
			sudo ln -s /usr/local/opt/python-$updateVersion/bin/pydoc$shortVersion /usr/bin/pydoc$shortVersion
			sudo ln -s /usr/local/opt/python-$updateVersion/bin/python$shortVersion /usr/bin/python$shortVersion
			sudo ln -s /usr/local/opt/python-$updateVersion/bin/python$shortVersionm /usr/bin/python$shortVersionm
			sudo ln -s /usr/local/opt/python-$updateVersion/bin/pyvenv-$shortVersion /usr/bin/pyvenv-$shortVersion
			sudo ln -s /usr/local/opt/python-$updateVersion/bin/pip$shortVersion /usr/bin/pip$shortVersion

			echo "Changing alias python3 to $updateVersion in .bash/.bashAlias"
			sed -i 's/$shortVersionCurrent/$shortVersion/g' $HOME/.bash/.bashAlias
			source $HOME/.bash/._bashLoader
			#ls /usr/bin/python*
			cd ..
			sudo rm -rf Python-$updateVersion
			rm -f Python-$updateVersion.tar.xz
			#. ~/.bashrc
		fi
	else
		echo "File not available at URL."
	fi
fi


#And verify:
#python -V
#python3 -V

#And if you want to revert:
#update-alternatives --config python
