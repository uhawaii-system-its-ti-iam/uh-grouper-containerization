ARG GROUPER_VERSION
ARG CONTAINER_HOST_DOMAIN

FROM docker.io/i2incommon/grouper:${GROUPER_VERSION} as install

COPY /src/main/docker/slashRoot/ /

ENV CONTAINER_HOST_DOMAIN=$CONTAINER_HOST_DOMAIN

RUN chown tomcat /opt/tomcat/bin/self-signed-cert.sh
RUN /opt/tomcat/bin/self-signed-cert.sh
