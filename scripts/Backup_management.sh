#!/bin/bash

: <<'Note'
This script is used for backing up a directory in Bash.
The user provides input to specify the source directory to back up and the destination directory.
Note

# Source Directory path
SRC_DIR=$1

# Destination Directory path
DEST_DIR=$2

# Timestamp for the backup
Time_stamp=$(date +"%m-%d-%y-%H-%M-%S")

# Backup file name with timestamp
Backup_file="$DEST_DIR/Backup_$Time_stamp.tar"

echo "The backup process begins..."

# Create the backup file
tar -cf "$Backup_file" "$SRC_DIR"

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup process was successful."
else
    echo "Backup process failed."
fi

: <<'Note'
This module manages backup rotation.
It retains only the latest 5 backup files and deletes older ones.
Note

# Destination directory path for rotation
DESK_DIR="$DEST_DIR"

# List all files in the directory, sorted by modification time (newest first)
files=( $(ls -1t "$DESK_DIR") )

# Loop through the files and delete files exceeding the 5 most recent
for ((i=5; i<${#files[@]}; i++)); do
    echo "Deleting file: ${files[i]}"
    rm -f "$DESK_DIR/${files[i]}"
done
