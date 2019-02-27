#!/bin/bash
docker build . -t base-jdk8:alpine-build-base
docker tag base-jdk8:alpine-build-base 10.19.140.200:29006/console/base-jdk8:alpine-build-base
docker push 10.19.140.200:29006/console/base-jdk8:alpine-build-base
