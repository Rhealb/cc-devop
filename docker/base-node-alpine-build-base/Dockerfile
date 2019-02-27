FROM 10.19.140.200:29006/console/node:8-alpine
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"

COPY ssh /root/.ssh

RUN apk add --no-cache bash curl git openssh && \
  chmod 400 /root/.ssh/id_rsa

ENTRYPOINT sleep 10000
