@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

if not exist "git" mkdir git

REM Clone or update backend
if exist "git\backend" (
    echo Backend repository exists. Pulling latest changes...
    cd git\backend
    git pull
    cd ..\..
) else (
    echo Cloning backend repository...
    git clone https://github.com/bbq-gmbh/backend git\backend
)

REM Clone or update frontend
if exist "git\frontend" (
    echo Frontend repository exists. Pulling latest changes...
    cd git\frontend
    git pull
    cd ..\..
) else (
    echo Cloning frontend repository...
    git clone https://github.com/bbq-gmbh/frontend2 git\frontend
)

echo Done!
