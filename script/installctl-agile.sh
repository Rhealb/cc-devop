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

mkdir -p ${DEST}
cp ${SRC}/example/install-config.jsonnet ${SRC}/example/config.jsonnet
echo "Generating kubernetes specification for installation in ${NAMESPACE}"
jsonnet -m ${DEST} ${SRC}/example/install-agile/install-entrypoint-agile.jsonnet -J ${JLIB}

echo "Creating namespace, secrets and relative pvs and pvcs"
kubectl create -f ${DEST}/basic-specicifation.json

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

echo "Creating console components"
kubectl create -f ${DEST}/console-basic-specicifation.json
