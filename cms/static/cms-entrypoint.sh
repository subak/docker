#!/usr/bin/env bash

set -ue

CONTENT_REPO=${CONTENT_REPO:-''}
APP_REPO=${APP_REPO:-''}
HTML_REPO=${HTML_REPO:-''}

CONTENT_REPO_BRANCH=${CONTENT_REPO_BRANCH:-'master'}
APP_REPO_BRANCH=${APP_REPO_BRANCH:-'master'}
HTML_REPO_BRANCH=${HTML_REPO_BRANCH:-'master'}

if [ ! -e .ssh/id_rsa ]; then
  echo "${ID_RSA}" > .ssh/id_rsa
  chmod 600 .ssh/id_rsa
fi

if [ -n "${CONTENT_REPO}" ]; then
  if [ -e content ]; then
    cd content
    git pull
    cd ../
  else
    git clone -b ${CONTENT_REPO_BRANCH} ${CONTENT_REPO} content
  fi
fi

if [ -n "${APP_REPO}" ]; then
  if [ -e app ]; then
    cd app
    git pull
    cd ../
  else
    git clone -b ${APP_REPO_BRANCH} ${APP_REPO} app
  fi
fi

if [ -n "${HTML_REPO}" ]; then
  if [ -e html ]; then
    cd html
    git pull
    cd ../
  else
    git clone -b ${HTML_REPO_BRANCH} ${HTML_REPO} html
  fi
fi

. app/bin/env.sh
export APP=app

mkdir -pv public
find public/* -maxdepth 0 -print0 | xargs -0 rm -rfv
publish.sh public global

h2o "$@"
