FROM 10.19.140.200:29006/console/centos:7
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com"

RUN yum update -y && \
  yum install -y bash curl perl-JSON-PP wget && \
  yum clean all && \
  rm -rf /var/cache/yum

RUN yum install -y epel-release && \
  yum install -y ceph-common && \
  yum clean all && \
  rm -rf /var/cache/yum

COPY ./kubectl /bin/kubectl
