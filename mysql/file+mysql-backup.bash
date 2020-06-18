#!/bin/bash


   DBHOST='localhost'
   DBUSER='user'
   DBPW='password'


   DBNAME=( `echo "show databases" |  mysql --user=$DBUSER --password=$DBPW --host=$DBHOST  | tail -n+3 `)


#folder backup 
    FOLDERS=(  '/var/www'  )

 #use MODE='-v' delok kabeh 
 #use MODE='-q' langsung output 
     MODE='-v'





       if [ "$MODE" = "-v" ]; then
       echo "check nek neng local .backups folder.e es on. nek urung digawe";
       fi

       if [ ! -d "~/.backups/$SCRIPTNAME/db" ]; then
       mkdir -p ~/.backups/$SCRIPTNAME/db ;
       fi

       if [ "$MODE" = "-v" ]; then
       echo "hapus db file sek luwih seko 1 hari";
       fi

       find ~/.backups/$SCRIPTNAME/db/*.sql -type f -daystart -mtime +0 -exec rm {} \;  

       if [ "$MODE" = "-v" ]; then
       echo "delok hasil version seko databases";
       fi

       for i in "${DBNAME[@]}"
       do
       mysqldump --opt --user=$DBUSER --password=$DBPW --host=$DBHOST $i --lock-tables=false   > ~/.backups/$SCRIPTNAME/db/$i.`date +\%Y-\%m-\%d_\%H-\%M-\%S`.sql
       done

#---------------------------------------------------------------------------------------------------------
#             Backup file html

       if [ "$MODE" = "-v" ]; then
       echo "back up folder neng local .backups folder";
      fi

       for i in "${FOLDERS[@]}"
       do
   rsync -a -t -q $MODE  --delete  --links  $i  ~/.backups/$SCRIPTNAME/   
       done

       if [ "$MODE" = "-v" ]; then
       echo "Rampung pak!!"
       fi
#---------------------------------------------------------------------------------------------------------
