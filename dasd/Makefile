IMAGE := sheabot/daserver-dasd

ALPINE := y

include ../Makefile.target

.PHONY: run-alpine run-test

COMMAND := python /dasd/dasd --action start --cfg /dasd/dasd.cfg

run-alpine: build
	docker run -it --rm \
		-v "$(shell pwd)/dasd:/dasd" \
		-v $(HOME)/.ssh:/home/dasd/.ssh \
		-v /mnt/sshfs:/mnt/sshfs:shared \
		-v /mnt/raid:/mnt/raid \
		$(IMAGE):alpine \
		$(COMMAND)

run-test: build
	docker run -it --rm \
		-v "$(shell pwd)/dasd:/dasd" \
		-v $(HOME)/.ssh:/home/dasd/.ssh \
		-v /mnt/sshfs:/mnt/sshfs:shared \
		-v /mnt/raid:/mnt/raid \
		$(IMAGE):alpine \
		/bin/sh
