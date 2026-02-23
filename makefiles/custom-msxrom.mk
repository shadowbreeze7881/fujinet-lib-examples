# I don't know which one we are going to use, the disk version or the rom

# COMPILE FLAGS

################################################################
# DISK creation

SUFFIX = .com
ROM_TASKS += .create-rom
#VICE_HOME := $(dir $(shell which xvic))

ROM_FILE = $(DIST_DIR)/$(PROGRAM).rom

.create-rom:
#	@which dsktool > /dev/null 2>&1 ; \
#	if [ $$? -eq 0 ] ; then \
#		echo "creating $(DISK_FILE) from program $(PROGRAM_TGT)" ; \
#		if [ -f "$(DISK_FILE)" ] ; then \
#			rm "$(DISK_FILE)" ; \
#		fi ; \
#	    dsktool C 720 $(DISK_FILE) ; \
#	    dsktool A $(DISK_FILE) $(DIST_DIR)/$(PROGRAM_TGT)$(SUFFIX) ; \
#		rm $(DIST_DIR)/$(PROGRAM_TGT)$(SUFFIX)  ; \
#	else \
#		echo -e "\nERROR! You must install dsktool from https://github.com/nataliapc/MSX_devs/tree/master/dsktool to create msx disks\n" ; \
#		exit 1 ; \
#	fi
