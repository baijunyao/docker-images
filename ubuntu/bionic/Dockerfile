FROM ubuntu:bionic

ENV TZ="Asia/Shanghai"

COPY conf/sources.list /etc/apt/sources.list

RUN set -ex \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && apt-get update \
    && apt-get install -y tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt
