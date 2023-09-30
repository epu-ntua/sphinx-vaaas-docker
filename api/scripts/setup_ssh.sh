#!/usr/bin/env bash
set -Eeuo pipefail
#killall ssh
echo "fixing sshd_config file..."
if [ ! -f "/etc/ssh/sshd_config" ]; then
  cp /sshd_config /etc/ssh/sshd_config
else
  rm /etc/ssh/sshd_config
  cp /sshd_config /etc/ssh/sshd_config
fi
/etc/init.d/ssh restart
