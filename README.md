# Grouper
Utilizes Podman, GitLab and Portainer for containerization and orchestration.

## Configuring Logrotate for Grouper

The following files are used to configure the logrorate image build for Grouper:
 - logrotate/logrotate.conf - instructions
 - portainer/stack.yml - wiring

## Upgrading Grouper
The following files need to be updated in order for the Grouper version to match the image
names.  When change Grouper versions, reset the DEPLOY_TAG to 0.

- build.args
- .gitlab-ci.yml
- portainer/stack.yml

## Triggering a Build

Any commits pushed to the project on GitLab will trigger a build.

## Triggering a Deploy
A) Two files must be changed. 

Note that Portainer also needs to reference the appropriate project branch (main for the Dev environment).

**.gitlab-ci.yml** - increment the DEPLOY_TAG value (8 to 9 below)

    DEPLOY_TAG: $CI_REGISTRY:5001/iam/uh-grouper/grouper:4.1.6-8

**portainer/stack.yml** - increment DEPLOY_TAG to match above.

    image: &grouper_image rep90.pvt.hawaii.edu:5001/iam/uh-grouper/grouper:4.1.6-8

B) Commit/push to origin the above changes to trigger a build and deploy.
