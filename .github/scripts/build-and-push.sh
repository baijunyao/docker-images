#!/usr/bin/env sh
set -eu

if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <dockerfile> <context> <dockerhub-image> [docker-buildx-args...]" >&2
    exit 1
fi

dockerfile=$1
context=$2
dockerhub_image=$3
shift 3

aliyun_image="registry.cn-beijing.aliyuncs.com/${dockerhub_image}"
platforms=${DOCKER_PLATFORMS:-linux/amd64,linux/arm64}

docker buildx build \
    --platform "${platforms}" \
    --file "${dockerfile}" \
    --tag "${dockerhub_image}" \
    --tag "${aliyun_image}" \
    --push \
    "$@" \
    "${context}"
