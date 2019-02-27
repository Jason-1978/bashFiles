#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: 
#  
# FileName: colors.sh
# Created: 02/22/19 
# Modifed: 

#############################################
echo "This is a 256 ANSI color terminal displayer for tput."
echo "All 256 colors will be printed."
echo "Full screen is recommended for format reasons."
read -p "Would you like to continue(y)? " input

if [ $input == "y" ]; then

START=0
END=7

# tput_colors - Demonstrate color combinations.
for count in {0..28}; do
	for fg_color in {0..7}; do
  	  set_foreground=$(tput setaf $fg_color)
					for (( bg_color=$START; bg_color<=$END; bg_color++ )); do
      	      set_background=$(tput setab $bg_color)
        	    echo -n $set_background$set_foreground
          	  printf ' F:%s B:%s ' $fg_color $bg_color
	        done
  	      echo $(tput sgr0)
	done
	START=$bg_color
	END=$(($START+8))
done

fi

