#!/bin/bash

HOSTNAME="hostname_ftp"
USERNAME="login_ftp"
PASSWORD="Haslo_ftp"
SOURCE="ftp/"
DATE=`date '+%Y%m%d'`
DATE_LAST=`date '+%Y%m%d' --date="7 days ago"`
SUFFIX="zip"
NAME="Backup_$DATE.$SUFFIX"
NAME_LAST="Backup_$DATE_LAST.$SUFFIX"

#Archwizacja
zip -r -q -P haslo_zip $NAME $SOURCE
#Wyslanie na FTP
ftp -n -v $HOSTNAME << EOT
user $USERNAME $PASSWORD
put $NAME
delete $NAME_LAST
quit
EOT
#Usuniecie archiwum po wyslaniu
rm -r $NAME