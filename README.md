# Overview

Deploy a Grouper and Logrotate for Grouper stack. A GitLab pipeline performs 
the build and a Portainer webhook triggers the deployment of the stack. We are
using Podman rather than Docker given that we are deploying to RHEL VMs.

The portainer/stack.yml file defines the services that Portainer will deploy 
and manage. The images must already be in the repository.

 Be
sure to bump up the image file index deploy tag index by +1 here and in
the stack.yml file.

# Grouper
Utilizes Podman, GitLab and Portainer for containerization and orchestration.

## Upgrading Grouper
The following files need to be updated in order for the Grouper version to match 
the image names.  When changing Grouper versions, reset the DEPLOY_ID to 0.

- build.args
- .gitlab-ci.yml
- portainer/stack.yml

## Triggering a Build
Any commits that are pushed to the project's main branch on GitLab will trigger
a build.

## Triggering a Deploy
Image deployment by Portainer is triggered by pushing a change 
portainer/stack.yml to the project's main branch. Be sure that deployID is set
correctly across before pushing to main.

A) Two files must be changed. 

**.gitlab-ci.yml** - increment the DEPLOY_ID value (8 to 9 below)
Example:
    $CI_REGISTRY:5001/iam/uh-grouper/grouper:4.1.6-8

**portainer/stack.yml** - increment DEPLOY_ID to match above.
Example:
    &grouper_image rep90.pvt.hawaii.edu:5001/iam/uh-grouper/grouper:4.1.6-8

B) Commit/push to origin/main the changes to trigger a build and deploy.

Requires the Portainer webhooks to be set up properly.

## Grouper Deployment Settings by Environment

When deploying Grouper the various environments, a few configuration changes
will be needed:

- stack.yml
  - no changes required at this time. Environmental variables were moved to Portainer.
