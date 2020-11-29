.PHONY: all clean build push run-alpine run-test

IMAGE := sheabot/daserver-minidlna

all:
	$(MAKE) build

clean:
	docker rmi $(IMAGE):alpine || true

build:
	docker build -f Dockerfile.alpine --tag $(IMAGE):alpine .

push:
	docker push $(IMAGE):alpine

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
