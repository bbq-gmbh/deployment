#!/bin/bash

cd "$(dirname "$0")"

current_dir=$(pwd)

# check if uv exists
command -v uv >/dev/null 2>&1 || { echo "uv is not installed"; exit 1; }

# check if npm exists
command -v npm >/dev/null 2>&1 || { echo "npm is not installed"; exit 1; }

# check if backend folder exists and has files
[ -d "./git/backend" ] && [ -n "$(ls -A ./git/backend)" ] || { echo "backend folder missing or empty"; exit 1; }

# check if frontend folder exists and has files
[ -d "./git/frontend" ] && [ -n "$(ls -A ./git/frontend)" ] || { echo "frontend folder missing or empty"; exit 1; }

cd "$current_dir/git/backend"
uv run fastapi dev --port 3001 app/main.py &

cd "$current_dir/git/frontend"
npm run dev -- --port 3000 &

wait
