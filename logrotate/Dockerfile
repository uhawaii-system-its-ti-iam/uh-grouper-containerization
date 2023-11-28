# logrorate/Dockerfile - configure the logrotate image
#
# Features include daily log rotation and email to the IAM team.
#
# To verify that cron is running on Rocky Linux not running systemd:
# $ ps aux | grep cron
#
# The commented-out "RUN ls" statements below are for debugging.

ENV USER=root
ENV HOME=/home/grouper
ENV LOGS=/opt/grouper/logs

ENV LOGROTATE_CONFIG=${HOME}/etc/logrotate.conf
ENV LOGROTATE_WRAPPER=${HOME}/bin/logrotate-wrapper.sh
ENV LOGROTATE_CRONJOB=/etc/cron.d/logrotate-cronjob

FROM rep90.pvt.hawaii.edu:5001/iam/uh-grouper/logrotate-grouper:latest
RUN yum update -y && yum install -y mailx logrotate cronie

# Set up home directory.
RUN mkdir -p ${HOME}
RUN chown ${USER}:${USER} ${HOME}
RUN chmod -R 0750 ${HOME}

# Maps volume mounted by the Grouper containers for their logs.
RUN mkdir -p ${LOGS}
RUN chmod -R 0750 ${LOGS}

COPY .mailrc ${HOME}/.mailrc
#RUN ls -l /home/grouper/.mailrc

COPY logrotate.conf ${LOGROTATE_CONFIG}
#RUN ls -l /home/grouper/etc/logrotate.conf

COPY logrotate-wrapper.sh ${LOGROTATE_WRAPPER}
#RUN ls -l /home/grouper/bin/logrotate-wrapper.sh
RUN chmod +x ${LOGROTATE_WRAPPER}

COPY logrotate-cronjob ${LOGROTATE_CRONJOB}
#RUN ls -l /etc/cron.d/logrotate-cronjob
RUN chmod 0644 ${LOGROTATE_CRONJOB}

# cron will be started up in portainer/stack.yml