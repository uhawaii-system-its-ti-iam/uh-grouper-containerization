# Grouper
Utilizes podman and Portainer for conterization and orchestration.

## Triggering a Build

Any commits pushed to the project on GitLab will trigger a build.

## Triggering a Deploy
A) Since we are using the free version of Portainer two files must be changed to trigger a build.

**.gitlab-ci.yml** - increment the DEPLOY_TAG value (8 to 9 below)

    DEPLOY_TAG: $CI_REGISTRY:5001/iam/uh-grouper/grouper:4.1.6-8

**portainer/stack.yml** - increment the image name (8 to 9 below, matching above)

    image: &grouper_image rep90.pvt.hawaii.edu:5001/iam/uh-grouper/grouper:4.1.6-8

B) Commit the above changes and push them up to GitLab will trigger a build and deploy.

## Older Notes
podman build . --build-arg GROUPER_VERSION=4.1.2 --tag rep90.pvt.hawaii.edu:5001/iam/uh-grouper/grouper:4.1.6