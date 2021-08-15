#!/bin/sh

# Remove state
rm -rf /var/run/avahi-daemon

avahi-daemon
