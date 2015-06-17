#!/bin/bash

SYNC_EX=${SYNC_EX:-'".git/"'}

mkdir -p /tmp/lsyncd
FILE=/tmp/lsyncd/lsyncd.$RANDOM.conf

cat <<EOF > $FILE
settings {
  nodaemon = true,
  delay = 0
}

sync {
  default.rsync,
  source = "$1",
  target = "$2",
  exclude = {$SYNC_EX},
  rsync = {
    compress = true,
    perms = true,
    protect_args = false
  }
}
EOF

lsyncd $FILE
