#!/bin/bash
docker build . -t base-jdk8:centos
docker tag base-jdk8:centos 10.19.140.200:29006/console/base-jdk8:centos
docker push 10.19.140.200:29006/console/base-jdk8:centos
