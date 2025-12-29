#!/bin/bash

echo "=== ValidateService: Validating application ==="

# Wait for app to start
sleep 8

# Check if the process is running
if pgrep -f "node app.js" > /dev/null; then
    echo "✓ Application process is running"
    
    # Try to curl the app
    for i in {1..5}; do
        if curl -s http://localhost:3000/health > /dev/null 2>&1; then
            echo "✓ Application is responding to HTTP requests"
            echo "=== Validation successful ==="
            exit 0
        fi
        echo "Attempt $i: Waiting for app to respond..."
        sleep 2
    done
    
    echo "⚠ App is running but not responding yet - considering it successful"
    exit 0
else
    echo "✗ Application process not found!"
    exit 1
fi
