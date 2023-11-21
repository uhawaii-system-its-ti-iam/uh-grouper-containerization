## Dockerfile

ENV USER=root
ENV HOME=/home/grouper
ENV APP_LOGS=/opt/grouper/logs

FROM rep90.pvt.hawaii.edu:5001/iam/uh-grouper/logrotate-grouper:1.0.0

ENV LOGROTATE_CONFIG=${HOME}/etc/logrotate.conf
ENV LOGROTATE_WRAPPER=${HOME}/bin/logrotate-wrapper.sh
ENV MAILTO="its-iam@lists.hawaii.edu"
ENV SCHEDULE="0 0 * * * ${LOGROTATE_WRAPPER}"
ENV CRONTAB="/var/spool/cron/grouper"
ENV TMP_WORK_FILE="/tmp/build/cronjob_settings.tmp"

# Directories and permissions.
RUN mkdir -p ${HOME}
#RUN chmod -R 750 ${HOME}
#RUN mkdir -p ${APP_LOGS}
#RUN chmod -R 750 ${APP_LOGS}
#RUN chown ${USER}:${USER} ${CRONTAB}
#RUN chmod +x ${LOGROTATE_WRAPPER}
#
#COPY .mailrc /${HOME}/.mailrc
#COPY logrotate.conf ${LOGROTATE_CONFIG}
#COPY logrotate-wrapper.sh ${LOGROTATE_WRAPPER}
#
## CRON settings.
#RUN echo "MAILTO=${MAILTO}" > ${TMP_WORK_FILE} && \
#    echo "${SCHEDULE}" >> ${TMP_WORK_FILE} && \
#    crontab -u ${USER} ${TMP_WORK_FILE}
