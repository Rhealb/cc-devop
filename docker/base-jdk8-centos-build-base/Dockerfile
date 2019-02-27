FROM 10.19.140.200:29006/console/openjdk:centos
MAINTAINER "ZihanTang(mrzihan.tang@gmail.com"

ENV LOGPATTERN '^(?<year>\d+)-(?<month>\d+)-(?<day>\d+)(\s*)(?<time>[\d\.:]+)(\s*)(?<logLevel>\w+)(\s*)(?<pid>\d+)[\s-]+(?<log>.*)'
ENV LOGASSEMBLE '%logLevel%,%log%,<dateTime>%year%-%month%-%day% %time%'
ENV GATEWAYTOKEN '185D673C1B648BCEB45C0C01C09154BB'
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.191.b12-1.el7_6.x86_64

COPY ssh /root/.ssh
RUN chmod 400 /root/.ssh/id_rsa

RUN yum install -y git openssh && \
  yum clean all &&  rm -rf /var/cache/yum

ADD bootstrap.sh /bootstrap.sh
ENTRYPOINT bash /bootstrap.sh
