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

REM Clone repositories
echo Cloning backend...
git clone https://github.com/bbq-gmbh/backend ./git/backend

echo Cloning frontend...
git clone https://github.com/bbq-gmbh/frontend2 ./git/frontend

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
