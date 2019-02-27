FROM 10.19.140.200:29006/console/base-jdk8:alpine-build-base
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"

# Install ansible
RUN apk add --no-cache python ansible sshpass

# Install cfssl related tools
RUN curl -s -L -o /usr/local/bin/cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 && \
	curl -s -L -o /usr/local/bin/cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64 && \
	chmod +x /usr/local/bin/cfssl && \
	chmod +x /usr/local/bin/cfssljson

ARG GIT_COMMIT
ARG K8S_TAG=newest
ENV GIT_REPO ssh://git@gitlab.cloud.enndata.cn:10885/cc/cc-ansible.git
ENV K8S_DOWNLOAD_URL http://10.19.140.200:29198/download/${K8S_TAG}.tar
ENV K8S_ANSIBLE_REPO ssh://git@gitlab.cloud.enndata.cn:10885/enn-product/k8s-ansible-script.git
ENV HARBOR_IMAGE_URL http://download.ennctl.dev.enndata.cn/release/cluster/harbor.tar
ENV K8S_ANSIBLE_BRANCH helium-add-node-1.5

# Prepare k8s ansible script
RUN mkdir -p /ansible && cd /ansible && git clone ${K8S_ANSIBLE_REPO} && cd k8s-ansible-script && mkdir out &&\
	git checkout ${K8S_ANSIBLE_BRANCH} && rm -rf dojoyn monitor registry_build roles aws console modules .git && \
	cd k8s-cluster && wget -O k8s.tar ${K8S_DOWNLOAD_URL} && tar xvf k8s.tar && mv ${K8S_TAG} files && rm -rf k8s.tar && \
	mkdir -p files/images/k8s && cd files/images/k8s && wget ${HARBOR_IMAGE_URL}

# Build image
RUN git clone ${GIT_REPO}  && cd cc-ansible && git checkout ${GIT_COMMIT} && \
	./gradlew build -x test && mv build/libs/cc-ansible-1.0.0.jar /app.jar && \
	cd / && rm -rf cc-ansible && rm -rf /root/.gradle

COPY start.sh /start.sh
ENTRYPOINT bash /start.sh
