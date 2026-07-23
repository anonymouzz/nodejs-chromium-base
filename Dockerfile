# linux/amd64 + linux/arm64 (Apple Silicon). Same apk packages on both arches.
FROM node:22.13.0-alpine

# System Chromium for Puppeteer (backend-ts PDF).
RUN apk add --no-cache \
    chromium \
    nss \
    glib \
    freetype \
    harfbuzz \
    ca-certificates \
    fontconfig \
    tzdata \
    ttf-freefont \
    ttf-liberation \
    font-noto-emoji \
    udev \
    && fc-cache -f

# Yolwise apps use CHROMIUM_EXECUTABLE; Puppeteer uses PUPPETEER_*.
# Alpine package provides /usr/bin/chromium-browser (symlink to chromium).
ENV CHROMIUM_EXECUTABLE=/usr/bin/chromium-browser \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_SKIP_DOWNLOAD=true
