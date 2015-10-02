#!/bin/bash 

# This script must be check if there're some update availables and send mail

# Requirements 

# Settings
set -e
set -o nounset

# Vars
system_update="0"

########
# MAIN #
########
system_update=`apt-get --just-print upgrade 2>&1 | perl -ne 'if (/Inst\s([\w,\-,\d,\.,~,:,\+]+)\s\[([\w,\-,\d,\.,~,:,\+]+)\]\s\(([\w,\-,\d,\.,~,:,\+]+)\)? /i) {print "PROGRAM: $1 INSTALLED: $2 AVAILABLE: $3\n"}'`

echo $system_update
