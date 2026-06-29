#!/bin/bash

LOG_FILE="/var/log/syslog"

tail -Fn0 "$LOG_FILE" | while read line
do
    if echo "$line" | grep -q "ERROR"
    then
        echo "[$(date)] ALERT: $line"
    fi
done