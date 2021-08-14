#!/usr/bin/env bash

GIT_REPO=$(cat git_repo)
GIT_TOKEN=$(cat git_token)

mkdir -p .testrepo

git clone https://${GIT_TOKEN}@${GIT_REPO} .testrepo

cd .testrepo || exit 1

find . -name "*"

NAMESPACE="gitops-artifactory"
SERVER_NAME="default"
NAME="artifactory"

if [[ ! -f "argocd/2-services/cluster/${SERVER_NAME}/base/${NAMESPACE}-${NAME}.yaml" ]]; then
  echo "ArgoCD config missing - argocd/2-services/cluster/${SERVER_NAME}/base/${NAMESPACE}-${NAME}.yaml"
  exit 1
fi

echo "ArgoCD config - argocd/2-services/cluster/${SERVER_NAME}/base/${NAMESPACE}-${NAME}.yaml"
cat "argocd/2-services/cluster/${SERVER_NAME}/base/${NAMESPACE}-${NAME}.yaml"

if [[ ! -f "payload/2-services/namespace/${NAMESPACE}/${NAME}/values.yaml" ]]; then
  echo "Application values not found - payload/2-services/namespace/${NAMESPACE}/${NAME}/values.yaml"
  exit 1
fi

echo "Application values - payload/2-services/namespace/${NAMESPACE}/${NAME}/values.yaml"
cat "payload/2-services/namespace/${NAMESPACE}/${NAME}/values.yaml"

if [[ ! -f "payload/2-services/namespace/${NAMESPACE}/${NAME}/values-${SERVER_NAME}.yaml" ]]; then
  echo "Server application values not found - payload/2-services/namespace/${NAMESPACE}/${NAME}/values-${SERVER_NAME}.yaml"
  exit 1
fi

echo "Server application values - payload/2-services/namespace/${NAMESPACE}/${NAME}/values-${SERVER_NAME}.yaml"
cat "payload/2-services/namespace/${NAMESPACE}/${NAME}/values-${SERVER_NAME}.yaml"

cd ..
rm -rf .testrepo
