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
yunohost tools update 2>&1 > $dry_output
#sed -n '/packages:/{:a;N;/apps:/!ba;p;}' $dry_output| sed "s/    name: //" | grep -vE "(^$|^ |packages:|apps:)"|cut -d " " -f1|sort -u 

cat $dry_output

# todo sup $dry_output
