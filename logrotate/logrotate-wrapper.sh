#!/bin/sh

# Application-specific wrapper.
# Grouper

LOGROTATE=/usr/sbin/logrotate
PROG_NAME=`/bin/basename ${LOGROTATE}`

LOGROTATE_DIR=${HOME}/etc
LOGROTATE_CONF=${LOGROTATE_DIR}/logrotate.conf
LOGROTATE_STATUS=${LOGROTATE_DIR}/logrotate.status

LOG_DIR=${HOME}/grouper/logs

# Debugging invocation (uncomment)
#
#cd ${LOG_DIR}
#${LOGROTATE} -d -s ${LOGROTATE_STATUS} ${LOGROTATE_CONF}
#exit 0

# Production invocation.
#
cd ${LOG_DIR}
${LOGROTATE} -s ${LOGROTATE_STATUS} ${LOGROTATE_CONF} >/dev/null 2>&1
# verbose, for debugging
#echo "${PROG_NAME}: Hostname - ${HOSTNAME}: Context - ${CONTAINER_STACK_CONTEXT}"; echo
#${LOGROTATE} -v -s ${LOGROTATE_STATUS} ${LOGROTATE_CONF}

EXITVALUE=$?
if [ $EXITVALUE != 0 ]; then
    echo "WARNING ${PROG_NAME} for ${CONTAINER_STACK_CONTEXT} exited abnormally with [${EXITVALUE}]"
fi
exit 0
