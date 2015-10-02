#!/bin/bash 

# This script must be check if there're some update availables and send mail

# Requirements 
#		- apticron package install and
#			- change email contact with sed -i "s/EMAIL=\"root\"/EMAIL=\"admin@`cat /etc/yunohost/current_host`\"/" /etc/apticron/apticron.conf 
#			- remove cron automatically installed with rm /etc/cron.d/apticron

# Settings
set -e
set -o nounset

########
# MAIN #
########

# Apticron check (system and Yunohost)
if test -x /usr/sbin/apticron
	then 
		sudo /usr/sbin/apticron --cron
else 
	echo "quoi retourner ?"
fi




