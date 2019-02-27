FROM alpine:3.3
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com)"
RUN apk --no-cache add py-pip bash && pip install s3cmd
COPY s3cfg /root/.s3cfg
