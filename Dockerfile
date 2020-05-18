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
                       libasound2 \
                       libatk-bridge2.0-0 \
                       libatk1.0-0 \
                       libcups2 \
                       libdbus-glib-1-2 \
                       libdrm2 \
                       libegl1 \
                       libgbm1 \
                       libgl1 \
                       libgles2 \
                       libglib2.0-0 \
                       libgtk-3-0 \
                       libgudev-1.0 \
                       libnss3 \
                       libopus0 \
                       libpangocairo-1.0-0 \
                       libvpx5 \
                       libwebpdemux2 \
                       libwoff1 \
                       libx11-xcb1 \
                       libxcb-dri3-0 \
                       libxcomposite1 \
                       libxcursor1 \
                       libxdamage1 \
                       libxi6 \
                       libxrandr2 \
                       libxslt1.1 \
                       libxss1 \
                       libxt6 \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

ENV PLAYWRIGHT_BROWSERS_PATH=/browsers
RUN mkdir -p /tmp/playwright && cd /tmp/playwright && npm install --no-save playwright@0.15.0 && cd / && cd / && rm -rf /tmp/playwright
