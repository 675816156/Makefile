
LIB_ALL :=
CFLAGS := -c

LIB_ALL := a/liba.a b/libb.a c/libc.a main/libmain.a
SUBDIR := a b c main

get_existent_mk = $(shell set -e; [ -e $(1)/Makefile ] && echo "$(1)/Makefile")
include $(foreach DIR,$(SUBDIR),$(call get_existent_mk,$(DIR)))

NLIB := $(foreach LIB,$(LIB_ALL), \
    $(shell \
	  if [ ! -e $$(dirname $(LIB))/Makefile ]; then \
        echo $(LIB); \
      fi \
    ) \
)

$(warning $(NLIB) $(notdir $(NLIB)) $(dir $(NLIB)))

ifneq ($(NLIB),)
BINARY_DIR := bin_a bin_b bin
$(NLIB):
	@echo copying $@
	mkdir -p $(dir $@)
	-find $(BINARY_DIR) -name $(notdir $@) -exec cp -f {} $(dir $@) \;
endif

all: $(LIB_ALL)
	gcc $(LIB_ALL) -o run.elf

clean:
	rm -rf a/liba.a b/libb.a c/libc.a main/libmain.a
	rm -rf run.elf

.PHONY: all clean
