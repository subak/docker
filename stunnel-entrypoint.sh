#!/usr/bin/env bash

set -eu

STUNNEL_CONF=${STUNNEL_CONF:-"$(cat /etc/stunnel/stunnel.conf)"}
STUNNEL_CERT=${STUNNEL_CERT:-"$(cat /etc/stunnel/server.crt)"}
STUNNEL_KEY=${STUNNEL_KEY:-"$(cat /etc/stunnel/server.key)"}
STUNNEL_CAFILE=${STUNNEL_CAFILE:-"$(cat /etc/stunnel/ca.crt)"}

echo "${STUNNEL_CERT}" > /etc/stunnel/server.crt
echo "${STUNNEL_KEY}" > /etc/stunnel/server.key
echo "${STUNNEL_CAFILE}" > /etc/stunnel/ca.crt

chmod 600 /etc/stunnel/server.key

echo "${STUNNEL_CONF}" | stunnel "${@}"