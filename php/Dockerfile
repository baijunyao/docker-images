ARG PHP_MAJOR_VERSION=7.3
ARG PHP_MOD=fpm

FROM php:${PHP_MAJOR_VERSION}-${PHP_MOD} AS base

# Due to scope issues, it is necessary to redefine here. https://docs.docker.com/engine/reference/builder/#scope
ARG PHP_MAJOR_VERSION=7.3
ARG PHP_MOD=fpm

RUN set -xe \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libicu-dev \
        libzip-dev \
        unzip \
    && if [ "${PHP_MAJOR_VERSION}" = "7.3" ]; then \
        docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    else \
        # https://github.com/docker-library/php/issues/912#issuecomment-559918036  \
        # https://github.com/php/php-src/blob/PHP-7.4/UPGRADING#L755-L764
        docker-php-ext-configure gd --with-freetype --with-jpeg; \
    fi \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl gd pdo_mysql zip exif \
    && case "${PHP_MAJOR_VERSION}" in \
        7.3) pecl install -o -f redis-6.0.2 ;; \
        7.4|8.0|8.1|8.2|8.3|8.4) pecl install -o -f redis-6.2.0 ;; \
        *) echo "Unsupported PHP version (${PHP_MAJOR_VERSION}) for redis extension" && exit 1 ;; \
       esac \
    && docker-php-ext-enable redis \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && chmod a+x /usr/local/bin/composer \
    && rm -rf /tmp/pear \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

FROM base AS local

# Due to scope issues, it is necessary to redefine here. https://docs.docker.com/engine/reference/builder/#scope
ARG PHP_MAJOR_VERSION=7.3
ARG PHP_MOD=fpm

RUN docker-php-ext-install pcntl \
    && case "${PHP_MAJOR_VERSION}" in \
        7.3|7.4) pecl install -o -f xdebug-3.1.6 ;; \
        8.0|8.1|8.2|8.3|8.4) pecl install -o -f xdebug-3.4.2 ;; \
        *) echo "Unsupported PHP version (${PHP_MAJOR_VERSION}) for xdebug extension" && exit 1 ;; \
       esac \
    && cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
    && printf '%s\n' 'post_max_size=20M' 'upload_max_filesize=20M' 'max_input_vars=10000' 'max_execution_time=300' >> /usr/local/etc/php/php.ini \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

COPY conf/docker-php-ext-xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

FROM base AS production

# Due to scope issues, it is necessary to redefine here. https://docs.docker.com/engine/reference/builder/#scope
ARG PHP_MAJOR_VERSION=7.3
ARG PHP_MOD=fpm

RUN docker-php-ext-install opcache \
    && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && printf '%s\n' 'post_max_size=20M' 'upload_max_filesize=20M' 'max_input_vars=10000' >> /usr/local/etc/php/php.ini

