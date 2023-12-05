# Grouper Logrotate
## Overview
By design all Grouper and Tomcat logs are saved on the host. Leverage this fact
to implement a Logrotate Grouper image to rotate and compress the logs for the
Grouper stack. Email will be sent if a problem is encountered.
## Setup
 - Edit .mailrc to specify the mail proxy server.
 - Edit logrotate-cronjob to specify the email recipient.
