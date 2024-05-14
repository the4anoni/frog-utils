#!/bin/bash
if [ $UID -ne 0 ]; then
    echo "This script needs to be run under root user"
    exit 1
fi
rm -rf /tmp/frog-utils
cd /tmp
git clone https://github.com/the4anoni/frog-utils
run-parts /tmp/frog-utils/scripts/
rm -rf /tmp/frog-utils
