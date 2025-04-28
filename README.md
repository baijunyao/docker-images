# Docker Images
Some Dockerfile

# PHP 7.1 ~ 8.4
DockerHub: https://hub.docker.com/r/baijunyao/php

## Local
Feature
- Extends Base
- Install xdebug extensions
- Add `post_max_size=20M` and `upload_max_filesize=20M` to php.ini

Pull PHP FPM image, e.g.
```bash
docker pull baijunyao/php:8.0-fpm-local
```

Pull PHP CLI image, e.g.
```bash
docker pull baijunyao/php:8.0-cli-local
```

## Production
Feature
- Extends Base
- Install opcache extensions
- Add `post_max_size=20M` and `upload_max_filesize=20M` to php.ini

Pull PHP FPM image, e.g.
```bash
docker pull baijunyao/php:8.0-fpm-production
```

Pull PHP CLI image, e.g.
```bash
docker pull baijunyao/php:8.0-cli-production
```

# MySQL 8.0
DockerHub: https://hub.docker.com/r/baijunyao/mysql
## Local
Feature
- Add `default-authentication-plugin=mysql_native_password` and `bind-address=0.0.0.0` to my.cnf

Pull image
```bash
docker pull baijunyao/mysql:8.0-local
```

## Production
Feature
- Add `default-authentication-plugin=mysql_native_password` to my.cnf

Pull image
```bash
docker pull baijunyao/mysql:8.0-production
```
# MySQL Client
DockerHub: https://hub.docker.com/r/baijunyao/mysql-client

Pull image
```bash
docker pull baijunyao/mysql-client:1.0
```

# NGINX 1.7
DockerHub: https://hub.docker.com/r/baijunyao/nginx

Feature
- Add [nginx.conf](./nginx/1.7/conf/nginx.conf)
- Remove /etc/nginx/conf.d/default.conf

Pull image
```bash
docker pull baijunyao/nginx:1.7
```

# Elasticsearch 7.4、7.6
DockerHub: https://hub.docker.com/r/baijunyao/elasticsearch

Feature
- Install elasticsearch-analysis-ik

Pull image
```bash
docker pull baijunyao/elasticsearch:7.4
docker pull baijunyao/elasticsearch:7.6
```
# Alpine 3.12
DockerHub: https://hub.docker.com/r/baijunyao/alpine

Feature
- Install tzdata and set default timezone to Asia/Shanghai

Pull image
```bash
docker pull baijunyao/alpine:3.12
```

# Fluentd 1.11
DockerHub: https://hub.docker.com/r/baijunyao/fluentd

Feature
- Install fluent-plugin-parser-cri

Pull image
```bash
docker pull baijunyao/fluentd:1.11
```
