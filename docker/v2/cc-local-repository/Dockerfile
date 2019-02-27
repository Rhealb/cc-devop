FROM 10.19.140.200:29006/console/s3cmd:1.0.0 AS build
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com"

ARG LOCAL_REPO_S3_DIR=s3://production-release/centosrepo7.4
ARG LOCAL_REPO_DIR=/centosrepo7.4

RUN mkdir /download && \
  mkdir /output &&  \
  s3cmd get --recursive ${LOCAL_REPO_S3_DIR} /

RUN mv ${LOCAL_REPO_DIR}/Packages /download/Packages && \
  mv ${LOCAL_REPO_DIR}/repodata /download/repodata

FROM 10.19.140.200:29006/console/nginx:1.13.2
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com"

COPY --from=build /download /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
