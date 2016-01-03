#!/usr/bin/env bash

set -ue

if [ ! -e .ssh/id_rsa ]; then
  echo "${ID_RSA}" > .ssh/id_rsa
  chmod 600 .ssh/id_rsa
fi

if [ -e cms ]; then
  cd cms
  git remote update
  git reset --hard origin/master
  cd ${APP}
  git remote update
  git reset --hard origin/master
  cd ../
else
  git clone ${CONTENT_REPO} cms
  cd cms
  if [ ! -e ${APP} ]; then
    git clone --depth 1 ${ENGINE_REPO} ${APP}
  fi
fi

. ${APP}/bin/env.sh

mkdir -pv ~/public
find ~/public/* -maxdepth 1 -print0 | xargs -0 rm -rfv
publish.sh ~/public global

cd ~

h2o "$@"
