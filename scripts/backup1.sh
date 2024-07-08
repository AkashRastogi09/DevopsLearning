#!/bin/bash

# Define backup directory
BACKUP_DIR="/client_backup"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Copy directories and files to backup directory
cp -r /client_data "$BACKUP_DIR"
cp -r /etc "$BACKUP_DIR"
#cp /boot "$BACKUP_DIR"
#cp /path/to/your/work/file2 "$BACKUP_DIR"

# Display completion message
echo "Backup completed. Files copied to $BACKUP_DIR."
#df
