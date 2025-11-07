@echo off
setlocal enabledelayedexpansion

REM Check if uv is installed
where uv >nul 2>nul
if errorlevel 1 (
    echo Error: uv is not installed
    exit /b 1
)

REM Check if npm is installed
where npm >nul 2>nul
if errorlevel 1 (
    echo Error: npm is not installed
    exit /b 1
)

REM Create git directory
if not exist "git" mkdir git

REM Clone or update repositories
if exist ".\git\backend" (
    echo Backend repository exists. Pulling latest changes...
    cd .\git\backend
    git pull
    cd ..\..
) else (
    echo Cloning backend repository...
    git clone https://github.com/bbq-gmbh/backend ./git/backend
)

if exist ".\git\frontend" (
    echo Frontend repository exists. Pulling latest changes...
    cd .\git\frontend
    git pull
    cd ..\..
) else (
    echo Cloning frontend repository...
    git clone https://github.com/bbq-gmbh/frontend2 ./git/frontend
)

REM Setup backend
echo Setting up backend...
copy .backend.env .\git\backend\.env
cd .\git\backend
call uv sync --frozen
cd ..\..

REM Setup frontend
echo Setting up frontend...
copy .frontend.env .\git\frontend\.env
cd .\git\frontend
call npm install
cd ..\..

echo Setup complete!
