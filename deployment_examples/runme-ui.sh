#!/bin/sh

# podman pull hawaii/grouper-ui:latest

podman run -d --privileged \
    --name grouper_ui \
    -p "8443:8443" \
    -e GROUPER_DATABASE_URL="jdbc:mysql://DATABASE_HOST:PORT/DATABASE_NAME?CharSet=utf8&useUnicode=true&characterEncoding=utf8&useSSL=false" \
    -e GROUPER_DATABASE_USERNAME="DATABASE_USER_NAME" \
    -e GROUPER_DATABASE_PASSWORD="DATABASE_PASSWORD" \
    -e PAC4J_ENABLED="true" \
    -e PAC4J_GROUPERCONTEXTURL="https://GROUPER_SERVER_URL/grouper" \
    -e GROUPER_MORPHSTRING_ENCRYPT_KEY="MORPH_STRING_ENCRYPT_KEY_HERE" \
    -e GROUPER_UI_CONFIGURATION_EDITOR_SOURCEIPADDRESSES="0.0.0.0/32" \
    -e GROUPER_LOG_TO_HOST="true" \
    -e GROUPER_UI_GROUPER_AUTH="false" \
    -v /etc/pki/tls/certs/grouper-dev.pvt.hawaii.edu.pem:/etc/pki/tls/certs/grouper-dev.pvt.hawaii.edu.pem \
    -v /etc/pki/tls/certs/certificate-chain-InC-exp-2024-10-05.pem:/etc/pki/tls/certs/certificate-chain-InC.pem \
    -v /etc/pki/tls/private/grouper-dev.pvt.hawaii.edu.key:/etc/pki/tls/private/grouper-dev.pvt.hawaii.edu.key \
    -v $PWD/conf/tomcat/server.xml:/opt/tomee/conf/server.xml \
    -v $PWD/logs/ws:/opt/grouper/logs \
    hawaii/grouper-ui
