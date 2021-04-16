#!/bin/sh

# Remove pidfile
rm -f /var/run/dasd.pid

python /dasd/dasd --action start --cfg /dasd/dasd.cfg
