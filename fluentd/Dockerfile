ARG FLUENTD_VERSION=1.11
ARG FLUENTD_VARIANT=debian-elasticsearch7-1

FROM fluent/fluentd-kubernetes-daemonset:v${FLUENTD_VERSION}-${FLUENTD_VARIANT}

RUN set -ex \
    && gem install fluent-plugin-parser-cri --no-document
