.PHONY: all clean build push run-alpine run-test

IMAGE := sheabot/daserver-samba

all:
	$(MAKE) build

clean:
	docker rmi $(IMAGE):alpine || true

build:
	docker build -f Dockerfile.alpine --tag $(IMAGE):alpine .

push:
	docker push $(IMAGE):alpine

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
# 	echo password | tee - | pdbedit -a -u shea
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
