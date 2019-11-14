#!/bin/bash

set -eux -o pipefail

echo "Installing docker version $DOCKER_VERSION"
apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL "https://download.docker.com/linux/ubuntu/gpg" | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-get install -y "docker-ce=$DOCKER_VERSION" "docker-ce-cli=$DOCKER_VERSION" containerd.io

# Work around https://github.com/docker/for-linux/issues/813. Start, but do *NOT* enable on startup.
systemctl start docker
