#!/bin/bash
docker build . -t base-jdk8:centos-build-base
docker tag base-jdk8:centos-build-base 10.19.140.200:29006/console/base-jdk8:centos-build-base
docker push 10.19.140.200:29006/console/base-jdk8:centos-build-base
