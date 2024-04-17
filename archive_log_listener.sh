#!/bin/bash

# Replace with the actual log file path
LOG_FILE="/var/YOURAPP/log_listener/log_listener.log"
LOG_FILE_FFMPEG="/var/YOURAPP/log_ffmpeg/log_ffmpeg.log"

# Get yesterday's date in YYYY-MM-DD format
YESTERDAY=$(date -d yesterday +%Y-%m-%d)
# Get the current date
CURRENT_DATE=$(date +"%Y-%m-%d")

# Move existing log file to a compressed archive with yesterday's date
sudo cp "$LOG_FILE" "$LOG_FILE"_"$CURRENT_DATE".log
sudo cp "$LOG_FILE_FFMPEG" "$LOG_FILE_FFMPEG"_"$CURRENT_DATE".log

# Clear the contents of the log file
sudo truncate -s 0 "$LOG_FILE"
sudo truncate -s 0 "$LOG_FILE_FFMPEG"
