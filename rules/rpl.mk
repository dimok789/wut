LIBPATHS  := -L$(WUT_ROOT)/lib
CFLAGS    := -I$(WUT_ROOT)/include -ffreestanding -Qn
CXXFLAGS  := $(CFLAGS)
LDFLAGS   := -nostartfiles -T $(WUT_ROOT)/rules/rpl.ld -Wl,-q -z common-page-size=64 -z max-page-size=64 -lcoreinit -lcrt -Wl,-wrap,__eabi
ELF2RPL   := $(WUT_ROOT)/bin/elf2rpl

include $(WUT_ROOT)/rules/base.mk

%.rpx: %.elf
	@echo "[RPX] $(notdir $@)"
	@$(ELF2RPL) $(BUILDDIR)/$(notdir $<) $@
