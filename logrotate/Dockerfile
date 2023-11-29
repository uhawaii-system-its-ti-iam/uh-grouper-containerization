# logrorate/Dockerfile - configure the logrotate image
#
# Features include daily log rotation and email to the IAM team.
#
# To verify that cron is running on Rocky Linux not running systemd:
# $ ps aux | grep cron

ARG LOGROTATE_IMAGE

# Start a new image build based on an existing image.
FROM ${LOGROTATE_IMAGE}

# Define the needed environmental variables for new image build.
ENV GROUPER_USER=root
ENV GROUPER_HOME=/home/grouper
ENV GROUPER_LOGS=/opt/grouper/logs

ENV LOGROTATE_CONFIG=${GROUPER_HOME}/etc/logrotate.conf
ENV LOGROTATE_WRAPPER=${GROUPER_HOME}/bin/logrotate-wrapper.sh
ENV LOGROTATE_CRONJOB=/etc/cron.d/logrotate-cronjob

RUN echo "Grouper home: $GROUPER_HOME"

# Augment the minimal Rocky Linux OS.
RUN yum update -y && yum install -y mailx logrotate cronie

# Set up the home directory.
RUN mkdir -p ${GROUPER_HOME}
RUN chown ${GROUPER_USER}:${GROUPER_USER} ${GROUPER_HOME}
RUN chmod -R 0750 ${GROUPER_HOME}

# Map the Grouper logs volume.
RUN mkdir -p ${GROUPER_LOGS}
RUN chmod -R 0750 ${GROUPER_LOGS}

COPY .mailrc ${GROUPER_HOME}/.mailrc

COPY logrotate.conf ${LOGROTATE_CONFIG}
COPY logrotate-wrapper.sh ${LOGROTATE_WRAPPER}
RUN chmod +x ${LOGROTATE_WRAPPER}
COPY logrotate-cronjob ${LOGROTATE_CRONJOB}
RUN chmod 0644 ${LOGROTATE_CRONJOB}

# cron will be started up in portainer/stack.yml