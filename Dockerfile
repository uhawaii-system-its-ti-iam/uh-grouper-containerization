ARG GROUPER_VERSION

FROM docker.io/i2incommon/grouper:${GROUPER_VERSION} as install

COPY /src/main/docker/slashRoot/ /

#RUN chmod +x /opt/tomcat/bin/self-signed-cert.sh
