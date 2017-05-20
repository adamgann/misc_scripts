#!/usr/bin/env bash

TARGET_DIR='/home/adam/'
ZIP_DIR='src'
PARENT_ID='' #Fill this in from the Google Drive URL

# Name the file using today's date
PREFIX='backup_'
DATE=`date +%Y_%m_%d_%H_%M`
POSTFIX='.tar.gz'
FILENAME=$PREFIX$DATE$POSTFIX

# Notify that process is starting
notify-send "Backup process starting"

# Zip the files 
echo $FILENAME
tar -zcf $FILENAME $TARGET_DIR$ZIP_DIR 

# Upload To GDrive, Delete Local Copy
gdrive upload --parent $PARENT_ID $FILENAME
rm $FILENAME

notify-send "Backup process complete"



