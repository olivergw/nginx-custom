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

### Automated updates

Dependabot checks the official Nginx base image every Monday at 09:05
Europe/London and opens a pull request when a newer compatible tag is available.
It checks GitHub Actions shortly afterwards. Pull requests build both supported
architectures without publishing; merging a successful PR publishes the new
image and aliases from `main`. This process runs entirely on GitHub.

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

A consuming deployment can bind-mount its own main and virtual-host configuration;
those files then become the source of truth for runtime tuning, headers, upstreams,
and Brotli settings.

Because `/etc/nginx/nginx.conf` is replaced by that bind mount, defaults declared
in an image-level configuration do not carry into the deployment. Define all
required headers and performance directives in the mounted deployment files.

## License

This repository's original Dockerfile, workflow, reference configuration, and
documentation are licensed under the [MIT License](LICENSE). Nginx, ngx_brotli,
and software included in the resulting image retain their respective upstream
licenses.
