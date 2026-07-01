ARG OSSUTIL_VERSION=1.7.0
ARG ALPINE_VERSION=3.23

FROM baijunyao/alpine:${ALPINE_VERSION} AS downloader

ARG OSSUTIL_VERSION=1.7.0
ARG TARGETARCH

RUN set -eux; \
    apk add --no-cache curl unzip; \
    case "${TARGETARCH}" in \
        amd64) ossutil_arch="amd64" ;; \
        arm64) ossutil_arch="arm64" ;; \
        *) echo "Unsupported architecture: ${TARGETARCH}" >&2; exit 1 ;; \
    esac; \
    if [ "${OSSUTIL_VERSION%%.*}" = "1" ]; then \
        case "${ossutil_arch}" in \
            amd64) ossutil_binary="ossutil64" ;; \
            arm64) ossutil_binary="ossutilarm64" ;; \
        esac; \
        ossutil_url="http://gosspublic.alicdn.com/ossutil/${OSSUTIL_VERSION}/${ossutil_binary}"; \
        curl -fsSL "${ossutil_url}" -o /usr/local/bin/ossutil; \
    else \
        ossutil_zip="ossutil-${OSSUTIL_VERSION}-linux-${ossutil_arch}.zip"; \
        ossutil_url="https://gosspublic.alicdn.com/ossutil/v2/${OSSUTIL_VERSION}/${ossutil_zip}"; \
        curl -fsSL "${ossutil_url}" -o "/tmp/${ossutil_zip}"; \
        unzip "/tmp/${ossutil_zip}" -d /tmp; \
        mv "/tmp/ossutil-${OSSUTIL_VERSION}-linux-${ossutil_arch}/ossutil" /usr/local/bin/ossutil; \
        rm -rf "/tmp/${ossutil_zip}" "/tmp/ossutil-${OSSUTIL_VERSION}-linux-${ossutil_arch}"; \
    fi; \
    chmod a+x /usr/local/bin/ossutil

FROM baijunyao/alpine:${ALPINE_VERSION}

COPY --from=downloader /usr/local/bin/ossutil /usr/local/bin/ossutil
