# Deployment Configuration

Docker Compose configuration for deploying the BBQ GmbH application stack (Backend + Frontend + PostgreSQL).

## 🚀 Quick Start

### Production Deployment (GitHub Container Registry)

```bash
docker compose --profile production up -d
```

This pulls pre-built images from GitHub Container Registry:
- `ghcr.io/bbq-gmbh/backend:latest`
- `ghcr.io/bbq-gmbh/frontend:latest`

### Local Development & Testing

```bash
docker compose --profile dev up
```

This builds images from local source code in `../backend` and `../frontend` directories.

## 📋 Prerequisites

- Docker Engine 20.10+
- Docker Compose v2.0+
- For production: GitHub Container Registry access (if images are private)
- For development: Local backend and frontend source code in parent directory

## 🔧 Configuration

### Environment Variables

Create a `.env` file in this directory for custom configuration:

```env
# JWT Configuration (IMPORTANT: Change in production!)
JWT_SECRET_KEY=your-secure-secret-key-here

# API URL for frontend
NEXT_PUBLIC_API_URL=http://localhost:3001
```

**⚠️ Security Warning:** Always use a strong, randomly generated `JWT_SECRET_KEY` in production!

### Service Ports

| Service  | Port | Description                    |
|----------|------|--------------------------------|
| Frontend | 3000 | Web application UI             |
| Backend  | 3001 | REST API                       |
| Postgres | 5432 | Database (exposed for dev)     |

## 🔐 Authentication

The application uses JWT (JSON Web Tokens) for authentication:

- **Access Token Expiry:** 30 minutes
- **Refresh Token Expiry:** 7 days
- **Algorithm:** HS256

### Default Database Credentials

```
User:     postgres
Password: postgres
Database: fs-backend
```

**⚠️ Change these credentials in production!**

## 📦 Available Commands

### Start Services

```bash
# Production mode (GitHub images)
docker compose --profile production up -d

# Development mode (local build)
docker compose --profile dev up

# Only database (useful for local API development)
docker compose up postgres -d
```

### Stop Services

```bash
docker compose down
```

### View Logs

```bash
# All services
docker compose logs -f

# Specific service
docker compose logs -f backend
docker compose logs -f frontend
```

### Build Images (Development)

```bash
# Build images without starting services
docker compose --profile dev build

# Build and start services
docker compose --profile dev up --build

# Build specific service
docker compose build backend-dev
docker compose build frontend-dev
```

### Clean Up

```bash
# Stop and remove containers, networks
docker compose down

# Also remove volumes (⚠️ deletes database data)
docker compose down -v
```

## 🏗️ Architecture

```
┌─────────────┐
│  Frontend   │ :3000
│ (Next.js)   │
└──────┬──────┘
       │
       ↓
┌─────────────┐
│   Backend   │ :3001
│  (FastAPI)  │
└──────┬──────┘
       │
       ↓
┌─────────────┐
│  PostgreSQL │ :5432
│   Database  │
└─────────────┘
```

## 🔍 Health Checks

- **PostgreSQL:** Automatic health check with 5-second intervals
- **Backend:** Depends on healthy PostgreSQL connection
- **Frontend:** Depends on backend availability

## 📝 Notes

### For CI/CD Deployment

1. Build and push images to GitHub Container Registry:
   ```bash
   docker build -t ghcr.io/bbq-gmbh/backend:latest ./backend
   docker build -t ghcr.io/bbq-gmbh/frontend:latest ./frontend
   docker push ghcr.io/bbq-gmbh/backend:latest
   docker push ghcr.io/bbq-gmbh/frontend:latest
   ```

2. Deploy on server:
   ```bash
   docker compose --profile production pull
   docker compose --profile production up -d
   ```

### For Local Testing

1. Ensure backend and frontend directories exist at `../backend` and `../frontend`
2. Run: `docker compose --profile dev up`
3. Access application at `http://localhost:3000`
4. API available at `http://localhost:3001`

## 🐛 Troubleshooting

**Services won't start:**
```bash
docker compose down
docker compose --profile production up -d
```

**Database connection issues:**
```bash
# Check if PostgreSQL is healthy
docker compose ps

# View database logs
docker compose logs postgres
```

**Port already in use:**
```bash
# Check what's using the port
sudo lsof -i :3000
sudo lsof -i :3001
sudo lsof -i :5432
```

## 📄 License

[Your License Here]
