# Dockerfile-logrotate

# Passed from stack.yml.
ARG USER
ARG HOME
ARG APP_LOGS
ARG LOGROTATE_IMAGE

FROM ${LOGROTATE_IMAGE}

ENV LOGROTATE_CONFIG=${HOME}/etc/logrotate.conf
ENV LOGROTATE_WRAPPER=${HOME}/bin/logrotate-wrapper.sh

ENV MAILTO="its-iam@lists.hawaii.edu"
ENV SCHEDULE="0 0 * * * ${LOGROTATE_WRAPPER}"
ENV CRONTAB=/var/spool/cron/grouper

ENV TMP_WORK_FILE:/tmp/build/cronjob_settings.tmp

COPY ../mailx/.mailrc /${HOME}/.mailrc

# Create a log directory so that the volume mapping provides
# logrotate access to the application logs.
RUN mkdir -p ${APP_LOGS}
RUN chmod -R 750 ${APP_LOGS}

COPY ../logrotate/logrotate.conf ${LOGROTATE_CONFIG}
COPY ../logrotate/logrotate-wrapper.sh ${LOGROTATE_WRAPPER}

# Adjust file access.
RUN chown ${USER}:${USER} ${CRONTAB}
RUN chmod +x ${LOGROTATE_WRAPPER}

# Add the cron schedule.
RUN echo 'MAILTO="${MAILTO}"' > ${TMP_WORK_FILE}
RUN echo '${SCHEDULE}' >> ${TMP_WORK_FILE}
RUN crontab -u ${USER} ${TMP_WORK_FILE}
