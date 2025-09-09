#!/usr/bin/env bash

echo Adding authentication information to .npmrc
echo "registry=${GCLOUD_NPM_REPO}" > .npmrc
echo "${GCLOUD_NPM_REPO#https:}/:_authToken=$(gcloud auth print-access-token)" >> .npmrc
echo "${GCLOUD_NPM_REPO#https:}/:always-auth=true" >> .npmrc