docker build . -t openjdk:centos
docker tag openjdk:centos 10.19.140.200:29006/console/openjdk:centos
docker push 10.19.140.200:29006/console/openjdk:centos
