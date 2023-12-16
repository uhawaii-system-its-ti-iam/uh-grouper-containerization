ARG GROUPER_VERSION
ARG DEPLOYMENT_CN

FROM docker.io/i2incommon/grouper:${GROUPER_VERSION} as install

ENV DEPLOYMENT_CN=${DEPLOYMENT_CN}

COPY /src/main/docker/slashRoot/ /

RUN echo "2 DEPLOYMENT_CN value is: ${DEPLOYMENT_CN}"

# Debug
RUN printenv

RUN chown tomcat /opt/tomcat/bin/self-signed-cert.sh
RUN /opt/tomcat/bin/self-signed-cert.sh
