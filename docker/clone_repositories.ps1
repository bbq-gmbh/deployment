$ErrorActionPreference = "Stop"

$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $scriptPath

$gitPath = Join-Path $scriptPath "git"

if (-not (Test-Path $gitPath)) {
    New-Item -ItemType Directory -Path $gitPath | Out-Null
}

# Clone or update backend
$backendPath = Join-Path $gitPath "backend"
if (Test-Path $backendPath) {
    Write-Host "Backend repository exists. Pulling latest changes..."
    Set-Location $backendPath
    git pull
    Set-Location $scriptPath
} else {
    Write-Host "Cloning backend repository..."
    git clone https://github.com/bbq-gmbh/backend $backendPath
}

# Clone or update frontend
$frontendPath = Join-Path $gitPath "frontend"
if (Test-Path $frontendPath) {
    Write-Host "Frontend repository exists. Pulling latest changes..."
    Set-Location $frontendPath
    git pull
    Set-Location $scriptPath
} else {
    Write-Host "Cloning frontend repository..."
    git clone https://github.com/bbq-gmbh/frontend2 $frontendPath
}

Write-Host "Done!"
