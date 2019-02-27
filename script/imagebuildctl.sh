#!/bin/bash
DIR=$(dirname $0)
source ${DIR}/var.sh
cd ${DIR}/.. && BASE=$(pwd)
BUILD_ALL=0
BUILD_YC=0
while getopts ":ay" opt; do
  case ${opt} in
    a )
      BUILD_ALL=1
      ;;
    y )
      BUILD_YC=1
      ;;
    \? ) echo "Usage: imagebuildctl [-a]"
      ;;
  esac
done
shift $(($OPTIND - 1))
# Check docker binary
if ! [ -x "$(command -v docker)" ]; then
  echo "Error: docker is not installed. Aborting" >&2
  exit 1
fi

# Pull images
docker pull ${HARBOR}${DIND} && docker tag ${HARBOR}${DIND} ${DIND}
docker pull ${HARBOR}${BUILD_BASE} && docker tag ${HARBOR}${BUILD_BASE} ${BUILD_BASE}
# Delete existing container
docker rm -f docker-dind
# Make output directory
mkdir image
# Generate version script
jsonnet -m docker jsonnet/build-image/build-image.jsonnet -S -J $JLIB
# Start dockerd as docker-dind
docker run -d --privileged --name docker-dind ${DIND} --insecure-registry ${HARBOR_HOST} --insecure-registry ${YC_HARBOR_HOST}
export http_proxy=${PROXY_URL} && export https_proxy=${PROXY_URL}
if [ $BUILD_ALL != 0 ]
then
  if [ $BUILD_YC != 0 ]
  then
    docker run --rm --link docker-dind:docker  -v ${BASE}:/workspace ${BUILD_BASE} bash /workspace/docker/imagectl.sh -a -y
  else
    docker run --rm --link docker-dind:docker  -v ${BASE}:/workspace ${BUILD_BASE} bash /workspace/docker/imagectl.sh -a
  fi
else
  if [ $BUILD_YC != 0 ]
  then
    docker run --rm --link docker-dind:docker  -v ${BASE}:/workspace ${BUILD_BASE} bash /workspace/docker/imagectl.sh -y $@
  else
    docker run --rm --link docker-dind:docker  -v ${BASE}:/workspace ${BUILD_BASE} bash /workspace/docker/imagectl.sh $@
  fi
fi

# Cleanup
docker rm -f docker-dind
unset http_proxy && unset https_proxy
