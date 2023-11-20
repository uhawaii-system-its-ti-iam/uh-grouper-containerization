## Dockerfile
#
# Passed from stack.yml.
ARG USER
ARG HOME
ARG APP_LOGS

FROM rep90.pvt.hawaii.edu:5001/iam/uh-grouper/logrotate-grouper:1.0.0

ENV LOGROTATE_CONFIG=${HOME}/etc/logrotate.conf \
    LOGROTATE_WRAPPER=${HOME}/bin/logrotate-wrapper.sh \
    MAILTO="its-iam@lists.hawaii.edu" \
    SCHEDULE="0 0 * * * ${LOGROTATE_WRAPPER}" \
    CRONTAB=/var/spool/cron/grouper \
    TMP_WORK_FILE=/tmp/build/cronjob_settings.tmp

COPY .mailrc /${HOME}/.mailrc
COPY logrotate.conf ${LOGROTATE_CONFIG}
COPY logrotate-wrapper.sh ${LOGROTATE_WRAPPER}

# Log directories and permissions.
RUN mkdir -p ${APP_LOGS}
RUN chmod -R 750 ${APP_LOGS}
RUN chown ${USER}:${USER} ${CRONTAB}
RUN chmod +x ${LOGROTATE_WRAPPER}

# CRON settings.
RUN echo "MAILTO=${MAILTO}" > ${TMP_WORK_FILE} && \
    echo "${SCHEDULE}" >> ${TMP_WORK_FILE} && \
    crontab -u ${USER} ${TMP_WORK_FILE}
