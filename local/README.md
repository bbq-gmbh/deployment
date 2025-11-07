# Lokales Setup

Beim Öffnen des Terminals stellen Sie sicher, dass Sie genau in diesem Folder drinnen sind (`local/`) 

## Scripts

(Siehe *Benötigte Dependencies* unten als erstes)

**Windows (PowerShell):**
1. `.\setup.ps1`
2. `.\start.ps1`

**Windows (Batch):**
1. `setup.bat`
2. `start.bat`

**Linux/MacOS:**
1. `chmod +x ./setup.sh ./start.sh`
2. `./setup.sh`
3. `./start.sh`


## Benötigte Dependencies

### UV Package Manager (Python)

https://docs.astral.sh/uv/

https://github.com/astral-sh/uv

Installieren auf **Windows** mithilfe von:

*(empfohlen)*
```bash
winget install --id=astral-sh.uv  -e
```

**oder**

```bash
# On Windows.
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

Auf **Linux/MacOS**:

```bash
# On macOS and Linux.
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### NodeJS (JS)

https://nodejs.org/

Installieren auf **Windows** mithilfe von:

*(empfohlen)*
```bash
winget install --id=OpenJS.NodeJS  -e
```

**oder**

https://nodejs.org/en/download

