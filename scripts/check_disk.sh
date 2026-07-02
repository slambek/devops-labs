#!/bin/bash
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

# Get the root disk usage percentage (number only)
DISK_USAGE=$(df -h | grep ' /$' | awk '{print $5}' | sed 's/%//')

# Set critical alert threshold to 80%
THRESHOLD=80

if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "⚠️ ALERT! Disk usage is at ${DISK_USAGE}%. Clean up logs immediately!"
else
    echo "✅ System OK. Disk usage is at ${DISK_USAGE}%. Plenty of space left."
fi
