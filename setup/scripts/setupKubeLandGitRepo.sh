#!/bin/bash

set -e

if [[ $# -eq 2 ]]
then

    ENVIRONMENT=${1}
    echo "ENVIRONMENT :::>>> ${ENVIRONMENT}"

    GIT_BRANCH=${2}
    echo "GIT_BRANCH :::>>> ${GIT_BRANCH}"

else
    echo "Usage: . ./setupEWSGitRepo.sh <<ENVIRONMENT>> <<GIT_BRANCH>>"
    exit 1
fi

# Clone/Update EWS Config Repo
# ----------------------------

EWS_GIT_REPO_HOME_DIR=/opt/mw/apps/ews/config

echo "EWS_GIT_REPO_HOME_DIR ::: ${EWS_GIT_REPO_HOME_DIR}"
#ls -R ${EWS_GIT_REPO_HOME_DIR}/

cd ${EWS_GIT_REPO_HOME_DIR}/

if [[ -d "config-${ENVIRONMENT}" ]]; then


    echo "UPDATING :::>>> EWS Config Repo ::: [[[ ${ENVIRONMENT} ]]] : [[[ ${GIT_BRANCH} ]]]..."
    cd config-${ENVIRONMENT}
    git checkout .
    git clean -fd
    git checkout master
    git pull
    git checkout ${GIT_BRANCH}
    git pull
    echo "UPDATED :::>>> EWS Config Repo ::: [[[ ${ENVIRONMENT} ]]] : [[[ ${GIT_BRANCH} ]]]..."
else

    echo "CLONING :::>>> EWS Config Repo ::: [[[ ${ENVIRONMENT} ]]] : [[[ ${GIT_BRANCH} ]]]..."
    git clone ssh://git@bitbucket.dal.securustech.net:7999/mid/config-${ENVIRONMENT}.git
    cd config-${ENVIRONMENT}
    git checkout ${GIT_BRANCH}
    echo "CLONED :::>>> EWS Config Repo ::: [[[ ${ENVIRONMENT} ]]] : [[[ ${GIT_BRANCH} ]]]..."
fi

ls -al ${EWS_GIT_REPO_HOME_DIR}/config-${ENVIRONMENT}/

exit 0
