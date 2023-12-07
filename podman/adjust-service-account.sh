#!/bin/bash
###############################################################################
#
#	adjust-service-account.sh
#	last updated 2018-12-21 Jeff Williams
#
#	Script adjusts uid/gid values for shibd, apache, tomcat to match
#	grouperShibd, grouperApache, and grouperTomcat on the vm host
#
#   Usage Notes: What I do is run this script during image building that
#                pulls the uids you want to use, create a group on the
#                localhost for them, then update the uid/gids throughout
#                the container to suit.
#
###############################################################################

export grouperDevsGid=${CONTAINER_SERVICE_ACCT_GID}
echo "grouperDevs:x:$grouperDevsGid:shibd,tomcat,apache" >> /etc/group

#find uid, gid for shibd, tomcat, and grouper users in the container
export apacheUid=`grep -i apache /etc/passwd | awk -F: '{print $3}'`
export apacheGid=`grep -i apache /etc/passwd | awk -F: '{print $4}'`
export shibdUid=`grep -i shibd /etc/passwd | awk -F: '{print $3}'`
export shibdGid=`grep -i shibd /etc/passwd | awk -F: '{print $4}'`
export tomcatUid=`grep -i tomcat /etc/passwd | awk -F: '{print $3}'`
export tomcatGid=`grep -i tomcat /etc/passwd | awk -F: '{print $4}'`

# reset uid:gids to match what's on the host
sed s/$tomcatUid:$tomcatGid/[grouperTomcat'sUID]:$grouperDevsGid/g /etc/passwd > /tmp/testPasswd; sed s/$shibdUid:$shibdGid/[grouperShibd'sUID]:$grouperDevsGid/g /tmp/testPasswd > /tmp/testPasswd0; sed s/$apacheUid:$apacheGid/[grouperApache'sUID]:$grouperDevsGid/g /tmp/testPasswd0 > /etc/passwd
#comment out for debugging
rm -f /tmp/testPasswd /tmp/testPasswd0
#chown everything by shibd to grouperShibd
find / -xdev -user `echo $shibdUid` -exec chown [grouperShibd's UID]:$grouperDevsGid {} \;
#chown everything by tomcat to grouperTomcat
find / -xdev -user `echo $tomcatUid` -exec chown [grouperTomcat's UID:$grouperDevsGid {} \;
#chown everything by apache to grouperApache
find / -xdev -user `echo $apacheUid` -exec chown [grouperApache's UID]:$grouperDevsGid {} \;