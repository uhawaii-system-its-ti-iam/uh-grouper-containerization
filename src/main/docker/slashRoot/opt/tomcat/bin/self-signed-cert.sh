#!/bin/bash
# opt/tomcat/bin/self-signed-cert.sh - generate the image's self-signed cert
#
# This cert will only be used by the F5.
#
# For the chmod that makes this file executable see the Dockerfile for each of
# the Grouper services.

# Debug
echo "Enter opt/tomcat/bin/self-signed-cert.sh"

echo "Environment: ${ENV}"
if [ "$ENV" = "dev" ]; then
    CERT_SUBJECT_TEST="/C=US/ST=Hawaii/O=University of Hawaii/CN=idp-future-dev.its.hawaii.edu"
elif [ "$ENV" = "prod" ]; then
    CERT_SUBJECT_TEST="/C=US/ST=Hawaii/O=University of Hawaii/CN=idp-test.its.hawaii.edu"
else
    echo "The value of ENV is not {$ENV} is not expected - status: 1"
    #exit 1
fi

# Debug
printenv
CERT_SUBJECT="/C=US/ST=Hawaii/O=University of Hawaii/CN=idp-future-dev.its.hawaii.edu"

echo "RUN opt/tomcat/bin/self-signed-cert.sh"

sudo openssl req -new -x509 -sha256 -newkey rsa:4096 -nodes -keyout /etc/pki/tls/private/cert.key \
                 -days 7332 -out /etc/pki/tls/certs/cert.pem \
                 -subj "${CERT_SUBJECT}"

echo "Exit opt/tomcat/bin/self-signed-cert.sh - status: ${?}"
