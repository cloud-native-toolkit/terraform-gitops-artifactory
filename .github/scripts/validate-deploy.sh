#!/usr/bin/env bash

GIT_REPO=$(cat git_repo)
GIT_TOKEN=$(cat git_token)

mkdir -p .testrepo

git clone https://${GIT_TOKEN}@${GIT_REPO} .testrepo

cd .testrepo || exit 1

find . -name "*"

NAMESPACE="gitops-artifactory"

if [[ ! -f "argocd/2-services/active/artifactory.yaml" ]]; then
  echo "ArgoCD config missing"
  exit 1
else
  echo "ArgoCD config found"
fi

cat argocd/2-services/active/artifactory.yaml

if [[ ! -f "payload/2-services/artifactory/values.yaml" ]]; then
  echo "Application values not found"
  exit 1
else
  echo "Application values found"
fi

cat payload/2-services/artifactory/values.yaml

cd ..
rm -rf .testrepo
