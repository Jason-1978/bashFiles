#!/bin/bash

#############################################

# Author: Jason Kralik
# Purpose: 
#  
# FileName: findPi.sh
# Created: 01/21/19 
# Modifed: 

#############################################

ip=1

until [ $ip -lt 200 ]; do
	ssh pi@10.0.1.$ip
	let ip+=1
done
