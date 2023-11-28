# logrorate/Dockerfile - configure the logrotate image
#
# Features include daily log rotation and email to the IAM team.
#
# To verify that cron is running on Rocky Linux not running systemd:
# $ ps aux | grep cron
#
# The commented-out "RUN ls" statements below are for debugging.

FROM rep90.pvt.hawaii.edu:5001/iam/uh-grouper/logrotate-grouper:latest

ENV GROUPER_USER=root
ENV GROUPER_HOME="/home/grouper"
ENV GROUPER_LOGS=/opt/grouper/logs

ENV LOGROTATE_CONFIG=${HOME}/etc/logrotate.conf
ENV LOGROTATE_WRAPPER=${HOME}/bin/logrotate-wrapper.sh
ENV LOGROTATE_CRONJOB=/etc/cron.d/logrotate-cronjob

RUN echo "Value of grouper home is ( $GROUPER_HOME )."

RUN yum update -y && yum install -y mailx logrotate cronie

# Set up home directory.
RUN mkdir -p ${GROUPER_HOME}
RUN chown ${GROUPER_USER}:${GROUPER_USER} ${GROUPER_HOME}
RUN chmod -R 0750 ${GROUPER_HOME}

# Maps volume mounted by the Grouper containers for their logs.
RUN mkdir -p ${GROUPER_LOGS}
RUN mkdir -p ${GROUPER_LOGS}
RUN chmod -R 0750 ${GROUPER_LOGS}

COPY .mailrc ${GROUPER_HOME}/.mailrc
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