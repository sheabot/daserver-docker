.PHONY: all clean build push run-alpine run-test

IMAGE := sheabot/daserver-avahi

all:
	$(MAKE) build

clean:
	docker rmi $(IMAGE):alpine || true

build:
	docker build -f Dockerfile.alpine --tag $(IMAGE):alpine .

push:
	docker push $(IMAGE):alpine

run-alpine: build
	docker run -it --rm \
		--net=host \
		$(IMAGE):alpine

run-test: build
	docker run -it --rm \
		--net=host \
		--entrypoint="/bin/sh" \
		$(IMAGE):alpine
