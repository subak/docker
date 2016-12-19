#!/usr/bin/env bash

set -eu

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"

echo "${PROFILE}" > /root/.profile

echo "${AUTHORIZED_KEYS}" > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

echo "${SSH_ENVIRONMENT}" > /root/.ssh/environment

if [ -n "${STONE_OPTION}" ]; then
  stone ${STONE_OPTION} &
fi

/usr/sbin/sshd "${@}"