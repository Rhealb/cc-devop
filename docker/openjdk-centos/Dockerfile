FROM 10.19.140.200:29006/console/centos:7
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com"

RUN yum update -y && \
  yum install -y bash curl wget && \
  yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel && \
  yum clean all

ENV LANG C.UTF-8
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.171-8.b10.el7_5.x86_64
