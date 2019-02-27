#!/usr/bin/env bash
HARBOR_PREFIX=10.19.140.200:29006/release
SERVICE=cc-initializer
VERSION=release
COMMIT=f7bcc9fbaffb18983f9a289ffd0ee20e2e8ba624
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