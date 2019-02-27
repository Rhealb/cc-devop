#!/bin/bash
DIR=$(dirname $0)
source ${DIR}/var.sh
# source ${DIR}/var.sh
cd ${DIR}/.. && BASE=$(pwd)
LOCATION="sh-stage"
URL="http://10.19.140.200:29000"
while getopts "l:" opt; do
  case ${opt} in
    l )
      LOCATION=${OPTARG}
      ;;
    \? ) echo "Usage: upgradectl.sh [-l]"
      ;;
  esac
done
shift $(($OPTIND - 1))
DEST=${BASE}/check/${LOCATION}
SRC=${BASE}/jsonnet

# handle -l
case ${LOCATION} in
sh-dev)
  cp ${SRC}/example/sh-dev-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.140.200:29210"
  ;;
sh-itg)
  cp ${SRC}/example/sh-itg-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.140.200:29220"
  ;;
sh-stage)
  cp ${SRC}/example/sh-stage-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.140.200:29000"
  ;;
yc)
  cp ${SRC}/example/yc-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.248.200:32206"
  ;;
yc-backup)
  cp ${SRC}/example/yc-backup-config.jsonnet ${SRC}/example/config.jsonnet
  URL="http://10.19.248.200:29250"
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

echo "Location ${LOCATION}"
echo "Web UI url ${URL}"
echo "Generating related configuration files"
mkdir -p ${DEST}
jsonnet -m ${DEST} ${SRC}/example/health-check/health-check.jsonnet -S -J $JLIB
cp docker/healthctl.sh ${DEST}/healthctl.sh

docker pull ${HARBOR}${HEALTH_CHECKER} && docker tag ${HARBOR}${HEALTH_CHECKER} ${HEALTH_CHECKER}
docker rm -f health-checker
docker run --rm --name health-checker -it -v ${DEST}:/root ${HEALTH_CHECKER} /root/healthctl.sh
