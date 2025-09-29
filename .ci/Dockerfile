# syntax=docker/dockerfile:1
# check=error=true

ARG CLOUD_SDK_VERSION=515.0.0-stable
FROM gcr.io/google.com/cloudsdktool/cloud-sdk:${CLOUD_SDK_VERSION}

# Install system packages
RUN apt-get update && apt-get install --yes curl apt-utils

# Install NVM and Node.js
ARG NVM_DIR=/usr/local/.nvm
ARG NODE_VERSION=22.20.0
ARG NVM_VERSION=0.40.3

RUN mkdir -p $NVM_DIR && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v$NVM_VERSION/install.sh | bash && \
    bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use $NODE_VERSION && nvm alias default $NODE_VERSION"

ENV NVM_DIR=$NVM_DIR
ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

# Install Github Runner
ARG GH_RUNNER_HOME=/github-runner
ARG GH_RUNNER_VERSION=2.328.0
ARG GH_RUNNER_SHA256=01066fad3a2893e63e6ca880ae3a1fad5bf9329d60e77ee15f2b97c148c3cd4e

RUN set -ex && \
    mkdir -p ${GH_RUNNER_HOME} && \
    cd ${GH_RUNNER_HOME} && \
    curl -o actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz \
         -L https://github.com/actions/runner/releases/download/v${GH_RUNNER_VERSION}/actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz && \
    echo "${GH_RUNNER_SHA256} actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz" | sha256sum -c && \
    tar xzf ./actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz && \
    rm ./actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz
    
# Install runner's dependencies
RUN ${GH_RUNNER_HOME}/bin/installdependencies.sh && \
    chown -R cloudsdk ${GH_RUNNER_HOME}

USER cloudsdk

# Create gcloud config directory and copy credentials
RUN mkdir -p ~/.config/gcloud
COPY application_default_credentials.json ~/.config/gcloud/application_default_credentials.json
RUN gcloud auth activate-service-account --key-file=~/.config/gcloud/application_default_credentials.json

ARG GH_BASE_URL=https://github.com/s02
ARG GH_PROJECT_NAME=bubuild
ENV GH_RUNNER_HOME=${GH_RUNNER_HOME}
ENV GH_BASE_URL=${GH_BASE_URL}
ENV GH_PROJECT_NAME=${GH_PROJECT_NAME}

WORKDIR ${GH_RUNNER_HOME}

RUN ${GH_RUNNER_HOME}/config.sh --unattended --url ${GH_BASE_URL}/${GH_PROJECT_NAME} --token ACCL5ABPQPDSL5GDIVNWOWDI3KIEC

CMD ["${GH_RUNNER_HOME}/run.sh"]