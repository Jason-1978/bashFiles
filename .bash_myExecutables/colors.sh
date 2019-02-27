#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: 
#  
# FileName: colors.sh
# Created: 02/22/19 
# Modifed: 

#############################################
echo "This is a ANSI color terminal displayer for tput."
echo "This will print out an 8x8 grid of colors in the background."
echo "It will begin with the supplied starting color."
echo "For comparison the numbers are set to 0-7."
read -p "Background color start (0-255)" input

if [ $input -ge 248 ]; then
	input=247
fi

START=$input
END=$(($input+8))

# tput_colors - Demonstrate color combinations.

for fg_color in {0..7}; do
    set_foreground=$(tput setaf $fg_color)
				for (( bg_color=$START; bg_color<=$END; bg_color++ )); do
            set_background=$(tput setab $bg_color)
            echo -n $set_background$set_foreground
            printf ' F:%s B:%s ' $fg_color $bg_color
        done
        echo $(tput sgr0)
    done

