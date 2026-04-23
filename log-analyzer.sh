#!/bin/bash

# Check if a log file was provided as an argument
if [ -z "$1" ]; then
    echo "Usage: $0 <path_to_nginx_log_file>"
    exit 1
fi

LOG_FILE=$1

# Check if the file exists
if [ ! -f "$LOG_FILE" ]; then
    echo "Error: File '$LOG_FILE' not found."
    exit 1
fi

echo "--------------------------------------------------"
echo "Nginx Log Analysis Report"
echo "--------------------------------------------------"

# 1. Top 5 IP addresses with the most requests
echo -e "\nTop 5 IP addresses with the most requests:"
awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

# 2. Top 5 most requested paths
echo -e "\nTop 5 most requested paths:"
awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

# 3. Top 5 response status codes
echo -e "\nTop 5 response status codes:"
awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

# 4. Top 5 user agents
echo -e "\nTop 5 user agents:"
# User agent is usually the 6th double-quoted field in Nginx logs
awk -F'\"' '{print $6}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 5 | awk -F'  +' '{print $2 " - " $1 " requests"}'

echo -e "\n--------------------------------------------------"
