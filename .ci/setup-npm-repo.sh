#!/usr/bin/env bash

set -e

GCLOUD_NPM_REPO=https://us-central1-npm.pkg.dev/bubuild/s02-bubuild

echo Adding authentication information to .npmrc
echo "registry=${GCLOUD_NPM_REPO}/" > .npmrc
echo "${GCLOUD_NPM_REPO#https:}/:_authToken=$(gcloud auth print-access-token)" >> .npmrc
echo "${GCLOUD_NPM_REPO#https:}/:always-auth=true" >> .npmrc