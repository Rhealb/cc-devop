#!/usr/bin/env bash
HARBOR_PREFIX=10.19.140.200:29006/console
SERVICE=cc-console
VERSION=release
COMMIT=e0faf9a2730bd7b547d54c8aeeb287c2aa06f1f4
while getopts "c:v:" opt; do
  case ${opt} in
    c )
      COMMIT=${OPTARG}
      ;;
    v )
      VERSION=${OPTARG}
      ;;
    \? ) echo "Usage: build [-c] [-v]"
      ;;
  esac
done
shift $(($OPTIND - 1))
docker build . -t ${SERVICE}:${VERSION} --build-arg GIT_COMMIT=${COMMIT}
docker tag ${SERVICE}:${VERSION} ${HARBOR_PREFIX}/${SERVICE}:${VERSION}
docker push ${HARBOR_PREFIX}/${SERVICE}:${VERSION}
