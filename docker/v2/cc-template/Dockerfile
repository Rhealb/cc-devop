FROM 10.19.140.200:29006/console/base-jdk8:alpine-build-base
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"
ENV GIT_REPO ssh://git@gitlab.cloud.enndata.cn:10885/cc/cc-template.git
ARG GIT_COMMIT

# Build jsonnet
RUN apk add --no-cache build-base && \
		git clone https://github.com/google/jsonnet.git && \
    cd jsonnet && make && \
    mv jsonnet /usr/local/bin && \
    rm -rf /jsonnet && apk del build-base

# Build image
RUN git clone ${GIT_REPO}  && cd cc-template && git checkout ${GIT_COMMIT} && \
	./gradlew build -x test && mv build/libs/cc-template-1.0.0.jar /app.jar && \
	mv src/main/docker/redis-cli /usr/bin/redis-cli && mv src/main/docker/templates /template && \
	cd / && rm -rf cc-template && rm -rf /root/.gradle

# Cleanup useless libs and files
RUN rm -rf /root/.ssh && apk del openssh git
