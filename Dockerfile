################################################
# Compile with:
#     sudo docker build -t microsoft/playwright:bionic -f Dockerfile.bionic .
#
# Run with:
#     sudo docker run -d -p --rm --name playwright microsoft/playwright:bionic
#
#################################################

FROM ubuntu:bionic

# Install node, webkit deps, chromium deps, firefox deps.
RUN apt-get update && apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    apt-get install -y nodejs \
                       libwoff1 \
                       libopus0 \
                       libwebp6 \
                       libwebpdemux2 \
                       libenchant1c2a \
                       libgudev-1.0-0 \
                       libsecret-1-0 \
                       libhyphen0 \
                       libgdk-pixbuf2.0-0 \
                       libegl1 \
                       libnotify4 \
                       libxslt1.1 \
                       libevent-2.1-6 \
                       libgles2 \
                       libvpx5 \
                       libnss3 \
                       libxss1 \
                       libasound2 \
                       libdbus-glib-1-2 \
                       libxt6 \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

ENV PLAYWRIGHT_BROWSERS_PATH=/browsers
RUN mkdir -p /tmp/playwright && cd /tmp/playwright && npm install --no-save playwright@0.15.0 && cd / && cd / && rm -rf /tmp/playwright
