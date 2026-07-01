FROM ubuntu:bionic

ENV TZ="Asia/Shanghai"

RUN set -ex \
    && if [ "$(dpkg --print-architecture)" = "amd64" ]; then \
        sed -i \
            -e 's#http://archive.ubuntu.com/ubuntu/#http://mirrors.aliyun.com/ubuntu/#g' \
            -e 's#http://security.ubuntu.com/ubuntu/#http://mirrors.aliyun.com/ubuntu/#g' \
            /etc/apt/sources.list; \
    else \
        sed -i \
            -e 's#http://ports.ubuntu.com/ubuntu-ports/#http://mirrors.aliyun.com/ubuntu-ports/#g' \
            /etc/apt/sources.list; \
    fi \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo "${TZ}" > /etc/timezone \
    && apt-get update \
    && apt-get install -y tzdata \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/cache/apt
