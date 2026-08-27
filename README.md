# nginx-custom

Custom Nginx Docker image for WordPress deployments that require Brotli support.
It extends the official Nginx image with Brotli dynamic modules; deployment-specific
configuration is supplied by the consuming project.

## Features
- **Multi-Stage Build**: Small, secure runtime image containing only necessary modules.
- **Brotli Modules**: Provides the `ngx_http_brotli_filter_module` and
  `ngx_http_brotli_static_module` dynamic modules.
- **Official Runtime**: Retains the official Nginx image configuration unless the
  consuming deployment mounts its own configuration.

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

Build the image locally:

```bash
docker build -t nginx-custom:dev .
```

Load the modules near the start of the deployment's `nginx.conf`:

```nginx
load_module /usr/lib/nginx/modules/ngx_http_brotli_filter_module.so;
load_module /usr/lib/nginx/modules/ngx_http_brotli_static_module.so;
```

The `sophobsessed` deployment bind-mounts its own `nginx/nginx_main.conf` and
`nginx/wordpress.conf`; those files remain the source of truth for runtime tuning,
headers, upstreams, and Brotli settings.
