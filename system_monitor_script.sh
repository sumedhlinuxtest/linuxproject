#! /bin/bash
#Check hostname
hostname=`hostname`
echo “$hostname”

# Check Internal IP
internalip=$(hostname -I)
echo  “Internal IP:$internalip”

# Check External IP
externalip=$(curl -s ipecho.net/plain;echo)
echo “External IP:$externalip”

# Check DNS
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo “Name Servers :$nameservers” 

# Check Logged In Users
users=$(who | awk '{print $1}')
echo “Logged In Users =$users” 

# Memory Usage
free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

# Disk usage
df -h | awk '$NF=="/"{printf "Disk Usage: %d/%dGB (%s)\n", $3,$2,$5}'

# CPU Usage
top -bn1 | grep load | awk '{printf "CPU Load: %.2f\n", $(NF-2)}'
