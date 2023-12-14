#!/bin/bash
# opt/tomcat/bin/self-signed-cert.sh - generate the image's self-signed cert
#
# For the chmod that makes this file executable see the Dockerfile for each of
# the Grouper services.

# The host domain is defined in the Portainer stack.
SUBJECT="/C=US/ST=Hawaii/O=University of Hawaii/CN=${CONTAINER_HOST_DOMAIN}"

# Per Grouper specification.
CERT_DIR="/opt/grouper/certs/client"

echo "Begin self-signed cert script. CN=${CONTAINER_HOST_DOMAIN}"

openssl req -x509 -newkey rsa:4096 -keyout $CERT_DIR/cert.key -out $CERT_DIR/cert.pem -sha256 -days 7332 -nodes -subj "${SUBJECT}"
openssl x509 -in $CERT_DIR/cert.pem -text -noout

echo "Exit self-signed cert script."
