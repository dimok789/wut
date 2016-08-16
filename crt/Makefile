include $(CURDIR)/../rules/ppc.mk

CFILES  := $(wildcard *.c)
SFILES  := $(wildcard *.S)
OFILES  := $(CFILES:.c=.o) $(SFILES:.S=.o)
OUTPUT  := libcrt
CFLAGS  += -O2 -Wall -std=c11 -I$(WUT_ROOT)/include

all: $(OUTPUT).a $(OFILES)

clean:
	@echo "[RM] $(notdir $(OUTPUT))"
	@rm -f $(OFILES) $(OUTPUT).a

install: all
	@mkdir -p ../lib
	@cp -f *.a ../lib

$(OUTPUT).a: $(OFILES)

.PHONY: all clean
