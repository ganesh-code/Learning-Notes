#!/bin/bash

while true
do
    if pgrep nginx > /dev/null
    then
        echo "$(date): Nginx is running."
    else
        echo "$(date): Nginx is NOT running. Restarting..."
        sudo systemctl restart nginx
    fi

    sleep 60
done