#!/bin/bash

URL="https://localhost:8081"

echo "Application Health Checker"

STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" $URL)

if [ $STATUS -eq 200 ]; then
    echo "$URL is UP and running fine!"
else
    echo "$URL is DOWN - Status Code: $STATUS"
fi

echo "Check complete"
