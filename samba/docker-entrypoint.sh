#!/bin/sh

# HACK: Fix permissions on tmpfs over samba socket directory
#       This should be done in docker-compose.yml, but there is a bug
#       https://github.com/docker/cli/issues/1285
chmod 0700 /var/lib/samba/private/msg.sock

ionice -c 3 nmbd -D

exec ionice -c 3 smbd -FS --no-process-group < /dev/null
