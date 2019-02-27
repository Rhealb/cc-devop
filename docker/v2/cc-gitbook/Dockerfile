FROM 10.19.140.200:29006/console/node:alpine-build-base AS BUILD
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"

ENV GIT_REPO ssh://git@gitlab.cloud.enndata.cn:10885/faithfully/user-guide.git
ARG GIT_COMMIT

# Build Image
RUN git clone ${GIT_REPO} && cd user-guide && git checkout ${GIT_COMMIT} && \
  npm install -g gitbook-cli && gitbook install && gitbook build

FROM 10.19.140.200:29006/console/nginx:1.13.2
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"

WORKDIR /usr/share/nginx/html
COPY --from=BUILD /user-guide/_book/ /usr/share/nginx/html
