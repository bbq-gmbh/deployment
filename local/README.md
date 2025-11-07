# Lokales Setup

## Scripts

(Siehe *Benötigte Dependencies* unten als erstes)

**Windows:**



**Linux/MacOS:**

0. `chmod +x ./setup.sh ./start.sh`
1. [`./setup.sh`](./setup.sh)
2. [`./start.sh`](./start.sh)


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

