#!/bin/bash

NEW_WORKING_DIRECTORY=/home/pragya/PhoneBookAppRemote
cd "$NEW_WORKING_DIRECTORY"
#DEST=~/PhoneBookAppRemote
#SOURCE=$(pwd)/
#USER=pragya
#HOST=localhost
#DB_HOST=127.0.0.1
#DB_USER=root
#DB_PASSWORD=kranti@123
#DB_NAME=My_Test
#BACKUP_DIRECTORY=~/dumps/
#DATE=$(date +"%Y_%m_%d")
#DB_SCRIPT_LOCATION=$BACKUP_DIRECTORY$DB_NAME-$DATE.sql
#SH_SCRIPT_LOC=~/MyPhoneBookApp
#SH_SCRIPT_REMOTE_LOC=~/local_to_remote/PhoneBookApp
#CHILD_SCRIPT_NAME=remote_child.sh
#DESTINATION=~/RemoteFiles

# get the latest code from git

git init
git remote add origin https://github.com/pragya123456/MyPhonebookApp.git
git pull origin master

# This script will deploy latest code from a local folder to another folder

#scp $SOURCE* $USER@$HOST:$DEST

# This script will also deploy DB

#ssh $USER@$HOST mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME < $DB_SCRIPT_LOCATION

# Now the script should work such that it copies the git code it got, the script itself and DB script to a remote machine using scp

#scp $SOURCE* $USER@$HOST:$DESTINATION
#scp $SH_SCRIPT_LOC/$SCRIPT_NAME $USER@$HOST:$DESTINATION
#scp $DB_SCRIPT_LOCATION $USER@$HOST:$DESTINATION