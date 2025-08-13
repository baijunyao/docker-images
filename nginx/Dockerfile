ARG NGINX_MAJOR_VERSION=1.29

FROM nginx:${NGINX_MAJOR_VERSION} AS base

RUN set -ex \
    && rm -rf /etc/nginx/conf.d/default.conf
