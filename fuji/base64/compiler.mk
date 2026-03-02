# sets the compiler and C args according to the target
$(info current target in COMPILER.MK is $(CURRENT_TARGET))
ifeq ($(CURRENT_TARGET),coco)

-include compiler-cmoc.mk

else ifeq ($(CURRENT_TARGET),apple2gs)

-include compiler-orca.mk

else ifeq ($(CURRENT_TARGET),msx)

SUBTYPE := msxdos
-include compiler-z88dk.mk 

else ifeq ($(CURRENT_TARGET),msxrom)

SUBTYPE := rom 
CREATE_APP := -create-app 
-include compiler-z88dk.mk

else

-include compiler-cc65.mk

endif

$(info at the end of COMPILER.MK)
