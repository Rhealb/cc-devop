#!/bin/bash
DIR=$(dirname $0)

echo "Check ceph"
CEPH_STATUS=$(ceph -s | grep health | awk '{print $2}')
if [ $CEPH_STATUS != "HEALTH_OK" ]; then
  echo >&2 "ceph is in trouble with status ${CEPH_STATUS}"
  ceph -s
  CEPH_FLAG=1
fi

checkService() {
  SERVICE=$1
  NAMESPACE=$2
  echo "Wait ${SERVICE} to be ready."
  POD_READY=0
  for i in {1..120};
  do
    echo -n "."
    POD_STATUS=$(kubectl -n${NAMESPACE} get po | grep ${SERVICE} | grep Running | awk 'NR==1 {print $2}')
    if [ "$POD_STATUS" = "1/1" ]
    then
      POD_READY=1
      break
    fi
    sleep 5
  done
  if [ $POD_READY -ne 1 ];then
    echo ""
    echo >&2 "Aborting, ${SERVICE} is not ready for 600 seconds, please do a manual check."
    exit 1
  fi
  echo " ok"
}
checkService cc-backend console
checkService cc-gateway system-tools
checkService cc-initializer console
checkService cc-kubeorigin console
checkService cc-mysql console
checkService cc-rabbitmq console
checkService cc-redis console
checkService cc-terminal console
