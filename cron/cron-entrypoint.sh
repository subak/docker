#!/bin/bash

if [ -n "$AUTH_DATA" ]; then
  echo $AUTH_DATA > /root/.docker/config.json
fi

touch /var/spool/cron/crontabs/root

if [ -n "$1" ]; then
  args=("$@")
  argn=$#

  for i in $(seq $argn)
  do
    echo "${args[$i-1]}" >> /var/spool/cron/crontabs/root
  done
fi

cp /var/spool/cron/crontabs/root /tmp/root.txt
printenv | cat - /tmp/root.txt | tee /var/spool/cron/crontabs/root
chmod 600 /var/spool/cron/crontabs/root
crond -f
