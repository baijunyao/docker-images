FROM docker.elastic.co/elasticsearch/elasticsearch:6.8.3

ENV VERSION=6.8.3

ADD https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v${VERSION}/elasticsearch-analysis-ik-$VERSION.zip /tmp/

RUN set -ex \
    && /usr/share/elasticsearch/bin/elasticsearch-plugin install -b file:///tmp/elasticsearch-analysis-ik-$VERSION.zip \
    && rm -rf /tmp/*
