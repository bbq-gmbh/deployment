# PowerShell Start Script

# Check if uv is installed
if (-not (Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Host "Error: uv is not installed" -ForegroundColor Red
    exit 1
}

# Check if npm is installed
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Host "Error: npm is not installed" -ForegroundColor Red
    exit 1
}

# Check if backend folder exists
if (-not (Test-Path "./git/backend" -PathType Container) -or -not (Get-ChildItem "./git/backend" -ErrorAction SilentlyContinue)) {
    Write-Host "Error: backend folder missing or empty" -ForegroundColor Red
    exit 1
}

# Check if frontend folder exists
if (-not (Test-Path "./git/frontend" -PathType Container) -or -not (Get-ChildItem "./git/frontend" -ErrorAction SilentlyContinue)) {
    Write-Host "Error: frontend folder missing or empty" -ForegroundColor Red
    exit 1
}

# Start backend
Write-Host "Starting backend..." -ForegroundColor Green
Set-Location "./git/backend"
Start-Process -FilePath "uv" -ArgumentList "run fastapi dev --port 3001 app/main.py"
Set-Location "../.."

# Start frontend
Write-Host "Starting frontend..." -ForegroundColor Green
Set-Location "./git/frontend"
Start-Process -FilePath "npm" -ArgumentList "run dev -- --port 3000"
Set-Location "../.."

Write-Host "Backend running on http://localhost:3001" -ForegroundColor Cyan
Write-Host "Frontend running on http://localhost:3000" -ForegroundColor Cyan
