#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: tput options here can be automated?
#  or perhaps I will use this to configure my 
#  prompts. 
# Reference: https://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x405.html
# FileName: tputOptions.sh
# Created: 02/27/19 
# Modifed: 

#############################################

### tput Colour Capabilities ###

#tput setab [1-7]
# Set a background colour using ANSI escape

#tput setb [1-7]
# Set a background colour

#tput setaf [1-7]
# Set a foreground colour using ANSI escape

#tput setf [1-7]
# Set a foreground colour

### tput Text Mode Capabilities ###

#tput bold
# Set bold mode

#tput dim
# turn on half-bright mode

#tput smul
# begin underline mode

#tput rmul
# exit underline mode

#tput rev
# Turn on reverse mode

#tput smso
# Enter standout mode (bold on rxvt)

#tput rmso
# Exit standout mode

#tput sgr0
# Turn off all attributes (doesn't work quite as expected)

### tput Cursor Movement Capabilities ###

#tput cup Y X
# Move cursor to screen location X,Y (top left is 0,0)

#tput sc
# Save the cursor position

#tput rc
# Restore the cursor position

#tput lines
# Output the number of lines of the terminal

#tput cols
# Output the number of columns of the terminal

#tput cub N
# Move N characters left

#tput cuf N
# Move N characters right

#tput cub1
# move left one space

#tput cuf1
# non-destructive space (move right one space)

#tput ll
# last line, first column (if no cup)

#tput cuu1
# up one line

### tput Clear and Insert Capabilities ###

#tput ech N
# Erase N characters

#tput clear
# clear screen and home cursor

#tput el1
# Clear to beginning of line

#tput el
# clear to end of line

#tput ed
# clear to end of screen

#tput ich N
# insert N characters (moves rest of line forward!)

#tput il N
# insert N lines
