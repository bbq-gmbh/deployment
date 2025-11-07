# PowerShell Setup Script

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

# Create git directory
if (-not (Test-Path "git")) {
    New-Item -ItemType Directory -Path "git" | Out-Null
}

# Clone or update repositories
if (Test-Path "./git/backend") {
    Write-Host "Backend repository exists. Pulling latest changes..." -ForegroundColor Green
    Set-Location "./git/backend"
    git pull
    Set-Location "../.."
} else {
    Write-Host "Cloning backend..." -ForegroundColor Green
    git clone https://github.com/bbq-gmbh/backend ./git/backend
}

if (Test-Path "./git/frontend") {
    Write-Host "Frontend repository exists. Pulling latest changes..." -ForegroundColor Green
    Set-Location "./git/frontend"
    git pull
    Set-Location "../.."
} else {
    Write-Host "Cloning frontend..." -ForegroundColor Green
    git clone https://github.com/bbq-gmbh/frontend2 ./git/frontend
}

# Setup backend
Write-Host "Setting up backend..." -ForegroundColor Green
Copy-Item ".backend.env" "./git/backend/.env"
Set-Location "./git/backend"
uv sync --frozen
Set-Location "../.."

# Setup frontend
Write-Host "Setting up frontend..." -ForegroundColor Green
Copy-Item ".frontend.env" "./git/frontend/.env"
Set-Location "./git/frontend"
npm install
Set-Location "../.."

Write-Host "Setup complete!" -ForegroundColor Green
