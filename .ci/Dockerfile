# syntax=docker/dockerfile:1
# check=error=true

ARG CLOUD_SDK_VERSION=515.0.0-stable
FROM gcr.io/google.com/cloudsdktool/cloud-sdk:${CLOUD_SDK_VERSION}

# Install system packages
RUN apt-get update && apt-get install --yes curl apt-utils

ARG GH_RUNNER_HOME=/github-runner
ARG GH_RUNNER_VERSION=2.323.0
ARG GH_RUNNER_SHA256=0dbc9bf5a58620fc52cb6cc0448abcca964a8d74b5f39773b7afcad9ab691e19
RUN set -ex && \
    mkdir -p ${GH_RUNNER_HOME} && \
    cd ${GH_RUNNER_HOME} && \
    curl -o actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz \
         -L https://github.com/actions/runner/releases/download/v${GH_RUNNER_VERSION}/actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz && \
    echo "${GH_RUNNER_SHA256} actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz" | sha256sum -c && \
    tar xzf ./actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz && \
    rm ./actions-runner-linux-x64-${GH_RUNNER_VERSION}.tar.gz

USER cloudsdk

#RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash \
#    source ~/.bashrc \
#    nvm install --lts \
#    nvm use --lts \
#    rm install.sh

#ARG GH_BASE_URL=https://github.com/s02
#ARG GH_PROJECT_NAME=bubuild
#ARG GH_TOKEN=ACCL5ABNZCWDL7IK5UGAOCTI22PAQ
#ENV GH_RUNNER_HOME=${GH_RUNNER_HOME}
#ENV GH_BASE_URL=${GH_BASE_URL}
#ENV GH_PROJECT_NAME=${GH_PROJECT_NAME}

#WORKDIR ${GH_RUNNER_HOME}

#CMD ["/bin/sh", "-c", "${GH_RUNNER_HOME}/config.sh --unattended --url ${GH_BASE_URL}/${GH_PROJECT_NAME} --token ${GH_TOKEN} && ${GH_RUNNER_HOME}/run.sh"]