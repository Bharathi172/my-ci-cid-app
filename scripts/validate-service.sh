#!/bin/bash
# Validate that the application is running

echo "Validating application..."

# Check if the process is running
if pgrep -f "node app.js" > /dev/null; then
    echo "Application process is running"
else
    echo "Application process not found!"
    exit 1
fi

# Check if the application responds to HTTP requests
sleep 3
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:3000/health)

if [ "$HTTP_CODE" = "200" ]; then
    echo "Application is healthy and responding"
    exit 0
else
    echo "Application is not responding correctly (HTTP $HTTP_CODE)"
    exit 1
fi
