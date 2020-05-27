#!/bin/sh
# mysql-backup.sh: Dump MySQL databases.
# Note: Test only on Ubuntu Linux 18.04.
# Author: dwiHard << HExploit >>
# -----------------------------------------------------
NOW=$(date +"%d-%m-%Y")
BAK="/root/mysql-files/$NOW"
 
##################
## SET ME FIRST ##
##################
MUSER="root"
MPASS="YOUR-ROOT-PASSWORD-HERE"
MHOST="localhost"
 
MYSQL="$(which mysql)"
MYSQLDUMP="$(which mysqldump)"
GZIP="$(which gzip)"
 
if [ ! -d $BAK ]; then
  mkdir -p $BAK
else
 :
fi
 
DBS="$($MYSQL -u $MUSER -h $MHOST -p$MPASS -Bse 'show databases')"
echo -n "Dumping...${THISDB}..."
for db in $DBS
do
 echo -n "$db "
 FILE=$BAK/mysql-$db.$NOW-$(date +"%T").gz
 $MYSQLDUMP -u $MUSER -h $MHOST -p$MPASS $db | $GZIP -9 > $FILE
done
echo -n  "...Done @ ${BAK} directory."
echo ""
