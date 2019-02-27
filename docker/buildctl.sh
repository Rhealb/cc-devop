#!/bin/bash
DIR=$(dirname $0)
source ${DIR}/version.sh
source ${DIR}/script/var.sh
source ${DIR}/script/func.sh
BUILD_ALL=0
while getopts ":ayf" opt; do
  case ${opt} in
    a )
      BUILD_ALL=1
      ;;
    y )
      HARBOR_HOST=10.19.248.200:29006
      HARBOR_USERNAME=admin
      HARBOR_PASSWORD=zhtsC1002
      ;;
    f )
      DOCKER_OPTS=--no-cache
      ;;
    \? )
      echo "Usage: imagectl [-af]"
      echo "  -a    build all component"
      echo "  -f    build with no cache"
      ;;
  esac
done
shift $(($OPTIND - 1))
# check harbor
checkHarbor $HARBOR_USERNAME $HARBOR_PASSWORD $HARBOR_HOST
# Check git
checkBinary git
if [ $BUILD_ALL != 0 ]
then
  compileComponent ${ACCOUNT_IMAGE} ${ACCOUNT_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${ANSIBLE_IMAGE} ${ANSIBLE_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${AUDIT_IMAGE} ${AUDIT_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${BACCKEND_IMAGE} ${BACCKEND_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${CONSOLE_IMAGE} ${CONSOLE_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${GATEWAY_IMAGE} ${GATEWAY_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${GC_IMAGE} ${GC_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${HARBOR_IMAGE} ${HARBOR_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${INITIALIZER_IMAGE} ${INITIALIZER_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${KUBEORIGIN_IMAGE} ${KUBEORIGIN_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${LMD_IMAGE} ${LMD_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${LOG_IMAGE} ${LOG_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${METRIC_IMAGE} ${METRIC_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${NOTIFICATION_IMAGE} ${NOTIFICATION_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${STORAGE_IMAGE} ${STORAGE_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${TEMPLATE_IMAGE} ${TEMPLATE_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${TERMINAL_IMAGE} ${TERMINAL_COMMIT} ${CONSOLE_VERSION}
  compileComponent ${WATCH_IMAGE} ${WATCH_COMMIT} ${CONSOLE_VERSION}
  compileLocalRepo ${LOCAL_REPO_IMAGE} ${CONSOLE_VERSION}
else
  for arg in $@; do
    case $arg in
      account)
        compileComponent ${ACCOUNT_IMAGE} ${ACCOUNT_COMMIT} ${CONSOLE_VERSION}
        ;;
      ansible)
        compileComponent ${ANSIBLE_IMAGE} ${ANSIBLE_COMMIT} ${CONSOLE_VERSION}
        ;;
      audit)
        compileComponent ${AUDIT_IMAGE} ${AUDIT_COMMIT} ${CONSOLE_VERSION}
        ;;
      backend)
        compileComponent ${BACCKEND_IMAGE} ${BACCKEND_COMMIT} ${CONSOLE_VERSION}
        ;;
      console)
        compileComponent ${CONSOLE_IMAGE} ${CONSOLE_COMMIT} ${CONSOLE_VERSION}
        ;;
      gateway)
        compileComponent ${GATEWAY_IMAGE} ${GATEWAY_COMMIT} ${CONSOLE_VERSION}
        ;;
      gc)
        compileComponent ${GC_IMAGE} ${GC_COMMIT} ${CONSOLE_VERSION}
        ;;
      gitbook)
        compileGitbook ${GITBOOK_IMAGE} ${GITBOOK_COMMIT} ${CONSOLE_VERSION}
        ;;
      harbor)
        compileComponent ${HARBOR_IMAGE} ${HARBOR_COMMIT} ${CONSOLE_VERSION}
        ;;
      initializer)
        compileComponent ${INITIALIZER_IMAGE} ${INITIALIZER_COMMIT} ${CONSOLE_VERSION}
        ;;
      kubeorigin)
        compileComponent ${KUBEORIGIN_IMAGE} ${KUBEORIGIN_COMMIT} ${CONSOLE_VERSION}
        ;;
      local-repository)
        compileLocalRepo ${LOCAL_REPO_IMAGE} ${CONSOLE_VERSION}
        ;;
      log)
        compileComponent ${LOG_IMAGE} ${LOG_COMMIT} ${CONSOLE_VERSION}
        ;;
      lmd)
        compileComponent ${LMD_IMAGE} ${LMD_COMMIT} ${CONSOLE_VERSION}
        ;;
      metric)
        compileComponent ${METRIC_IMAGE} ${METRIC_COMMIT} ${CONSOLE_VERSION}
        ;;
      notification)
        compileComponent ${NOTIFICATION_IMAGE} ${NOTIFICATION_COMMIT} ${CONSOLE_VERSION}
        ;;
      storage)
        compileComponent ${STORAGE_IMAGE} ${STORAGE_COMMIT} ${CONSOLE_VERSION}
        ;;
      template)
        compileComponent ${TEMPLATE_IMAGE} ${TEMPLATE_COMMIT} ${CONSOLE_VERSION}
        ;;
      terminal)
        compileComponent ${TERMINAL_IMAGE} ${TERMINAL_COMMIT} ${CONSOLE_VERSION}
        ;;
      watch)
        compileComponent ${WATCH_IMAGE} ${WATCH_COMMIT} ${CONSOLE_VERSION}
        ;;
      base)
        compileBase
        ;;
      openjdk-centos)
        compileOpenjdkCentos
        ;;
      base-jdk8-alpine)
        compileBaseJdk8Alpine
        ;;
      base-jdk8-alpine-build-base)
        compileBaseJdk8AlpineBuildBase
        ;;
      base-jdk8-centos)
        compileBaseJdk8Centos
        ;;
      base-jdk8-centos-build-base)
        compileBaseJdk8CentosBuildBase
        ;;
      base-jdk8-storage-centos)
        compileBaseJdk8StorageCentos
        ;;
      base-jdk8-storage-centos-build-base)
        compileBaseJdk8StorageCentosBuildBase
        ;;
      base-node-alpine-build-base)
        compileBaseNodeAlpineBuildBase
        ;;
      *)
        echo "$arg not support"
        ;;
    esac
  done
fi
