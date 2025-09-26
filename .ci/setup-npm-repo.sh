#!/usr/bin/env bash

GCLOUD_NPM_REPO=https://us-central1-npm.pkg.dev/bubuild/s02-bubuild

set -e

cd `dirname $0`/..

echo Adding authentication information to .npmrc
echo "registry=${GCLOUD_NPM_REPO}/" > .npmrc
echo "${GCLOUD_NPM_REPO#https:}/:_authToken=$(gcloud auth print-access-token)" >> .npmrc
echo "${GCLOUD_NPM_REPO#https:}/:always-auth=true" >> .npmrc