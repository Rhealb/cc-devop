FROM 10.19.140.200:29006/console/base-jdk8:alpine-build-base
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"
ENV GIT_REPO ssh://git@gitlab.cloud.enndata.cn:10885/cc/cc-account.git
ARG GIT_COMMIT

# Build image
RUN git clone ${GIT_REPO}  && cd cc-account && git checkout ${GIT_COMMIT} && \
	./gradlew build -x test && mv build/libs/cc-account-1.0.0.jar /app.jar && \
	cd / && rm -rf cc-account && rm -rf /root/.gradle

# Cleanup useless libs and files
RUN rm -rf /root/.ssh && apk del openssh git