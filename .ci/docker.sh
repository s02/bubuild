#!/usr/bin/env bash
docker run --rm -ti \
  --mount=type=bind,src=$HOME/.config/gcloud,dst=/home/cloudsdk/.config/gcloud -- \
  frontend-domain-runner /bin/sh -c "$*"