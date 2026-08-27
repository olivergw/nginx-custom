# Build Stage
FROM nginx:1.31.4-trixie AS builder

# Install dependencies and build Brotli module
RUN apt-get update && apt-get install -y \
    git \
    gcc \
    make \
    libbrotli-dev \
    libpcre2-dev \
    zlib1g-dev \
    wget \
    && cd /tmp \
    && git clone --recurse-submodules https://github.com/google/ngx_brotli.git \
    && cd ngx_brotli \
    && git checkout v1.0.0rc \
    && cd /tmp \
    && NGINX_VERSION=$(nginx -v 2>&1 | grep -oP 'nginx/\K[\d.]+') \
    && wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
    && tar -xzf nginx-${NGINX_VERSION}.tar.gz \
    && cd nginx-${NGINX_VERSION} \
    && ./configure --with-compat --add-dynamic-module=/tmp/ngx_brotli \
    && make modules \
    && mkdir -p /usr/lib/nginx/modules/ \
    && cp objs/ngx_http_brotli_filter_module.so /usr/lib/nginx/modules/ \
    && cp objs/ngx_http_brotli_static_module.so /usr/lib/nginx/modules/

# Final Stage
FROM nginx:1.31.4-trixie

# Copy compiled Brotli modules from builder stage
COPY --from=builder /usr/lib/nginx/modules/ngx_http_brotli_filter_module.so \
    /usr/lib/nginx/modules/ngx_http_brotli_static_module.so \
    /usr/lib/nginx/modules/
