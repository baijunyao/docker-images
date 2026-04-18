ARG PNPM_VERSION=10

FROM node:20-alpine

ARG PNPM_VERSION=10

RUN apk add --no-cache tzdata

RUN npm config set registry https://registry.npmmirror.com \
    && npm install -g pnpm@${PNPM_VERSION} \
    && pnpm config set registry https://registry.npmmirror.com \
    && pnpm config set store-dir /root/.local/share/pnpm/store
