#!/bin/bash
# opt/tomcat/bin/self-signed-cert.sh - generate the image's self-signed cert
#
# This cert will only be used by the F5.
#
# For the chmod that makes this file executable see the Dockerfile for each of
# the Grouper services.

# Debug
printenv

# The host domain is defined in the Portainer stack.
#SUBJECT="/C=US/ST=Hawaii/O=University of Hawaii/CN=${DEPLOYMENT_CN}"
SUBJECT="/C=US/ST=Hawaii/O=University of Hawaii/CN=idp-future-dev.its.hawaii.edu"

echo "RUN opt/tomcat/bin/self-signed-cert.sh"

sudo openssl req -new -x509 -sha256 -newkey rsa:4096 -nodes -keyout /etc/pki/tls/private/cert.key \
                 -days 7332 -out /etc/pki/tls/certs/cert.pem \
                 -subj "${SUBJECT}"

echo "Exit opt/tomcat/bin/self-signed-cert.sh - status: ${?}"
