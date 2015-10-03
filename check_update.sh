#!/bin/bash 

# This script must be check if there're some update availables and send mail

# Requirements 

# Settings
set -e
set -o nounset

# Vars
system_update="0"
dry_output="/tmp/checkupdate.list"

########
# MAIN #
########
#sudo yunohost tools update 2>&1 > $dry_output
#update_system=`sed -n '/packages:/{:a;N;/apps:/!ba;p;}' $dry_output| sed "s/    name: //" | grep -vE "(^$|^ |packages:|apps:)"|cut -d " " -f1|sort -u` 
update_app=`sed -n '/apps:/,$p' $dry_output |grep id|sed "s/ *id: \(.*\)/\1/"`

#echo $update_system
#echo "--------------------------------------------------"
#echo "--------------------------------------------------"
#echo "--------------------------------------------------"
#echo "--------------------------------------------------"
#echo "--------------------------------------------------"
#echo "--------------------------------------------------"
echo $update_app
#cat $dry_output



# todo sup $dry_output
