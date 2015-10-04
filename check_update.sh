#!/bin/bash 

# This script must be check if there're some update availables and send mail

# Requirements 

# Settings
set -e
set -o nounset

# Vars
system_update="0"
dry_output="/tmp/checkupdate.list"
mail_content="/tmp/checkupdate.mail"
mail_notification="admin@`cat /etc/yunohost/current_host`"
mail_notification="petit@peccadilles.net"

########
# MAIN #
########
#sudo yunohost tools update 2>&1 > $dry_output
update_system=`sed -n '/packages:/{:a;N;/apps:/!ba;p;}' $dry_output| sed "s/    name: //" | grep -vE "(^$|^ |packages:|apps:)"|cut -d " " -f1|sort -u` 
update_app=`sed -n '/apps:/,$p' $dry_output |grep id|sed "s/ *id: \(.*\)/\1/"`

echo "From: labriqueinter.net" >$mail_content
echo "To: $mail_notification" >>$mail_content
echo "Subject: Updating LaBriqueInter.net" >>$mail_content
echo "Mime-Version: 1.0" >>$mail_content
echo "Content-Type: text/html; charset=\"iso-8859-15\"" >>$mail_content
echo "Bonjour gros/se !" >>$mail_content
echo "Ta BriqueInter.net a besoin d'amour…" >>$mail_content
echo "Les paquets système suivant nécesssite d'être mis à jour:" >>$mail_content
echo "$update_system" >>$mail_content
echo "" >>$mail_content
echo "Les applications suivantes nécessite d'être mises à jour:" >>$mail_content
echo "$update_app" >>$mail_content

cat $mail_content | sendmail -t 

# todo sup $dry_output $mail_content
