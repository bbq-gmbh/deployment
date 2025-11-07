#!/bin/bash

cd "$(dirname "$0")"

mkdir git

git clone https://github.com/bbq-gmbh/backend ./git/backend
git clone https://github.com/bbq-gmbh/frontend2 ./git/frontend


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
