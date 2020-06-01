#!/bin/bash

DIR=/home/pragya/MyPhoneBookApp/
ZIP_FILE_NAME=MyPhoneBookApp.zip
USER=pragya
HOST=localhost
DEST=/home/pragya/local_to_remote
PASSWORD=Password1234
DB_HOST=127.0.0.1
DB_USER=root
DB_PASSWORD=kranti@123
DB_NAME=My_Test
BACKUP_DIRECTORY=/home/pragya/dumps/
DATE=$(date +"%Y_%m_%d")
DB_DUMP_LOC=$BACKUP_DIRECTORY$DB_NAME-$DATE.sql
DB_NAME_NEW=Test_Db
SERVER_LOC=/etc/nginx/sites-available/pepplAPI_folder/

# On local machine do git latest

git pull origin master

# Convert the code into a zip file

zip -r $ZIP_FILE_NAME $DIR*

# Copy the zip file to a remote machine using scp

scp $DIR$ZIP_FILE_NAME $USER@$HOST:$DEST

# Unzip the file on remote machine using ssh and the required command & deploy to web server on remote machine

ssh $USER@$HOST unzip $DEST/$ZIP_FILE_NAME -d $DEST/
scp -ar $DIR* $USER@$HOST:$SERVER_LOC

# Make SQL Dump on your local machine

mysqldump -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME >$BACKUP_DIRECTORY$DB_NAME-$DATE.sql

# Copy the SQL dump to remote machine using scp

scp $DB_DUMP_LOC $USER@$HOST:$DEST

#  Create DB on the remote machine using mysql command exected using ssh

ssh $USER@$HOST mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD -e "CREATE DATABASE $DB_NAME_NEW"
ssh $USER@$HOST mysql -h $DB_HOST -u $DB_USER -p$DB_PASSWORD $DB_NAME < $DEST/$DB_NAME-$DATE.sql
