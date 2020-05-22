#!/bin/bash

set -e

if [[ $# -eq 1 ]]
then

    ENVIRONMENT=${1}
    echo "ENVIRONMENT :::>>> ${ENVIRONMENT}"

else
    echo "Usage: . ./setupKubeLandConfigMaps.sh <<ENVIRONMENT>>"
    exit 1
fi

# Create EWS Secrets
# ------------------

echo "CREATING :::>>> KUBE K8S ConfigMap ::: [[[ ${ENVIRONMENT} ]]]..."

kubectl delete -f ../cluster/kube-config/ || true
kubectl create -f ../cluster/kube-config/

kubectl get configmaps --namespace=kube-${ENVIRONMENT}

echo "CREATED :::>>> KUBE K8S ConfigMap ::: [[[ ${ENVIRONMENT} ]]]..."


exit 0
