IMAGE := sheabot/daserver-minidlna

ALPINE := y

include ../Makefile.target

.PHONY: run-alpine run-test

# NOTE: --net=host is required to advertise outside the container
run-alpine: build
	docker run -it --rm \
		--net=host \
		-v /mnt/raid:/mnt/raid \
		$(IMAGE):alpine

run-test: build
	docker run -it --rm \
		--net=host \
		-v /mnt/raid:/mnt/raid \
		--entrypoint="/bin/sh" \
		$(IMAGE):alpine
