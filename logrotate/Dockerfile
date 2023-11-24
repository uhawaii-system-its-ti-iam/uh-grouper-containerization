## Dockerfile

ENV USER=root
ENV HOME=/home/grouper
#ENV APP_LOGS=/opt/grouper/logs
ENV CRONTAB=/var/spool/cron/logrotate.cron

FROM rep90.pvt.hawaii.edu:5001/iam/uh-grouper/logrotate-grouper:1.0.0

ENV LOGROTATE_CONFIG=${HOME}/etc/logrotate.conf
ENV LOGROTATE_WRAPPER=${HOME}/bin/logrotate-wrapper.sh

COPY .mailrc /${HOME}/.mailrc
COPY logrotate.conf ${LOGROTATE_CONFIG}
COPY logrotate-wrapper.sh ${LOGROTATE_WRAPPER}
COPY logrotate.cron ${CRONTAB}

RUN rm -fr /var/cache/yum/* && yum clean all
RUN yum update -y && yum install -y mailx logrotate

RUN echo "1" ${HOME}
RUN echo "2" ${APP_LOGS}
RUN echo "3" ${USER}
RUN echo "4" ${CRONTAB}

RUN mkdir -p ${HOME}
RUN chmod -R 750 ${HOME}
RUN #mkdir -p ${APP_LOGS}
RUN #chmod -R 750 ${APP_LOGS}
RUN chmod +x ${LOGROTATE_WRAPPER}
RUN chown ${USER}:${USER} ${CRONTAB}
