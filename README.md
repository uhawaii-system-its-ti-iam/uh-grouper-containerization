# Overview
Deploy a Grouper stack to Podman containers using Internet2 Grouper images.

A GitLab pipeline performs the image builds and saves them to the GitLab repo 
and a Portainer webhook triggers stack deployment.

Stack features:
 - Grouper images
 - Logrotate image
 - Rootless deployment (future)

# Upgrading Grouper
The following files need to be updated. When changing Grouper versions, reset 
the build id suffix to 0.

- .gitlab-ci.yml
- portainer/stack.yml

# Triggering a Build
Any commits that are pushed to the project's main branch on GitLab will trigger
a build.

# Triggering Stack Deployments
A Portainer webhook registered with the GitLab project will trigger stack 
deployment if the portainer/stack.yml on the main branch is changed.

To ensure consistent image naming across GitLab and Portainer, the following 
files need to be updated to reference the same build id suffix:

- .gitlab-ci.yml - increment the build id suffix
- portainer/stack.yml - increment the build id suffix for both image names

Commit/push to origin/main the changes to trigger a build and deploy. This 
requires the Portainer webhooks to be set up properly in GitLab.

# Grouper Deployment Settings by Environment
By convention the stack name format is: grouper-env where env is dev, test, 
prod, etc. Stack names are defined in Portainer.
