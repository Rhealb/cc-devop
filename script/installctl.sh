#!/bin/bash
DIR=$(dirname $0)
source ${DIR}/var.sh
cd ${DIR}/.. && BASE=$(pwd)
NAMESPACE=$1
if [ -z ${NAMESPACE} ]
then
  echo "namespace is required. Aborting."
  exit 1
fi

DEST=${BASE}/install/${NAMESPACE}
SRC=${BASE}/jsonnet

mkdir -p ${DEST}/env
mkdir -p ${DEST}/kc

cp ${SRC}/example/install-config.jsonnet ${SRC}/example/config.jsonnet
echo "Generating kubernetes specification for installation in ${NAMESPACE}"
jsonnet -m ${DEST} ${SRC}/example/install/install-entrypoint.jsonnet -J ${JLIB} || {
  echo "Failed to generate kubernetes specification. Aborting."
  exit 1
}

echo "Generating springboot configuaration."
jsonnet -m ${DEST}/env ${SRC}/example/install/install-env.jsonnet -S -J ${JLIB} || {
  echo "Failed to generate springboot configuration. Aborting."
  exit 1
}

echo "Generating keycloak configuaration."
jsonnet -m ${DEST}/kc ${SRC}/example/install/install-keycloak-config.jsonnet -J ${JLIB} || {
  echo "Failed to generate keycloak configuration. Aborting."
  exit 1
}

echo "Creating namespace, secrets and relative pvs and pvcs"
kubectl create -f ${DEST}/basic-specicifation.json

echo "Creating config map for cluster group vars"
kubectl -n${NAMESPACE} create configmap k8s-cluster-setting --from-file ${BASE}/all.yml

echo "Creating config map for ssl"
test -f /etc/ssl/ca-key.pem && \
test -f /etc/ssl/ca.pem && \
test -f /etc/ssl/kube/admin-key.pem && \
test -f /etc/ssl/kube/admin.pem && \
test -f /etc/ssl/etcd/etcd-admin-key.pem && \
test -f /etc/ssl/etcd/etcd-admin-key.pem || {
  echo "Missing ssl keys. Aborting."
  exit 1
}
mkdir -p ${BASE}/ssl && \
cp -f /etc/ssl/ca-key.pem ${BASE}/ssl/ && \
cp -f /etc/ssl/ca.pem ${BASE}/ssl/ && \
cp -f /etc/ssl/kube/admin-key.pem ${BASE}/ssl/ && \
cp -f /etc/ssl/kube/admin.pem ${BASE}/ssl/ && \
cp -f /etc/ssl/etcd/etcd-admin-key.pem ${BASE}/ssl/ && \
cp -f /etc/ssl/etcd/etcd-admin.pem ${BASE}/ssl/ && \
kubectl -n${NAMESPACE} create configmap k8s-cluster-ssl --from-file ${BASE}/ssl || {
  echo "Error in creating ssl configmap. Aborting"
  exit 1
}
echo "Creating console basic components, i.e. MySQL, config server, readis and etc."
kubectl create -f ${DEST}/basic-component-specification.json

echo "Waiting MySQL to be ready."
POD_READY=0
for i in {1..60};
do
  echo -n "."
  sleep 5
  POD_STATUS=$(kubectl -n${NAMESPACE} get po | grep mysql | grep Running | awk '{print $2}')
  if [ "$POD_STATUS" = "1/1" ]
  then
    POD_READY=1
    break
  fi
done
echo ""
if [ "$POD_READY" = 0 ]
then
  echo "MySQL failed to be ready. Aborting."
  exit 1
fi

echo "Waiting config server to be ready."
POD_READY=0
for i in {1..60};
do
  echo -n "."
  sleep 5
  POD_STATUS=$(kubectl -n${NAMESPACE} get po | grep cc-config-server | grep Running | awk 'NR==1 {print $2}')
  if [ "$POD_STATUS" = "1/1" ]
  then
    POD_READY=1
    break
  fi
done
echo ""
if [ "$POD_READY" = 0 ]
then
  echo "Config server failed to be running. Aborting."
  exit 1
fi

echo "Copying springboot configuration to config server."
PODNAME=$(kubectl -n${NAMESPACE} get po | grep cc-config-server | awk 'NR==1 {print $1}')
kubectl -n${NAMESPACE} cp ${DEST}/env ${PODNAME}:/config
kubectl -n${NAMESPACE} exec ${PODNAME} --  sh -c 'mv /config/env/* /config/'

echo "Initialize keycloak database"
MYSQL_POD_NAME=$(kubectl -n${NAMESPACE} get po | grep mysql | awk 'NR==1 {print $1}')
kubectl -n${NAMESPACE} cp ${BASE}/housekeeper/keycloak/init_mysql.sh ${MYSQL_POD_NAME}:/init_mysql.sh
kubectl -n${NAMESPACE} cp ${BASE}/housekeeper/keycloak/keycloak.sql ${MYSQL_POD_NAME}:/keycloak.sql
kubectl -n${NAMESPACE} exec ${MYSQL_POD_NAME} -- bash /init_mysql.sh || {
  echo "Failed to execute init script of mysql."
  exit 1
}

echo "Creating console components"
kubectl create -f ${DEST}/keycloak-spec.json
kubectl create -f ${DEST}/console-basic-specicifation.json
kubectl create -f ${DEST}/console-pro-specicifation.json

echo "Waiting keycloak server to be ready."
POD_READY=0
for i in {1..60};
do
  echo -n "."
  sleep 5
  POD_STATUS=$(kubectl -n${NAMESPACE} get po | grep keycloak | grep Running | awk 'NR==1 {print $2}')
  if [ "$POD_STATUS" = "1/1" ]
  then
    POD_READY=1
    break
  fi
done
echo ""

echo "Initialize keycloak realm and clients"
KC_POD_NAME=$(kubectl -n${NAMESPACE} get po | grep keycloak | awk 'NR==1 {print $1}')
kubectl -n${NAMESPACE} cp ${DEST}/kc ${KC_POD_NAME}:/opt/jboss/kc
kubectl -n${NAMESPACE} cp ${BASE}/housekeeper/keycloak/init_realm.sh ${KC_POD_NAME}:/opt/jboss/init_realm.sh
kubectl -n${NAMESPACE} exec ${KC_POD_NAME} -- bash /opt/jboss/init_realm.sh || {
  echo "Failed to execute init script of keycloak realm and clients."
  exit 1
}

echo "Restart gateway and terminal"
kubectl -n console scale deploy cc-terminal --replicas=0
kubectl -n system-tools scale deploy cc-gateway --replicas=0
sleep 1
kubectl -n console scale deploy cc-terminal --replicas=1
kubectl -n system-tools scale deploy cc-gateway --replicas=1
