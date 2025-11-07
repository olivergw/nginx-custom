FROM nginx:1.29.3

# Install Brotli module
RUN apt-get update && apt-get install -y \
    nginx-module-brotli \
    && rm -rf /var/lib/apt/lists/*
