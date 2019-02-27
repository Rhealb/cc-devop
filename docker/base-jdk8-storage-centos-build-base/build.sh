docker build . -t base-jdk8-storage:centos-build-base
docker tag base-jdk8-storage:centos-build-base 10.19.140.200:29006/console/base-jdk8-storage:centos-build-base
docker push 10.19.140.200:29006/console/base-jdk8-storage:centos-build-base
