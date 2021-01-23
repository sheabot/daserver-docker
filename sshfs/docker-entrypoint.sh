#!/bin/sh

# Default
IDENTITY_FILE="${IDENTITY_FILE:-/root/.ssh/id_rsa}"
UID="${UID:-0}"
GID="${GID:-0}"
PORT="${PORT:-22}"
MOUNT_POINT="${MOUNT_POINT:-/mnt/sshfs}"
SERVER_ALIVE_INTERVAL=15
SERVER_ALIVE_COUNT_MAX=3

if [ -z "$REMOTE" ]; then
    echo "error: Must set REMOTE"
    exit 1
fi

# Sync and unmount on shutdown
cleanup() {
    sync
    umount -vl "$MOUNT_POINT"
    exit 0
}
trap cleanup SIGHUP SIGINT SIGQUIT SIGABRT SIGTERM

exec sshfs -f \
    -o reconnect \
    -o ServerAliveInterval="$SERVER_ALIVE_INTERVAL" \
    -o ServerAliveCountMax="$SERVER_ALIVE_COUNT_MAX" \
    -o UserKnownHostsFile=/dev/null \
    -o StrictHostKeyChecking=no \
    -o allow_other \
    -o auto_unmount \
    -o IdentityFile="$IDENTITY_FILE" \
    -o uid="$UID" \
    -o gid="$GID" \
    -o port="$PORT" \
    "$REMOTE" "$MOUNT_POINT"
