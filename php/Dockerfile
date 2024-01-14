ARG PHP_MAJOR_VERSION=7.2
ARG PHP_MOD=fpm

FROM php:${PHP_MAJOR_VERSION}-${PHP_MOD} AS base

# Due to scope issues, it is necessary to redefine here. https://docs.docker.com/engine/reference/builder/#scope
ARG PHP_MAJOR_VERSION=7.2
ARG PHP_MOD=fpm

ADD https://mirrors.aliyun.com/composer/composer.phar /usr/local/bin/composer

RUN set -xe \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        unzip \
    && if [ "${PHP_MAJOR_VERSION}" = "7.2" ] || [ "${PHP_MAJOR_VERSION}" = "7.3" ]; then \
        docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    else \
        # https://github.com/docker-library/php/issues/912#issuecomment-559918036  \
        # https://github.com/php/php-src/blob/PHP-7.4/UPGRADING#L755-L764
        docker-php-ext-configure gd --with-freetype --with-jpeg; \
    fi \
    && docker-php-ext-install gd pdo_mysql zip exif \
    && pecl install -o -f redis \
    && docker-php-ext-enable redis \
    && chmod a+x /usr/local/bin/composer \
    && rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

FROM base AS local

# Due to scope issues, it is necessary to redefine here. https://docs.docker.com/engine/reference/builder/#scope
ARG PHP_MAJOR_VERSION=7.2
ARG PHP_MOD=fpm

RUN docker-php-ext-install pcntl \
    && if [ "${PHP_MAJOR_VERSION}" = "7.2" ] || [ "${PHP_MAJOR_VERSION}" = "7.3" ] || [ "${PHP_MAJOR_VERSION}" = "7.4" ]; then \
        pecl install -o -f xdebug-2.9.8; \
    else \
        pecl install -o -f xdebug; \
    fi \
    && cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
    && printf '%s\n' 'post_max_size=20M' 'upload_max_filesize=20M' 'max_input_vars=10000' 'max_execution_time=300' >> /usr/local/etc/php/php.ini \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

COPY conf/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

FROM base AS production

# Due to scope issues, it is necessary to redefine here. https://docs.docker.com/engine/reference/builder/#scope
ARG PHP_MAJOR_VERSION=7.2
ARG PHP_MOD=fpm

RUN docker-php-ext-install opcache \
    && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && printf '%s\n' 'post_max_size=20M' 'upload_max_filesize=20M' 'max_input_vars=10000' >> /usr/local/etc/php/php.ini

