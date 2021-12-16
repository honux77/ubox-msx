TARGET := game

include ../../config.env

CODE := 0x4000
# leaves 222 bytes for AKM player buffer
DATA := 0xc0de

OUTDIR := ../../bin
TMPDIR := ../build
OBJS := $(patsubst %.c,$(TMPDIR)/%.rel,$(wildcard *.c)) $(TMPDIR)/akm.rel
UBOX_LIBS := $(wildcard ../../lib/*.lib)
LIBS := -lubox -lspman -lmplayer -lap

CC := sdcc
AS := sdasz80
AR := sdcclib
CHKSIZE := ../../tools/chksize
CFLAGS := -mz80 --Werror -I../../include -I../generated --fsigned-char --std-sdcc99 --opt-code-speed $(EXTRA_CFLAGS)
LDFLAGS := -L../../lib -L. --no-std-crt0 --fomit-frame-pointer

default:
	$(error Please use the Makefile from root directory)

all: $(TMPDIR)/$(TARGET).rom
	@$(CHKSIZE) $(ROM_MAX) 4000 $(TMPDIR)/$(TARGET).map
	@cp $(TMPDIR)/$(TARGET).rom $(OUTDIR)

openmsx: all
	openmsx -carta $(OUTDIR)/$(TARGET).rom -machine msx1

$(TMPDIR)/%.rel: %.c
	$(CC) $(CFLAGS) $(LDFLAGS) -c $< -o $@

$(TMPDIR)/%.rel: %.z80
	$(AS) -g -o $@ $<

$(TMPDIR)/akm.rel: akm.z80 song.asm effects.asm
	rasm akm.z80 -o $(TMPDIR)/akm -s -sl -sq
	Disark --sourceProfile sdcc --symbolFile $(TMPDIR)/akm.sym --src16bitsValuesInHex --src8bitsValuesInHex --undocumentedOpcodesToBytes $(TMPDIR)/akm.bin $(TMPDIR)/akm_sdcc.asm
	$(AS) -g -o $@ $(TMPDIR)/akm_sdcc.asm

$(TMPDIR)/$(TARGET).rom: $(OBJS) $(TMPDIR)/crt0.rel $(UBOX_LIBS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(LIBS) --code-loc $(CODE) --data-loc $(DATA) $(TMPDIR)/crt0.rel $(OBJS) -o $(TMPDIR)/$(TARGET).ihx
	hex2bin -e bin -p 00 -l $(ROM_MAX) $(TMPDIR)/$(TARGET).ihx
	@cp $(TMPDIR)/$(TARGET).bin $(TMPDIR)/$(TARGET).rom

clean:
	rm -f $(TMPDIR)/*
	rm -f $(OUTDIR)/$(TARGET).rom

.PHONY: all clean

include Makefile.deps
