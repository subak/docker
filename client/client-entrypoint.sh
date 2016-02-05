#!/usr/bin/env bash

set -eu

echo "${SSH_ID_RSA}" > /root/.ssh/id_rsa
chmod 600 /root/.ssh/id_rsa
echo "${SSH_ID_RSA_PUB}" > /root/.ssh/id_rsa.pub
echo "${SSH_ID_RSA_PUB}" > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"

echo "${PROFILE}" > /root/.profile

/usr/sbin/sshd "${@}"