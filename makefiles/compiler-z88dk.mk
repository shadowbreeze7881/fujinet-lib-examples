
CC        := zcc
AR        := z80asm
CFLAGS    := +$(CURRENT_TARGET) -subtype=$(SUBTYPE)
# ASFLAGS   :=
ASMEXT    := .asm

INCC_ARG  := -I
INCS_ARG  := -I
