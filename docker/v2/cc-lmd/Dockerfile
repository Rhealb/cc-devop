FROM 10.19.140.200:29006/console/node:alpine-build-base AS BUILD
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"

ENV GIT_REPO ssh://git@gitlab.cloud.enndata.cn:10885/cc/logAndMetric.git
ARG GIT_COMMIT

# Build Image
RUN git clone ${GIT_REPO} && cd logAndMetric && git checkout ${GIT_COMMIT} && npm install
RUN cd /logAndMetric && npm run build:prod

FROM 10.19.140.200:29006/console/nginx:1.13.2
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"

ENV TRACER_BIZLINE 'song-test'
ENV TRACER_INSTANCE 'browser'
ENV ZIPKIN_URL 'http://10.19.140.200:29307/security/gateway'

WORKDIR /usr/share/nginx/html
COPY --from=BUILD /logAndMetric/dist /usr/share/nginx/html
COPY --from=BUILD /logAndMetric/nginx-angular.conf /etc/nginx/conf.d/default.conf
COPY --from=BUILD /logAndMetric/replace_env.sh /usr/share/nginx/html

ENTRYPOINT ["./replace_env.sh"]
CMD ["nginx", "-g", "daemon off;"]
