ARG MYSQL_VERSION=8.0
ARG MYSQL_ENV=production

FROM mysql:${MYSQL_VERSION}

ARG MYSQL_VERSION=8.0
ARG MYSQL_ENV=production

COPY 8.0/conf/ /tmp/mysql-conf/

RUN set -ex \
    && case "${MYSQL_ENV}" in \
        local|production) ;; \
        *) echo "Unsupported MySQL environment: ${MYSQL_ENV}" >&2; exit 1 ;; \
    esac \
    && if [ "${MYSQL_VERSION}" = "8.0" ]; then \
        cp "/tmp/mysql-conf/my.cnf.${MYSQL_ENV}" /etc/mysql/conf.d/my.cnf; \
    fi \
    && rm -rf /tmp/mysql-conf
