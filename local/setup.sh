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


current_dir=$(pwd)


# check if uv exists
command -v uv >/dev/null 2>&1 || { echo "uv is not installed"; exit 1; }

cd ./git/backend

# copy environment files
cp "$current_dir/.backend.env" .env

uv sync --frozen

cd "$current_dir"


# check if npm exists
command -v npm >/dev/null 2>&1 || { echo "npm is not installed"; exit 1; }

cd ./git/frontend

# copy environment files
cp "$current_dir/.frontend.env" .env

npm install

cd "$current_dir"


echo "done!"
