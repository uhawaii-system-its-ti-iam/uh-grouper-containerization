# Conversion to Rootless
Support a rootless implementation for Podman deployments. The Internet2 Grouper
images will be modified by the following scripts:

The grouper project provides
 - /opt/container_files/docker-build-bin/containerDockerfileInstallPermissions.sh

Also included is a modified version of Jeff Williams' complementary script for 
aligning permissions.
 - podman/containerDockerfileInstallPermissions.sh