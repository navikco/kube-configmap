#!/bin/bash

set -e

if [[ $# -eq 1 ]]
then

    ENVIRONMENT=${1}
    echo "ENVIRONMENT :::>>> ${ENVIRONMENT}"

else
    echo "Usage: . ./setupKubeLandSecrets.sh <<ENVIRONMENT>>"
    exit 1
fi

# Create KUBE Secrets
# ------------------

echo "CREATING :::>>> K8S Secret & Credentials ::: [[[ ${ENVIRONMENT} ]]]..."

kubectl create -f ../cluster/kube-secrets/kube-${ENVIRONMENT}-secrets.yml

echo "CREATED :::>>> K8S Secret & Credentials ::: [[[ ${ENVIRONMENT} ]]]..."

kubectl get secrets --namespace=ews-${ENVIRONMENT}

kubectl describe secret kube-${ENVIRONMENT}-secrets --namespace=kube-${ENVIRONMENT}

exit 0
