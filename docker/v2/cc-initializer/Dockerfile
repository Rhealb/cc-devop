FROM 10.19.140.200:29006/console/base-jdk8-storage:centos-build-base
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"
ENV GIT_REPO ssh://git@gitlab.cloud.enndata.cn:10885/cc/cc-initializer.git
ARG GIT_COMMIT

ADD ceph.conf /etc/ceph/
# Build image
RUN git clone ${GIT_REPO}  && cd cc-initializer && git checkout ${GIT_COMMIT} && \
	./gradlew build -x test && mv build/libs/cc-initializer-1.0.0.jar /app.jar && \
	cd / && rm -rf cc-initializer && rm -rf /root/.gradle

# Cleanup useless libs and files
RUN rm -rf /root/.ssh