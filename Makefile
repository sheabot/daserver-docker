TARGETS := \
	base \
	avahi \
	dasd \
	minidlna \
	samba \
	sshfs

TOPTARGETS := all push clean
.PHONY: $(TOPTARGETS) $(TARGETS)

$(TOPTARGETS):
	$(foreach var,$(TARGETS),$(MAKE) -C $(var) $@;)
