ARG GROUPER_VERSION
ARG DEPLOYMENT_CN

FROM docker.io/i2incommon/grouper:${GROUPER_VERSION} as install

COPY /src/main/docker/slashRoot/ /

ENV CERT_SUBJECT_CN=$DEPLOYMENT_CN

# Debug
RUN echo $CERT_SUBJECT_CN
RUN printenv

RUN chown tomcat /opt/tomcat/bin/self-signed-cert.sh
RUN /opt/tomcat/bin/self-signed-cert.sh
