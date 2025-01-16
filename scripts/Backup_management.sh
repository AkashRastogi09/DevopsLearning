#!/bin/bash


<<Note

This is script is basicly use for Bash backup Diretory.
We will take inpur from User to backup the Diretory.


Note

#this is Source Directory path.
SRC_DIR=$1

#this is Destination Directory Path.
DEST_DIR=$2

#this is the Time stamp.
Time_stamp=$(date +"%m-%d-%y-%H-%M-%S")

# this is the File Name with Time stamp.
Backup_file="$DEST_DIR/Backup_$Time_stamp.tar"

echo "The File Backup begin provcess"

tar -cf $Backup_file $SRC_DIR

if [ $? -eq 0 ]; then
        echo "Backup process has been Successfull in $SRC_SIR Location"
else
        echo "Backup process has been failed"
fi
