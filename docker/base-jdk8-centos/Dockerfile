FROM 10.19.140.200:29006/console/openjdk:centos
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com"

ENV LOGPATTERN '^(?<year>\d+)-(?<month>\d+)-(?<day>\d+)(\s*)(?<time>[\d\.:]+)(\s*)(?<logLevel>\w+)(\s*)(?<pid>\d+)[\s-]+(?<log>.*)'
ENV LOGASSEMBLE '%logLevel%,%log%,<dateTime>%year%-%month%-%day% %time%'
ENV GATEWAYTOKEN '185D673C1B648BCEB45C0C01C09154BB'

ADD bootstrap.sh /bootstrap.sh
ENTRYPOINT bash /bootstrap.sh
