#!/usr/bin/env bash
HARBOR_PREFIX=10.19.140.200:29006/release
SERVICE=cc-gitbook
VERSION=release
COMMIT=5ff2829ce50d68c92bf37c0a7654610ee287f5c7
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
docker build . -t ${SERVICE}:${VERSION} --build-arg GIT_COMMIT=${COMMIT} --no-cache
docker tag ${SERVICE}:${VERSION} ${HARBOR_PREFIX}/${SERVICE}:${VERSION}
docker push ${HARBOR_PREFIX}/${SERVICE}:${VERSION}
