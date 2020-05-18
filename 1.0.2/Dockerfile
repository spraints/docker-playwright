FROM ubuntu:bionic

# Install node, webkit deps, chromium deps, firefox deps.
RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs \
                       libasound2 \
                       libdbus-glib-1-2 \
                       libegl1 \
                       libgl1 \
                       libgles2 \
                       libglib2.0-0 \
                       libgtk-3-0 \
                       libgudev-1.0 \
                       libnss3 \
                       libopus0 \
                       libvpx5 \
                       libwebp6 \
                       libwebpdemux2 \
                       libwoff1 \
                       libxslt1.1 \
                       libxss1 \
                       libxt6 \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

ARG PLAYWRIGHT_VERSION=1.0.2

ENV PLAYWRIGHT_BROWSERS_PATH=/browsers
RUN mkdir -p /tmp/playwright && cd /tmp/playwright && npm install --no-save playwright@$PLAYWRIGHT_VERSION && cd / && cd / && rm -rf /tmp/playwright
