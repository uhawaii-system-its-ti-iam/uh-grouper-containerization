#!/bin/bash
# opt/tomcat/bin/self-signed-cert.sh - generate the image's self-signed cert
#
# For the chmod that makes this file executable see the Dockerfile for each of
# the Grouper services.

# The host domain is defined in the Portainer stack.
SUBJECT="/C=US/ST=Hawaii/O=University of Hawaii/CN=${CONTAINER_HOST_DOMAIN}"

# Per Grouper specification.
CERT_DIR="/opt/grouper/certs/client"

openssl req -x509 -newkey rsa:4096 -keyout $CERT_DIR/cert.key -out $CERT_DIR/cert.pem -sha256 -days 7332 -nodes -subj "${SUBJECT}"

# Referenced in the tomcat/server.xml file.
#FILE="/opt/keypairs/keystore"

# In the future we anticipate using the PEM.
#openssl req -x509 -sha256 -nodes -days 7332 -newkey rsa:4096 -keyout $FILE.key -out $FILE.crt -subj "${SUBJECT}"

# For now we will continue using the P12.
#openssl pkcs12 -export -out $FILE.p12 -inkey $FILE.key -in $FILE.crt -passout pass:

echo "Exit self-signed cert script with status: ${?}."
