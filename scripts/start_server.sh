#!/bin/bash
# Start the application

echo "Starting application..."

cd /home/ec2-user/app

# Start the application in background
nohup node app.js > app.log 2>&1 &

echo "Application started"
sleep 5
