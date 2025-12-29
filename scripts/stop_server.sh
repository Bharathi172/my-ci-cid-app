#!/bin/bash
# Stop the running application

echo "Stopping application..."

# Find and kill the node process
pkill -f "node app.js" || true

echo "Application stopped"
