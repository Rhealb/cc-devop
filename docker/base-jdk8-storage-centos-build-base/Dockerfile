FROM 10.19.140.200:29006/console/base-jdk8:centos-build-base
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com"
VOLUME /etc/ceph

RUN yum install -y nfs-utils && yum clean all && mkdir /nfs

COPY ceph.repo /etc/yum.repos.d/ceph.repo

RUN yum install -y epel-release && \
  yum install -y ceph-common cephfs-java && yum clean all &&  rm -rf /var/cache/yum  && \
  mkdir -p /usr/lib/jni/ && \
  ln -s /usr/lib64/libcephfs_jni.so.1.0.0 /usr/lib/jni/libcephfs_jni.so
