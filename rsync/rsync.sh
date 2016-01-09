#!/bin/bash

cat <<EOF > /etc/rsyncd.conf
log file = /dev/stdout

[${VOLUME_NAME}]
    uid = root
    gid = root
    path = ${VOLUME}
    read only = no 
    use chroot = no
EOF

exec /usr/bin/rsync --no-detach --daemon --config /etc/rsyncd.conf "$@"
