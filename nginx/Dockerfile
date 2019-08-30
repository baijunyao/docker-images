FROM nginx:mainline

COPY conf/sources.list /etc/apt/sources.list
COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN set -ex \
    && rm -rf /etc/nginx/conf.d/default.conf
