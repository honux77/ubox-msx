;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module util
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ubox_put_tile
	.globl _strlen
	.globl _getHC
	.globl _put_text
	.globl _put_text_hc
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$strlen$0$0	= .
	.globl	G$strlen$0$0
	C$util.c$5$0_0$26	= .
	.globl	C$util.c$5$0_0$26
;util.c:5: inline int strlen(const uint8_t *text) {
;	---------------------------------
; Function strlen
; ---------------------------------
_strlen::
	C$util.c$7$1_0$26	= .
	.globl	C$util.c$7$1_0$26
;util.c:7: while (*text) { 
	ld	de, #0x0000
	ld	hl, #2
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
00101$:
	ld	a, (bc)
	or	a, a
	jr	Z,00103$
	C$util.c$8$2_0$27	= .
	.globl	C$util.c$8$2_0$27
;util.c:8: n++;
	inc	de
	C$util.c$9$2_0$27	= .
	.globl	C$util.c$9$2_0$27
;util.c:9: text++;
	inc	bc
	jr	00101$
00103$:
	C$util.c$11$1_0$26	= .
	.globl	C$util.c$11$1_0$26
;util.c:11: return n;
	ex	de,hl
	C$util.c$12$1_0$26	= .
	.globl	C$util.c$12$1_0$26
;util.c:12: }
	C$util.c$12$1_0$26	= .
	.globl	C$util.c$12$1_0$26
	XG$strlen$0$0	= .
	.globl	XG$strlen$0$0
	ret
	G$getHC$0$0	= .
	.globl	G$getHC$0$0
	C$util.c$14$1_0$29	= .
	.globl	C$util.c$14$1_0$29
;util.c:14: inline int getHC(const uint8_t *text) {
;	---------------------------------
; Function getHC
; ---------------------------------
_getHC::
	C$util.c$15$2_0$30	= .
	.globl	C$util.c$15$2_0$30
;util.c:15: int ret =  HC - strlen(text) / 2;
	pop	de
	pop	bc
	push	bc
	push	de
	ld	de, #0x0000
00104$:
	ld	a, (bc)
	or	a, a
	jr	Z,00106$
	inc	de
	inc	bc
	jr	00104$
00106$:
	ld	c, e
	ld	b, d
	bit	7, d
	jr	Z,00110$
	ld	c, e
	ld	b, d
	inc	bc
00110$:
	sra	b
	rr	c
	ld	a, #0x0f
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	C$util.c$16$1_0$29	= .
	.globl	C$util.c$16$1_0$29
;util.c:16: if (ret > 0) return ret;
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00132$
	xor	a, #0x80
00132$:
	jp	P, 00102$
	ld	l, c
	ld	h, b
	ret
00102$:
	C$util.c$17$1_0$29	= .
	.globl	C$util.c$17$1_0$29
;util.c:17: else return 0;
	ld	hl, #0x0000
	C$util.c$18$1_0$29	= .
	.globl	C$util.c$18$1_0$29
;util.c:18: }
	C$util.c$18$1_0$29	= .
	.globl	C$util.c$18$1_0$29
	XG$getHC$0$0	= .
	.globl	XG$getHC$0$0
	ret
	G$put_text$0$0	= .
	.globl	G$put_text$0$0
	C$util.c$20$1_0$35	= .
	.globl	C$util.c$20$1_0$35
;util.c:20: void put_text(uint8_t x, uint8_t y, const uint8_t *text)
;	---------------------------------
; Function put_text
; ---------------------------------
_put_text::
	C$util.c$22$1_0$35	= .
	.globl	C$util.c$22$1_0$35
;util.c:22: while (*text)
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	dec	iy
	dec	iy
	ld	e, 0 (iy)
00101$:
	ld	a, (bc)
	or	a, a
	ret	Z
	C$util.c$23$1_0$35	= .
	.globl	C$util.c$23$1_0$35
;util.c:23: ubox_put_tile(x++, y, *text++ + 128 - 31);
	inc	bc
	add	a, #0x61
	ld	h, a
	ld	d, e
	inc	e
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), e
	push	bc
	push	de
	push	hl
	inc	sp
	inc	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	push	de
	inc	sp
	call	_ubox_put_tile
	pop	af
	inc	sp
	pop	de
	pop	bc
	C$util.c$24$1_0$35	= .
	.globl	C$util.c$24$1_0$35
;util.c:24: }
	C$util.c$24$1_0$35	= .
	.globl	C$util.c$24$1_0$35
	XG$put_text$0$0	= .
	.globl	XG$put_text$0$0
	jr	00101$
	G$put_text_hc$0$0	= .
	.globl	G$put_text_hc$0$0
	C$util.c$26$1_0$37	= .
	.globl	C$util.c$26$1_0$37
;util.c:26: void put_text_hc(uint8_t y, const uint8_t *text)
;	---------------------------------
; Function put_text_hc
; ---------------------------------
_put_text_hc::
	dec	sp
	C$util.c$28$2_0$38	= .
	.globl	C$util.c$28$2_0$38
;util.c:28: int x = getHC(text);
	ld	hl, #4
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	C$util.c$15$1_0$37	= .
	.globl	C$util.c$15$1_0$37
;util.c:15: int ret =  HC - strlen(text) / 2;
	ld	bc, #0x0000
	ld	l, e
	ld	h, d
00104$:
	ld	a, (hl)
	or	a, a
	jr	Z,00106$
	inc	bc
	inc	hl
	jr	00104$
00106$:
	ld	l, c
	ld	h, b
	bit	7, b
	jr	Z,00114$
	ld	l, c
	ld	h, b
	inc	hl
00114$:
	ld	c, l
	ld	b, h
	sra	b
	rr	c
	ld	a, #0x0f
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	C$util.c$28$4_0$40	= .
	.globl	C$util.c$28$4_0$40
;util.c:28: int x = getHC(text);
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00147$
	xor	a, #0x80
00147$:
	jp	P, 00109$
	jr	00120$
00109$:
	ld	bc, #0x0000
	C$util.c$29$1_0$37	= .
	.globl	C$util.c$29$1_0$37
;util.c:29: while (*text)
00120$:
00101$:
	ld	a, (de)
	or	a, a
	jr	Z,00112$
	C$util.c$30$1_0$37	= .
	.globl	C$util.c$30$1_0$37
;util.c:30: ubox_put_tile(x++, y, *text++ + 128 - 31);
	inc	de
	add	a, #0x61
	ld	h, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), c
	inc	bc
	push	bc
	push	de
	push	hl
	inc	sp
	inc	iy
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	dec	iy
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	call	_ubox_put_tile
	pop	af
	inc	sp
	pop	de
	pop	bc
	jr	00101$
00112$:
	C$util.c$31$1_0$37	= .
	.globl	C$util.c$31$1_0$37
;util.c:31: }
	inc	sp
	C$util.c$31$1_0$37	= .
	.globl	C$util.c$31$1_0$37
	XG$put_text_hc$0$0	= .
	.globl	XG$put_text_hc$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
