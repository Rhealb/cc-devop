#!/bin/bash
DIR=$(dirname $0)
source ${DIR}/var.sh
cd ${DIR}/.. && BASE=$(pwd)

LOCATION="sh-stage"
URL="http://10.19.140.200:29000"
NAMESPACE="cc-itg"
CONTEXT="sh-context"
MYSQL_USERNAME="root"
MYSQL_PASSWORD="root"
CLEAN_FLAG=0
while getopts "l:c" opt; do
  case ${opt} in
    l )
      LOCATION=${OPTARG}
      ;;
    c )
      CLEAN_FLAG=1
      ;;
    \? ) echo "Usage: upgradectl.sh [-l] [-c]"
      ;;
  esac
done
shift $(($OPTIND - 1))
DEST=${BASE}/upgrade/${LOCATION}
SRC=${BASE}/jsonnet

# handle -l
case ${LOCATION} in
sh-dev)
  cp ${SRC}/example/sh-dev-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.140.200:29210"
  NAMESPACE="cc-dev"
  CONTEXT="sh-context"
  MYSQL_PASSWORD="Y2MtZGV2LW15c3Fs"
  ;;
sh-itg)
  cp ${SRC}/example/sh-itg-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.140.200:29220"
  NAMESPACE="cc-stage"
  CONTEXT="sh-context"
  ;;
sh-stage)
  cp ${SRC}/example/sh-stage-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.140.200:29000"
  NAMESPACE="cc-itg"
  CONTEXT="sh-context"
  ;;
yc)
  cp ${SRC}/example/yc-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.248.200:32206"
  NAMESPACE="cc-dev"
  CONTEXT="yc-context"
  ;;
yc-backup)
  cp ${SRC}/example/yc-backup-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.248.200:29250"
  NAMESPACE="cc-backup"
  CONTEXT="yc-context"
  ;;
*)
  echo "Unsupported location ${LOCATION}. -l option should be one of the following."
  echo "  - sh-dev"
  echo "  - sh-itg"
  echo "  - sh-stage"
  echo "  - yc"
  echo "  - yc-backup"
  exit 1
  ;;
esac

# handle -c
if [ ${CLEAN_FLAG} != 0 ]
then
  rm -rf ${DEST}
  exit 0
fi
echo "Location ${LOCATION}"
echo "Web UI url ${URL}"
echo "Generating kubernetes specification."
mkdir -p ${DEST}/env
jsonnet -o ${DEST}/${UPGRADE_SPEC_NAME} ${SRC}/example/upgrade/upgrade-spec.jsonnet -J $JLIB
echo "Generating springboot configuration."
jsonnet -m ${DEST}/env ${SRC}/example/upgrade/upgrade-env.jsonnet -S -J $JLIB
echo "Dropping gateway policy table"
MYSQL_STATUS=$(kubectl -n${NAMESPACE} get po --context=${CONTEXT} | grep mysql | grep Running | awk '{print $2}')
if [ "$MYSQL_STATUS" != "1/1" ]
then
  echo "MySQL not ready. Aborting"
  exit 1
fi
MYSQL_POD_STATUS=$(kubectl -n${NAMESPACE} get po --context=${CONTEXT} | grep mysql | grep Running | awk '{print $1}')
kubectl -n${NAMESPACE} --context=${CONTEXT} exec ${MYSQL_POD_STATUS} -- mysql -u${MYSQL_USERNAME} -p${MYSQL_PASSWORD} -e "use cc;truncate gateway_role_policy;" || {
  echo "Truncate gateway table failed."
  exit 1
}
echo "Copying envs to config server pod."
PODNAME=$(kubectl -n${NAMESPACE} get po --context=${CONTEXT} | grep cc-config-server | awk '{print $1}')
kubectl -n${NAMESPACE} --context=${CONTEXT} cp ${DEST}/env/ ${PODNAME}:/config/
kubectl -n${NAMESPACE} --context=${CONTEXT} exec ${PODNAME} --  sh -c 'mv /config/env/* /config/'
echo "Upgrade console components."
kubectl --context=${CONTEXT} replace -f ${DEST}/${UPGRADE_SPEC_NAME}
