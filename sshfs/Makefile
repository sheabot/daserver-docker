IMAGE := sheabot/daserver-sshfs

ALPINE := y

include ../Makefile.target

.PHONY: run-alpine

run-alpine: build
	docker run -it --rm \
		--device /dev/fuse \
		--cap-add SYS_ADMIN \
		--security-opt apparmor:unconfined \
		-v "$(HOME)/.ssh:/root/.ssh:ro" \
		-v /mnt/sshfs:/mnt/sshfs:shared \
		$(IMAGE):alpine
