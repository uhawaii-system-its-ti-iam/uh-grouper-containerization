ARG GROUPER_VERSION
ARG DEPLOYMENT_CN
ARG Z_DEPLOYMENT_CN

FROM docker.io/i2incommon/grouper:${GROUPER_VERSION} as install

COPY /src/main/docker/slashRoot/ /

ENV DEPLOYMENT_CN=${DEPLOYMENT_CN}
ENV Z_DEPLOYMENT_CN=${Z_DEPLOYMENT_CN}
#ENV GROUPER_VERSION=${GROUPER_VERSION}

RUN echo "2 DEPLOYMENT_CN value is: ${DEPLOYMENT_CN}"
RUN echo "2 GROUPER_VERSION value is: ${GROUPER_VERSION}"
RUN printenv

RUN chown tomcat /opt/tomcat/bin/self-signed-cert.sh
RUN /opt/tomcat/bin/self-signed-cert.sh
