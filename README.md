# Overview
Deploy a Grouper stack to Podman containers using Internet2 Grouper images.

A GitLab pipeline performs the image builds and saves them to the GitLab repo 
and a Portainer webhook triggers stack deployment.

Stack features:
 - Grouper images
 - Logrotate image
 - Rootless deployment

# Upgrading Grouper
The following files need to be updated. When changing Grouper versions, reset 
the "deployment id" to 0.

- build.args
- .gitlab-ci.yml
- portainer/stack.yml

# Triggering a Build
Any commits that are pushed to the project's main branch on GitLab will trigger
a build.

# Triggering Stack Deployments
A Portainer webhook registered with the GitLab project will trigger stack 
deployment if the portainer/stack.yml on the main branch is changed.

To ensure consistent image naming across GitLab and Portainer, the following 
files need to be updated to reference the same "deployment id":

- .gitlab-ci.yml - increment the DEPLOY_ID
- portainer/stack.yml - increment the suffix deployment id for both image names

Commit/push to origin/main the changes to trigger a build and deploy. This 
requires the Portainer webhooks to be set up properly in GitLab.

# Grouper Deployment Settings by Environment
By convention the stack name format is: grouper-env where env is dev, test, 
prod, etc. Stack names are defined in Portainer.
