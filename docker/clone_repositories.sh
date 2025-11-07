#!/bin/bash

cd "$(dirname "$0")"

mkdir -p git

# Clone or update backend
if [ -d "./git/backend" ]; then
    echo "Backend repository exists. Pulling latest changes..."
    cd ./git/backend
    git pull
    cd ../..
else
    echo "Cloning backend repository..."
    git clone https://github.com/bbq-gmbh/backend ./git/backend
fi

# Clone or update frontend
if [ -d "./git/frontend" ]; then
    echo "Frontend repository exists. Pulling latest changes..."
    cd ./git/frontend
    git pull
    cd ../..
else
    echo "Cloning frontend repository..."
    git clone https://github.com/bbq-gmbh/frontend2 ./git/frontend
fi
