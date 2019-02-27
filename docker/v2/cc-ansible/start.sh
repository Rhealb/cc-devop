#!/usr/bin/env bash
DEST=/ansible/k8s-ansible-script/k8s-cluster/files/ssl
mkdir -p ${DEST}/etcd
mkdir -p ${DEST}/kube
cp  /cluster_ssl/ca* ${DEST}/
cp /cluster_ssl/admin* ${DEST}/kube
cp /cluster_ssl/etcd* ${DEST}/etcd/
bash /bootstrap.sh
