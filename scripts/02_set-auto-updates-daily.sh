#!/bin/bash
if [ $UID -ne 0 ]; then
    echo "This script needs to be run under root user"
    exit 1
fi
wget https://raw.githubusercontent.com/the4anoni/frog-utils/master/files/alpine-auto-update.sh -O /etc/periodic/daily/alpine-auto-update.sh
chmod +x /etc/periodic/daily/alpine-auto-update.sh
exit 0
