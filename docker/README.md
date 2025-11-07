# Docker Setup

Beim Öffnen des Terminals stellen Sie sicher, dass Sie genau in diesem Folder drinnen sind (`docker/`)

## Voraussetzungen

- **WSL 2** (Windows only)
  - https://learn.microsoft.com/de-de/windows/wsl/install
- **Docker Desktop** oder **Docker + Docker Compose** (Linux/Mac)
  - https://www.docker.com/products/docker-desktop/

Installieren auf **Windows** mithilfe von:

*(empfohlen)*
```bash
winget install --id=Docker.DockerDesktop -e
```

**oder**

https://www.docker.com/products/docker-desktop/

## Scripts

**Windows (PowerShell):**
1. `.\clone_repositories.ps1`
2. `docker compose up --build`

**Windows (Batch):**
1. `clone_repositories.bat`
2. `docker compose up --build`

**Linux/MacOS:**
1. `chmod +x ./clone_repositories.sh`
2. `./clone_repositories.sh`
3. `docker compose up --build`

## Schnellstart

### 1. Repositories klonen

```bash
./clone_repositories.sh
```

### 2. Starten

```bash
docker compose up --build
```

Die Anwendung ist dann verfügbar unter: [https://localhost](https://localhost)

### 3. Stoppen

```bash
docker compose down
```

## Cleanup

Um alle Daten (einschließlich Datenbank) zu löschen:

```bash
docker compose down
docker volume rm deployment_postgres_data
```
