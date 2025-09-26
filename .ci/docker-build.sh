#!/usr/bin/env bash

DIR=$PWD
cd $(dirname "$0")

docker build . -t frontend-domain-runner

cd "$DIR"