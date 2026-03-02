include fujinet-lib-experimental.mk

$(info Currently in common.mk)
VERSION_FILE := version.txt
ifeq (,$(wildcard $(VERSION_FILE)))
	VERSION_FILE =
	VERSION_STRING =
else
	VERSION_STRING := $(file < $(VERSION_FILE))
endif
