ARG ELASTICSEARCH_VERSION=7.4.1

FROM docker.elastic.co/elasticsearch/elasticsearch:${ELASTICSEARCH_VERSION}

ARG ELASTICSEARCH_VERSION=7.4.1

ADD https://release.infinilabs.com/analysis-ik/stable/elasticsearch-analysis-ik-$ELASTICSEARCH_VERSION.zip /tmp/

RUN set -ex \
    && /usr/share/elasticsearch/bin/elasticsearch-plugin install -b file:///tmp/elasticsearch-analysis-ik-$ELASTICSEARCH_VERSION.zip \
    && rm -rf /tmp/*
