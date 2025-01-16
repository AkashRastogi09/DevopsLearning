#!/bin/bash


<<Note

This is script is basicly use for Bash backup Diretory.
We will take inpur from User to backup the Diretory.

Note


SRC_DIR=$1
DEST_DIR=$2
Time_stamp=date +"%m-%d-%y-%H-%M-%S"


tar -cvf $DEST_DIR/Backup_$Time_stamp.jag $SRC_DIR

