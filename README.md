# Grouper
Utilizes Podman, GitLab and Portainer for containerization and orchestration.

## Logrotate for Grouper

A logrotate image for Grouper is provided.

## Upgrading Grouper
The following files need to be updated in order for the Grouper version to match 
the image names.  When change Grouper versions, reset the DEPLOY_ID to 0.

- build.args
- .gitlab-ci.yml
- portainer/stack.yml

## Triggering a Build

Any commits that are pushed to the project on GitLab will trigger a build.

## Triggering a Deploy
A) Two files must be changed. 

Note that Portainer also needs to reference the appropriate project branch (main 
for the Dev environment).

**.gitlab-ci.yml** - increment the DEPLOY_ID value (8 to 9 below)
Example:
    $CI_REGISTRY:5001/iam/uh-grouper/grouper:4.1.6-8

**portainer/stack.yml** - increment DEPLOY_ID to match above.
Example:
    &grouper_image rep90.pvt.hawaii.edu:5001/iam/uh-grouper/grouper:4.1.6-8

B) Commit/push to origin the above changes to trigger a build and deploy.

Requires the Portainer webhooks to be set up properly.
