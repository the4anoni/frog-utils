#!/bin/bash
if [ $UID -ne 0 ]; then
    echo "This script needs to be run under root user"
    exit 1
fi
apk add fail2ban
# Make sure fail2ban will run automatically on boot
rc-update add fail2ban
# Start f2b service now
rc-service fail2ban start
# Let's enable rules for ssh
wget https://raw.githubusercontent.com/the4anoni/frog-utils/master/files/jaild-alpine-ssh.local -O /etc/fail2ban/jail.d/alpine-ssh.local
while true; do
    echo "Did you set "PasswordAuthentication" to NO in sshd_config? (y/n)"
    read -e PA < /dev/tty
    PA_=$(echo "$PA" | tr '[:upper:]' '[:lower:]')
    if [ "$PA_" = n ]; then
        exit 0
    elif [ "$PA_" = y ]; then
        wget https://raw.githubusercontent.com/the4anoni/frog-utils/master/files/alpine-sshd-key.local -O /etc/fail2ban/filter.d/alpine-sshd-key.conf
        curl -s 'https://raw.githubusercontent.com/the4anoni/frog-utils/master/files/jaild-alpine-ssh-key.local' >> /etc/fail2ban/jail.d/alpine-ssh.local
        exit 0
    else
        echo "You didn't made valid choice."
    fi
done
