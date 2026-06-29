# nginx-custom

Custom Nginx Docker image optimized for WordPress.  
Includes Brotli compression, security‑hardened defaults, and clean upstream configs for PHP‑FPM.

## Features
- Based on official `nginx:1.31.2`
- Brotli compression enabled for modern browsers
- Tuned defaults for WordPress (pretty permalinks, static caching)
- Ready to proxy requests to a PHP‑FPM container

## Tags

For the current base image `nginx:1.31.2`:

| Tag | Example | Triggered when |
|-----|---------|----------------|
| Version from Dockerfile | `1.31.2` (from `nginx:1.31.2`) | Every push to `main` |
| `latest` | `olivergw/nginx-custom:latest` | Push to `main` |
| Commit SHA | Short + long SHA | Every push |

Just update the `FROM` line in the Dockerfile and push to `main`.

## Usage
Build and run with Docker Compose:

```bash
docker-compose build nginx
docker-compose up -d
