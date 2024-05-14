#!/bin/bash
# Remove frog emoji from Bash prompt
echo "" > /home/frog/.bash_profile

if [ $UID -ne 0 ]; then
    echo "To make this work on root account, you need to run this script again under root account"
    exit 1
fi

echo "" > /root/.bash_profile
mv /etc/profile.d/color_prompt.sh.disabled /etc/profile.d/color_prompt.sh
# You may also want to edit /etc/motd
exit 0