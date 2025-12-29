#!/bin/bash
# Install application dependencies

echo "Installing dependencies..."

cd /home/ec2-user/app

# Install Node.js if not present
if ! command -v node &> /dev/null; then
    echo "Node.js not found, installing..."
    curl -sL https://rpm.nodesource.com/setup_18.x | sudo bash -
    sudo yum install -y nodejs
fi

# Install npm packages
npm install --production

echo "Dependencies installed"
