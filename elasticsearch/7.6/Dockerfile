FROM docker.elastic.co/elasticsearch/elasticsearch:7.6.2

ENV VERSION=7.6.2

ADD https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${VERSION}/elasticsearch-analysis-ik-$VERSION.zip /tmp/

RUN set -ex \
    && /usr/share/elasticsearch/bin/elasticsearch-plugin install -b file:///tmp/elasticsearch-analysis-ik-$VERSION.zip \
    && rm -rf /tmp/*
