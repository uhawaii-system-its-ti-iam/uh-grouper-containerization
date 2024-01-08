#!/bin/bash
# opt/tomcat/bin/self-signed-cert.sh - create the container's self-signed cert
#
# This cert will only be used by the F5.
#
# For the chmod that makes this file executable see the Dockerfile for each of
# the Grouper services.
echo "Enter opt/tomcat/bin/self-signed-cert.sh"
echo "RUN opt/tomcat/bin/self-signed-cert.sh"

#sudo removed for testing purposes
openssl req -new -x509 -sha256 -newkey rsa:4096 -nodes -keyout /etc/pki/tls/private/cert.key \
                 -days 7332 -out /etc/pki/tls/certs/cert.pem \
                 -subj "${CONTAINER_CERT_SUBJECT}"

echo "Exit opt/tomcat/bin/self-signed-cert.sh - status: ${?}"
