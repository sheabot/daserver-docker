#!/bin/sh

ionice -c 3 nmbd -D

exec ionice -c 3 smbd -FS --no-process-group < /dev/null
