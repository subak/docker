#!/bin/sh

SSHD_ROOT_PASSWORD=${SSHD_ROOT_PASSWORD:-sshd}
echo "root:${SSHD_ROOT_PASSWORD}" | chpasswd

/usr/sbin/sshd $@
