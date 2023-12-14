ARG GROUPER_VERSION
ARG DEPLOYMENT_CN

FROM docker.io/i2incommon/grouper:${GROUPER_VERSION} as install

COPY /src/main/docker/slashRoot/ /

ENV DEPLOYMENT_CN=$DEPLOYMENT_CN

RUN chown tomcat /opt/tomcat/bin/self-signed-cert.sh
#RUN /opt/tomcat/bin/self-signed-cert.sh
