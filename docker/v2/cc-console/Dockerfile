FROM 10.19.140.200:29006/console/node:alpine-build-base AS BUILD
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"

ENV GIT_REPO ssh://git@gitlab.cloud.enndata.cn:10885/cc/cc-console.git
ARG GIT_COMMIT

# Build Image
RUN git clone ${GIT_REPO} && cd cc-console && git checkout ${GIT_COMMIT} && \
  npm install -g @angular/cli@7.0.2 && npm install
RUN cd /cc-console && npm run build:prod

FROM 10.19.140.200:29006/console/nginx:1.13.2
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"

RUN mkdir -p /var/static && mkdir -p /var/mount

WORKDIR /var/static/dist
COPY --from=BUILD /cc-console/dist /var/static/dist
COPY --from=BUILD /cc-console/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=BUILD /cc-console/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
