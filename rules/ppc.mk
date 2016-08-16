LIBPATHS  := -L$(WUT_ROOT)/lib
CFLAGS    := -I$(WUT_ROOT)/include -ffreestanding
CXXFLAGS  := $(CFLAGS)
LDFLAGS   := -nostartfiles

include $(WUT_ROOT)/rules/base.mk

%.rpx: %.elf
	@$(STRIP) $< -o $(BUILDDIR)/$(notdir $<)
