TARGET   := ../bin/elf2rpl
SOURCE   := .
INCLUDE  := ../common

CXX      := g++

CFILES   := $(foreach dir,$(SOURCE),$(wildcard $(dir)/*.cpp))
INCLUDES := $(foreach dir,$(INCLUDE),-I$(dir))

CFLAGS   := -O2 -Wall --std=c++14
LDFLAGS  := -lz

all: $(TARGET)

clean:
	@echo "[RM] $(notdir $(TARGET))"
	@rm -rf $(TARGET)
	@rm -rf ../$(TARGET)

install: all
	@echo Installing $(TARGET)
	@cp $(TARGET) $(WUT_ROOT)/bin/$(TARGET)

$(TARGET): $(CFILES)
	@echo "[CXX] $(notdir $<)"
	@$(CXX) $(CFLAGS) $(INCLUDES) $< -o $@ $(LDFLAGS)
