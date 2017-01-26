#!/bin/bash
DATE=date '+%Y-%m-%d'
cat /dev/null > log_backup.txt
find . -maxdepth 1 -type f -name "*.log*" -mtime +6 | sort -k 1 -n >> log_backup.txt
tar -zcf Log_File_Backups_$DATE.tgz -T log_backup.txt
while read file; do rm "$file"; done < log_backup.txt
