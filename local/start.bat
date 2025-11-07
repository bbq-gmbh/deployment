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

REM Check if backend folder exists
if not exist ".\git\backend" (
    echo Error: backend folder missing or empty
    exit /b 1
)

REM Check if frontend folder exists
if not exist ".\git\frontend" (
    echo Error: frontend folder missing or empty
    exit /b 1
)

REM Start backend
echo Starting backend...
start cmd /k "cd .\git\backend && uv run fastapi dev --port 3001 app/main.py"

REM Start frontend
echo Starting frontend...
start cmd /k "cd .\git\frontend && npm run dev -- --port 3000"

echo.
echo Backend running on http://localhost:3001
echo Frontend running on http://localhost:3000
