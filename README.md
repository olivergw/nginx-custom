# nginx-custom

Custom Nginx Docker image optimized for WordPress and modern web performance.  
Includes Brotli compression, security-hardened defaults, and a configuration tuned for PHP-FPM.

## Features
- **Multi-Stage Build**: Small, secure runtime image containing only necessary modules.
- **Brotli Compression**: Enabled via `ngx_brotli` dynamic module for modern browsers.
- **Security Hardening**: Secure-by-default headers (XSS protection, MIME sniffing prevention, etc.) and tuned buffers.
- **Tuned Defaults**: Optimized for WordPress/PHP-FPM workloads.

## Tags

For the current base image `nginx:1.31.4-trixie`:

| Tag | Example | Triggered when |
|-----|---------|----------------|
| Exact version | `1.31.4` and `1.31.4-trixie` | Every push to `main` |
| Release channel | `mainline` and `mainline-trixie` | Every push to `main` |
| Major version | `1` and `1-trixie` | Every push to `main` |
| Minor version | `1.31` and `1.31-trixie` | Every push to `main` |
| Distribution | `trixie` | Every push to `main` |
| `latest` | `olivergw/nginx-custom:latest` | Push to `main` |

The aliases mirror the Docker Official Image tags for the selected Nginx mainline Trixie image. Update both `FROM` lines together when changing versions.

## Usage

Build and run with Docker Compose:

```bash
docker compose build nginx
docker compose up -d
```
