# nginx-custom

Custom Nginx Docker image optimized for WordPress and modern web performance.  
Includes Brotli compression, security‑hardened defaults, and clean upstream configs for PHP‑FPM.

## Features
- **Multi-Stage Build**: Small, secure runtime image containing only necessary modules.
- **Brotli Compression**: Enabled via `ngx_brotli` dynamic module for modern browsers.
- **Security Hardening**: Secure-by-default headers (XSS protection, MIME sniffing prevention, etc.) and tuned buffers.
- **Tuned Defaults**: Optimized for WordPress/PHP-FPM workloads.

## Tags

For the current base image `nginx:1.31.2`:

| Tag | Example | Triggered when |
|-----|---------|----------------|
| Version from Dockerfile | `1.31.2` (from `nginx:1.31.2`) | Every push to `main` |
| `latest` | `olivergw/nginx-custom:latest` | Push to `main` |
| Commit SHA | Short + long SHA | Every push |

## Usage

Build and run with Docker Compose:

```bash
docker-compose build nginx
docker-compose up -d
```
