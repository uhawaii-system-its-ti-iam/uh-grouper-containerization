#!/bin/sh

podman run -it --rm --privileged \
    --name grouper_gsh \
    --workdir "/opt/grouper/grouperWebapp/WEB-INF/bin" \
    -p "8080:8080" \
    -e GROUPER_DATABASE_URL="jdbc:mysql://DATABASE_HOST:PORT/DATABASE_NAME?CharSet=utf8&useUnicode=true&characterEncoding=utf8&useSSL=false" \
    -e GROUPER_DATABASE_USERNAME="DATABASE_USER_NAME" \
    -e GROUPER_DATABASE_PASSWORD="DATABASE_PASSWORD" \
    -e PAC4J_ENABLED="true" \
    -e PAC4J_GROUPERCONTEXTURL="https://GROUPER_SERVER_URL/grouper" \
    -e GROUPER_MORPHSTRING_ENCRYPT_KEY="MORPH_STRING_ENCRYPT_KEY_HERE" \
    -e GROUPER_LOG_TO_HOST="true" \
    --entrypoint sh \
    rep90.pvt.hawaii.edu:5001/iam/uh-grouper/grouper-ui
