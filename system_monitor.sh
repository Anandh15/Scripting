#!/bin/bash

# Thresholds
CPU_LIMIT=80
MEM_LIMIT=80
DISK_LIMIT=80

echo "System Health Monitoring"

# CPU usage
CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')
echo "CPU Usage: $CPU%"
if [ $CPU -gt $CPU_LIMIT ]; then
    echo "Warning: High CPU usage!"
fi

# Memory usage
MEM=$(free | grep Mem | awk '{print int($3/$2 * 100)}')
echo "Memory Usage: $MEM%"
if [ $MEM -gt $MEM_LIMIT ]; then
    echo "Warning: High Memory usage!"
fi

# Disk usage
DISK=$(df / | tail -1 | awk '{print int($5)}')
echo "Disk Usage: $DISK%"
if [ $DISK -gt $DISK_LIMIT ]; then
    echo "Warning: Low Disk Space!"
fi

echo "Monitoring complete"
