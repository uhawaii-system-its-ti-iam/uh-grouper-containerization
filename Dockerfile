ARG GROUPER_VERSION

FROM i2incommon/grouper:${GROUPER_VERSION} as install

COPY /src/main/docker/slashRoot/ /