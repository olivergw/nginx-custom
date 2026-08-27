# Repository Guidelines

## Project Structure & Module Organization

This repository builds a custom Nginx image containing Brotli dynamic modules.

- `Dockerfile` compiles Brotli against the pinned official Nginx base and copies only the modules into the runtime stage.
- `nginx.conf` is a reference configuration; consuming projects may replace `/etc/nginx/nginx.conf`.
- `.github/workflows/docker-publish.yml` builds multi-platform images and publishes official-style aliases.
- `.github/dependabot.yml` checks the Docker base and workflow actions weekly.
- `README.md` documents tags, module loading, and deployment ownership.

Keep site-specific virtual hosts and upstreams in their consuming deployment repositories.

## Build, Test, and Development Commands

```bash
docker build -t nginx-custom:dev .
docker run --rm nginx-custom:dev test -f /usr/lib/nginx/modules/ngx_http_brotli_filter_module.so
docker run --rm nginx-custom:dev test -f /usr/lib/nginx/modules/ngx_http_brotli_static_module.so
```

When changing configuration compatibility, mount the consuming project's `nginx.conf` and run `nginx -t`. Pull requests run the production-equivalent `amd64` and `arm64` build without publishing. Dependabot opens weekly update pull requests from GitHub-hosted infrastructure.

## Coding Style & Naming Conventions

Use uppercase Dockerfile instructions and four-space indentation for continued package lists. Keep the builder and runtime `FROM` tags identical. Use two-space YAML indentation and descriptive workflow step names. Image tags are derived from the base tag; do not add SHA tags.

## Testing Guidelines

A valid change must build successfully, contain both Brotli modules, and pass `nginx -t` with any affected deployment configuration. Update the README when the base version, aliases, module paths, or configuration ownership changes.

## Commit & Pull Request Guidelines

Use short imperative subjects such as `Update Nginx image and align upstream tags`. Pull requests should explain the image or tagging change, list commands run, and note any impact on consuming configurations. Never commit registry credentials; publishing uses `DOCKERHUB_USERNAME` and `DOCKERHUB_TOKEN` repository secrets.
