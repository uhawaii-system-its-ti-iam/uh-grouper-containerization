# Grouper
Utilizes Podman and Portainer for containerization and orchestration.

## Upgrading Grouper
The following files need to be updated in order for the Grouper version to match the image
names.  When change Grouper versions, reset the DEPLOY_TAG to 1.

- build.args
- .gitlab-ci.yml
- portainer/stack

## Triggering a Build

Any commits pushed to the project on GitLab will trigger a build.

## Triggering a Deploy
A) Since we are using the free version of Portainer two files must be changed to trigger a build.

**.gitlab-ci.yml** - increment the DEPLOY_TAG value (8 to 9 below)

    DEPLOY_TAG: $CI_REGISTRY:5001/iam/uh-grouper/grouper:4.1.6-8

**portainer/stack.yml** - increment DEPLOY_TAG to match above.

    image: &grouper_image rep90.pvt.hawaii.edu:5001/iam/uh-grouper/grouper:4.1.6-8

B) Commit/push to origin the above changes to trigger a build and deploy.
