.PHONY: all clean build push run-alpine run-test

IMAGE := sheabot/daserver-avahi

all:
	$(MAKE) build
	$(MAKE) push

clean:
	docker rmi $(IMAGE):alpine || true

build:
	docker build -f Dockerfile.alpine --tag $(IMAGE):alpine .
	#docker build -f Dockerfile.ubuntu --tag $(IMAGE):ubuntu .

push:
	echo push
	#docker push sheabot/daserver-base:alpine
	#docker push sheabot/daserver-base:ubuntu

# NOTE: --net=host is required to advertise outside the container in which case
#       -p 5353:5353/udp is not required
run-alpine: build
	docker run -it --rm \
		--net=host \
		$(IMAGE):alpine

run-test: build
	docker run -it --rm \
		--net=host \
		--entrypoint="/bin/sh" \
		$(IMAGE):alpine
