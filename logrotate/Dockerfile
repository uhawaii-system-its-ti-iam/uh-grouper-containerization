## logrorate/Dockerfile - configure the logrotate image

#ENV USER=root
#ENV HOME=/home/grouper
#ENV APP_LOGS=/opt/grouper/logs
#ENV CRONTAB=/var/spool/cron/logrotate.cron

FROM rep90.pvt.hawaii.edu:5001/iam/uh-grouper/logrotate-grouper:latest
RUN yum update -y && yum install -y mailx logrotate cronie

#ENV LOGROTATE_CONFIG=${HOME}/etc/logrotate.conf
#ENV LOGROTATE_WRAPPER=${HOME}/bin/logrotate-wrapper.sh

#COPY .mailrc /${HOME}/.mailrc
COPY .mailrc /home/grouper/.mailrc
RUN ls -l /home/grouper/.mailrc

#COPY logrotate.conf ${LOGROTATE_CONFIG}
COPY logrotate.conf /home/grouper/etc/logrotate.conf
RUN ls -l /home/grouper/etc/logrotate.conf

#COPY logrotate-wrapper.sh ${LOGROTATE_WRAPPER}
COPY logrotate-wrapper.sh /home/grouper/bin/logrotate-wrapper.sh
RUN ls -l /home/grouper/bin/logrotate-wrapper.sh

#COPY logrotate.cron ${CRONTAB}
COPY logrotate.cron /etc/cron.d/logrotate-cron
RUN chmod 0644 /etc/cron.d/logrotate-cron
RUN ls -l /etc/cron.d/logrotate-cron

#RUN mkdir -p ${HOME}
#RUN chmod -R 750 ${HOME}
#RUN #mkdir -p ${APP_LOGS}
#RUN #chmod -R 750 ${APP_LOGS}
#RUN chmod +x ${LOGROTATE_WRAPPER}
#RUN chown ${USER}:${USER} ${CRONTAB}

RUN mkdir -p /home/grouper
RUN chown root:root /home/grouper
RUN chmod -R 750 /home/grouper
RUN mkdir -p /opt/grouper/logs
RUN chmod -R 750 /opt/grouper/logs
RUN chmod +x /home/grouper/bin/logrotate-wrapper.sh
