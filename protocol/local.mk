# swc: protocol/local.mk

dir := protocol

PROTOCOL_EXTENSIONS =           \
    $(dir)/wayland-drm.xml      \
    $(dir)/xserver.xml

$(dir)_TARGETS := $(PROTOCOL_EXTENSIONS:%.xml=%-protocol.c) \
                  $(PROTOCOL_EXTENSIONS:%.xml=%-server-protocol.h)

$(dir)/%-protocol.c: $(dir)/%.xml
	$(call quiet,GEN,$(WAYLAND_SCANNER)) code < $< > $@

$(dir)/%-server-protocol.h: $(dir)/%.xml
	$(call quiet,GEN,$(WAYLAND_SCANNER)) server-header < $< > $@

include common.mk
