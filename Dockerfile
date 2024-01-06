ARG GROUPER_VERSION

FROM docker.io/i2incommon/grouper:${GROUPER_VERSION} as install

COPY /src/main/docker/slashRoot/ /

# Debug
RUN echo "Dockerfile"
RUN printenv

RUN chown tomcat /opt/tomcat/bin/self-signed-cert.sh
RUN /opt/tomcat/bin/self-signed-cert.sh
