#!/bin/bash
docker build . -t base-jdk8:alpine
docker tag base-jdk8:alpine 10.19.140.200:29006/console/base-jdk8:alpine
docker push 10.19.140.200:29006/console/base-jdk8:alpine
