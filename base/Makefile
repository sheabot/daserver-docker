.PHONY: all clean build push run-alpine run-ubuntu

IMAGE := sheabot/daserver-base

all:
	$(MAKE) build
	$(MAKE) push

clean:
	docker rmi $(IMAGE):alpine || true
	docker rmi $(IMAGE):ubuntu || true

build:
	docker build -f Dockerfile.alpine --tag $(IMAGE):alpine .
	docker build -f Dockerfile.ubuntu --tag $(IMAGE):ubuntu .

push:
	docker push sheabot/daserver-base:alpine
	docker push sheabot/daserver-base:ubuntu

run-alpine:
	docker run -it --rm $(IMAGE):alpine

run-ubuntu:
	docker run -it --rm $(IMAGE):ubuntu
