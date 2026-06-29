#!/bin/bash

echo "============================="
echo "     SYSTEM INFORMATION"
echo "============================="

echo
echo "Hostname      : $(hostname)"
echo "Current User  : $(whoami)"
echo "Operating Sys : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo "Kernel        : $(uname -r)"
echo "Uptime        : $(uptime -p)"

echo
echo "------ Disk Usage ------"
df -h /

echo
echo "------ Memory ------"
free -h

echo
echo "------ Top 5 Processes ------"
ps -eo pid,user,%cpu,comm --sort=-%cpu | head -6