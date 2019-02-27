#!/bin/bash
checkBinary() {
  if ! [ -x "$(command -v $1)" ]; then
    echo "Error: $1 is not installed. Aborting" >&2
    exit 1
  fi
}

checkHarbor() {
  checkBinary docker
  docker login -u $1 -p $2 $3 || {
    echo >&2 "Docker login with username $1 failed. Aborting.";
    exit 1
  }
}

# console component
compileComponent()
{
  COMPONENT=$1
  COMMIT=$2
  VERSION=$3
  docker build ${DIR}/v2/${COMPONENT} -t ${COMPONENT}:${VERSION} ${DOCKER_OPTS} --build-arg GIT_COMMIT=${COMMIT} || {
    echo "docker build failed for ${COMPONENT}:${VERSION} with commit ${COMMIT}. Aborting"
    exit 1
  }
  docker tag ${COMPONENT}:${VERSION} ${HARBOR_HOST}/${HARBOR_PROJECT}/${COMPONENT}:${VERSION}
  docker push ${HARBOR_HOST}/${HARBOR_PROJECT}/${COMPONENT}:${VERSION}
}

# local repository
compileLocalRepo()
{
  COMPONENT=$1
  VERSION=$2
  docker build ${DIR}/v2/${COMPONENT} -t ${COMPONENT}:${VERSION} ${DOCKER_OPTS} --build-arg LOCAL_REPO_S3_DIR=s3://production-release/centos4k8s1.9 --build-arg LOCAL_REPO_DIR=/centos4k8s1.9 || {
    echo "docker build failed for ${COMPONENT}:${VERSION}. Aborting"
    exit 1
  }
  docker tag ${COMPONENT}:${VERSION} ${HARBOR_HOST}/${HARBOR_PROJECT}/${COMPONENT}:${VERSION}
  docker push ${HARBOR_HOST}/${HARBOR_PROJECT}/${COMPONENT}:${VERSION}
}
compileBase() {
  compileBaseJdk8Alpine
  compileBaseJdk8AlpineBuildBase
  compileBaseJdk8Centos
  compileBaseJdk8CentosBuildBase
  compileBaseJdk8StorageCentos
  compileBaseJdk8StorageCentosBuildBase
  compileBaseNodeAlpineBuildBase
}
# base-jdk8-alpine
compileBaseJdk8Alpine()
{
  docker build ${DIR}/base-jdk8-alpine -t base-jdk8:alpine ${DOCKER_OPTS}
  docker tag base-jdk8:alpine 10.19.140.200:29006/console/base-jdk8:alpine
  docker push 10.19.140.200:29006/console/base-jdk8:alpine
}

# base-jdk8-alpine-build-base
compileBaseJdk8AlpineBuildBase()
{
  docker build ${DIR}/base-jdk8-alpine-build-base -t base-jdk8:alpine-build-base ${DOCKER_OPTS}
  docker tag base-jdk8:alpine-build-base 10.19.140.200:29006/console/base-jdk8:alpine-build-base
  docker push 10.19.140.200:29006/console/base-jdk8:alpine-build-base
}

# base-jdk8-centos
compileBaseJdk8Centos()
{
  docker build ${DIR}/base-jdk8-centos -t base-jdk8:centos ${DOCKER_OPTS}
  docker tag base-jdk8:centos 10.19.140.200:29006/console/base-jdk8:centos
  docker push 10.19.140.200:29006/console/base-jdk8:centos
}

# base-jdk8-centos-build-base
compileBaseJdk8CentosBuildBase()
{
  docker build ${DIR}/base-jdk8-centos-build-base -t base-jdk8:centos-build-base ${DOCKER_OPTS}
  docker tag base-jdk8:centos-build-base 10.19.140.200:29006/console/base-jdk8:centos-build-base
  docker push 10.19.140.200:29006/console/base-jdk8:centos-build-base
}

# base-jdk8-storage-centos
compileBaseJdk8StorageCentos()
{
  docker build ${DIR}/base-jdk8-storage-centos -t base-jdk8-storage:centos ${DOCKER_OPTS}
  docker tag base-jdk8-storage:centos 10.19.140.200:29006/console/base-jdk8-storage:centos
  docker push 10.19.140.200:29006/console/base-jdk8-storage:centos
}

# base-jdk8-storage-centos-build-base
compileBaseJdk8StorageCentosBuildBase()
{
  docker build ${DIR}/base-jdk8-storage-centos -t base-jdk8-storage:centos-build-base ${DOCKER_OPTS}
  docker tag base-jdk8-storage:centos-build-base 10.19.140.200:29006/console/base-jdk8-storage:centos-build-base
  docker push 10.19.140.200:29006/console/base-jdk8-storage:centos-build-base
}

# base-node-alpine-build-base
compileBaseNodeAlpineBuildBase()
{
  docker build ${DIR}/base-node-alpine-build-base -t node:alpine-build-base ${DOCKER_OPTS}
  docker tag node:alpine-build-base 10.19.140.200:29006/console/node:alpine-build-base
  docker push 10.19.140.200:29006/console/node:alpine-build-base
}

# openjdk-centos
compileOpenjdkCentos(){
  docker build ${DIR}/openjdk-centos -t openjdk:centos ${DOCKER_OPTS}
  docker tag openjdk:centos 10.19.140.200:29006/console/openjdk:centos
  docker push 10.19.140.200:29006/console/openjdk:centos
}
