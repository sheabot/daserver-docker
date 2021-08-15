IMAGE := sheabot/daserver-base

ALPINE := y
UBUNTU := y

include ../Makefile.target

.PHONY: run-alpine run-ubuntu

run-alpine: build
	docker run -it --rm $(IMAGE):alpine

run-ubuntu: build
	docker run -it --rm $(IMAGE):ubuntu
