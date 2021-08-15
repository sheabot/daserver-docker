IMAGE := sheabot/daserver-avahi

ALPINE := y

include ../Makefile.target

.PHONY: run-alpine run-ubuntu

run-alpine: build
	docker run -it --rm \
		--net=host \
		$(IMAGE):alpine

run-test: build
	docker run -it --rm \
		--net=host \
		--entrypoint="/bin/sh" \
		$(IMAGE):alpine
