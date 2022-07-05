FROM baijunyao/php:8.1-production

RUN apt update \
    && apt install -y nginx \
    && apt clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf
