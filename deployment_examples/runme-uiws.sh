#!/bin/sh

# podman pull hawaii/grouper-ui:latest

podman run -d --rm --privileged \
    --name grouper_uiws \
    -p "8443:8443" \
    -e GROUPER_DATABASE_URL="jdbc:mysql://DATABASE_HOST:PORT/DATABASE_NAME?CharSet=utf8&useUnicode=true&characterEncoding=utf8&useSSL=false" \
    -e GROUPER_DATABASE_USERNAME="DATABASE_USER_NAME" \
    -e GROUPER_DATABASE_PASSWORD="DATABASE_PASSWORD" \    
    -e PAC4J_ENABLED="true" \
    -e PAC4J_GROUPERCONTEXTURL="https://GROUPER_SERVER_URL/grouper" \
    -e GROUPER_MORPHSTRING_ENCRYPT_KEY="MORPH_STRING_ENCRYPT_KEY_HERE" \
    -e GROUPERUI_CONFIGURATIONEDITOR_SOURCEADDRESSES="0.0.0.0/32" \
    -e GROUPER_LOG_TO_HOST="true" \
	-v /etc/pki/tls/certs/grouper-dev.pvt.hawaii.edu.pem:/etc/pki/tls/certs/grouper-dev.pvt.hawaii.edu.pem \
	-v /etc/pki/tls/certs/certificate-chain-InC.pem:/etc/pki/tls/certs/certificate-chain-InC.pem \
	-v /etc/pki/tls/private/grouper-dev.pvt.hawaii.edu.key:/etc/pki/tls/private/grouper-dev.pvt.hawaii.edu.key \
    hawaii/grouper-uiws
