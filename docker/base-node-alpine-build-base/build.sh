#!/bin/bash
docker build . -t node:alpine-build-base
docker tag node:alpine-build-base 10.19.140.200:29006/console/node:alpine-build-base
docker push 10.19.140.200:29006/console/node:alpine-build-base
