#!/bin/bash

####
# NOTE--> Needs to be converted into functions & needs file already exists protection
####

fileName=$1
fileType=$2
fileClosed=$3

function format() {
cat >> $fileName << END

#############################################

# Author: Jason Kralik
# Purpose: 
#  
END
echo "# FileName: $(echo "$fileName")" >> $fileName
echo "# Created: $(date +"%D") " >> $fileName
cat >> $fileName << END
# Modifed: 

#############################################

END
}

function openFile () {
	if [ -n "$fileClosed" ] 
		then	
			if [ "$fileClosed" != "-c" ]
				then
					vi $fileName
			fi
	else
		vi $fileName
	fi
}

# this script needs to be made into functions for simplicity & easier addition of new files and customizations

# needs if file exists protection 

		if [ -n "$fileType" ]
			then
				if [ "$fileType" == "-b" ]
					then
						fileName="$fileName.sh"
						touch "$fileName"
						chmod 755 "$fileName"
						echo "#!/bin/bash" > "$fileName"
						format
						openFile
				elif [ "$fileType" == "-p" ]
					then
						fileName="$fileName.py"
						touch "$fileName"
						chmod 644 "$fileName"
						echo "import " > "$fileName"
						format
						openFile
				elif [ "$fileType" == "-t" ]
					then
						fileName="$fileName.txt"
						touch "$fileName"
						chmod 644 "$fileName"
						echo "" > $fileName
						format
						openFile
				else
						echo "Flag does not exist."
						echo "-b for bash | -p for python | -t for text"
				fi
		else
			fileName="$fileName.txt"
			fileClosed=$filetype
			touch "$fileName"
			chmod 644 "$fileName"
			echo "" > $fileName
			format
		fi
