
CC        := zcc
AR        := z80asm
CFLAGS    := +$(CURRENT_TARGET) -subtype=$(SUBTYPE) $(CREATE_APP)
# ASFLAGS   :=
ASMEXT    := .asm

INCC_ARG  := -I
INCS_ARG  := -I
