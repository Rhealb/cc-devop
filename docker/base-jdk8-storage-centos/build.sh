docker build . -t base-jdk8-storage:centos
docker tag base-jdk8-storage:centos 10.19.140.200:29006/console/base-jdk8-storage:centos
docker push 10.19.140.200:29006/console/base-jdk8-storage:centos
