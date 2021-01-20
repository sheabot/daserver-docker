IMAGE := sheabot/daserver-samba

ALPINE := y

include ../Makefile.target

.PHONY: run-alpine run-test

# TODO: Update path to private directory
run-alpine: build
	docker run -it --rm \
		-p 137:137/udp \
		-p 138:138/udp \
		-p 139:139 \
		-p 445:445 \
		-v "$(shell pwd)/private:/var/lib/samba/private" \
		-v /mnt/raid:/mnt/raid \
		$(IMAGE):alpine

# Use this to set passwords in the tdb on the host
#
# Set password:
# 	echo password | tee - | pdbedit -a -u daserver
# 	echo password | tee - | pdbedit -a -u sheabot
#
# View database:
# 	pdbedit -Lw
run-test: build
	docker run -it --rm \
		-p 137:137/udp \
		-p 138:138/udp \
		-p 139:139 \
		-p 445:445 \
		-v "$(shell pwd)/private:/var/lib/samba/private" \
		-v /mnt/raid:/mnt/raid \
		--entrypoint="/bin/sh" \
		$(IMAGE):alpine
