# Generic CC65 TARGETS makefile++
#
# Set the TARGETS and PROGRAM values as required.
# See makefiles/build.mk for details on directory structure for src files and how to add custom extensions to the build.

#TARGETS = atari apple2 c64
TARGETS = msx msxrom
PROGRAM := base64
FUJINET_LIB_EX_ROOT_DIR := /home/sven86/Dropbox/Fujinet_Stuff/Programming_Stuff/fujinet-msx/fujinet-lib-examples
FUJINET_LIB_EX_MKFILES_DIR := $(FUJINET_LIB_EX_ROOT_DIR)/makefiles

# Define the path and directory of the current makefile
# MKFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
# MKFILE_DIR := $(dir $(MKFILE_PATH))

# $(info The makefile is in: $(MKFILE_DIR))
# $(info Two levels above is $(shell cd ../..; pwd))
# $(info Absolute root path is $(FUJINET_LIB_EX_ROOT))

SUB_TASKS := clean disk test release
.PHONY: all help $(SUB_TASKS)

all:
	@for target in $(TARGETS); do \
		echo "-------------------------------------"; \
		echo "Building $$target"; \
		echo "-------------------------------------"; \
		$(MAKE) --no-print-directory -f build.mk CURRENT_TARGET=$$target PROGRAM=$(PROGRAM) FUJINET_LIB_EX_ROOT_DIR=$(FUJINET_LIB_EX_ROOT_DIR) FUJINET_LIB_EX_MKFILES_DIR=$(FUJINET_LIB_EX_MKFILES_DIR) $(MAKECMDGOALS); \
	done

$(SUB_TASKS): _do_all
$(SUB_TASKS):
	@:

_do_all: all

help:
	@echo "Makefile for $(PROGRAM)"
	@echo ""
	@echo "Available tasks:"
	@echo "all       - do all compilation tasks, create app in build directory"
	@echo "clean     - remove all build artifacts"
	@echo "disk      - generate platform specific disk versions of application (PO/ATR etc)"
	@echo "test      - run application in emulator for given platform."
	@echo "            specific platforms may expose additional variables to run with"
	@echo "            different emulators, see makefiles/custom-<platform>.mk"
	@echo "release   - create a release of the executable in the dist/ dir"
