#!/bin/bash
# Fork of original Frog install_docker.sh script
if [ $UID -ne 0 ]; then
    echo "This script needs to be run under root user"
    exit 1
fi
apk upgrade --update
apk add docker docker-cli-compose
rc-update add docker
service docker start
# Make sure our containers do daily auto update.
mkdir -p /opt/watchtower
wget https://raw.githubusercontent.com/the4anoni/frog-utils/master/files/watchtower-compose.yaml -O /opt/watchtower/docker-compose.yaml
cd /opt/watchtower
sleep 30 # make sure docker daemon is running
docker compose up -d
exit 0
