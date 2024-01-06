#!/bin/sh

# Application-specific wrapper.
# Grouper

LOGROTATE=/usr/sbin/logrotate
SCRIPT_NAME=`/bin/basename ${LOGROTATE}`

LOGROTATE_DIR=${HOME}/etc
LOGROTATE_CONF=${LOGROTATE_DIR}/logrotate.conf
LOGROTATE_STATUS=${LOGROTATE_DIR}/logrotate.status

LOG_DIR=${HOME}/grouper/logs

cd ${LOG_DIR}

# Debugging invocation (uncomment).
#${LOGROTATE} -d -s ${LOGROTATE_STATUS} ${LOGROTATE_CONF}
#printenv
#exit 0

# Standard invocation.
${LOGROTATE} -s ${LOGROTATE_STATUS} ${LOGROTATE_CONF} >/dev/null 2>&1

# Verbose invocation.
#echo "${SCRIPT_NAME}: Container hostname - ${HOSTNAME}: Host VM - ${CONTAINER_HOST_DOMAIN}"; echo
#${LOGROTATE} -v -s ${LOGROTATE_STATUS} ${LOGROTATE_CONF}

EXITVALUE=$?
if [ $EXITVALUE != 0 ]; then
    echo "WARNING ${SCRIPT_NAME} for ${CONTAINER_HOST_DOMAIN} exited abnormally with [${EXITVALUE}]"
fi
exit 0
