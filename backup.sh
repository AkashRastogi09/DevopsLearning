#!/bin/bash

# I am creating script for backing up client data

#SRC location path

SCR_DIR=/etc/

#DEST_DIR location path

DEST_DIR=/client_backup/

# create time stamp for unique backup name

time_stamp="$(date +"%Y-%m-%d-%H-%M-%S")"

echo $time_stamp

filename="Backup_$time_stamp.tar.gz"

tar -czvf ${DEST_DIR}/${filename} /$SCR_DIR

echo "Backup has been completed"

#
