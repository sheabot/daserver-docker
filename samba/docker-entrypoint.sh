#!/bin/sh

# HACK: Fix permissions on tmpfs over samba socket directory
#       This should be done in docker-compose.yml, but there is a bug
#       https://github.com/docker/cli/issues/1285
chmod 0700 /var/lib/samba/private/msg.sock

exec smbd --foreground --no-process-group --debug-stdout < /dev/null
