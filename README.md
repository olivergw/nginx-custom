# nginx-custom

Custom Nginx Docker image optimized for WordPress.  
Includes Brotli compression, security‑hardened defaults, and clean upstream configs for PHP‑FPM.

## Features
- Based on official `nginx:stable`
- Brotli compression enabled for modern browsers
- Tuned defaults for WordPress (pretty permalinks, static caching)
- Ready to proxy requests to a PHP‑FPM container

## Usage
Build and run with Docker Compose:

```bash
docker-compose build nginx
docker-compose up -d
