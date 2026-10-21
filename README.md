# Docker Images
Some Dockerfile

## PHP 8.2 ~ 8.5
Default build version: 8.5
DockerHub: https://hub.docker.com/r/baijunyao/php

### Local
Feature
- Extends Base
- Install xdebug extensions
- Add `post_max_size=20M` and `upload_max_filesize=20M` to php.ini

Pull PHP FPM image, e.g.
```bash
docker pull baijunyao/php:8.2-fpm-local
```

Pull PHP CLI image, e.g.
```bash
docker pull baijunyao/php:8.2-cli-local
```

### Production
Feature
- Extends Base
- Install opcache extensions
- Add `post_max_size=20M` and `upload_max_filesize=20M` to php.ini

Pull PHP FPM image, e.g.
```bash
docker pull baijunyao/php:8.2-fpm-production
```

Pull PHP CLI image, e.g.
```bash
docker pull baijunyao/php:8.2-cli-production
```

## Alpine 3.23
DockerHub: https://hub.docker.com/r/baijunyao/alpine

Feature
- Install ca-certificates and tzdata
- Set default timezone to Asia/Shanghai

Pull image
```bash
docker pull baijunyao/alpine:3.23
```

## OSSUtil 1.7.0、2.3.0
DockerHub: https://hub.docker.com/r/baijunyao/ossutil

Feature
- Based on baijunyao/alpine
- Install Alibaba Cloud OSS command line tool

Pull image
```bash
docker pull baijunyao/ossutil:1.7.0
docker pull baijunyao/ossutil:2.3.0
```

## pnpm 10
Base image: Node.js 24 (Alpine)
DockerHub: https://hub.docker.com/r/baijunyao/pnpm

Feature
- Use npmmirror

Pull image
```bash
docker pull baijunyao/pnpm:10
```
