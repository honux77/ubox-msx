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
	.globl _put_text
	.globl _RenderTile
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
	G$put_text$0$0	= .
	.globl	G$put_text$0$0
	C$util.c$4$0_0$25	= .
	.globl	C$util.c$4$0_0$25
;util.c:4: void put_text(uint8_t x, uint8_t y, const uint8_t *text)
;	---------------------------------
; Function put_text
; ---------------------------------
_put_text::
	C$util.c$6$1_0$25	= .
	.globl	C$util.c$6$1_0$25
;util.c:6: while (*text)
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
	C$util.c$7$1_0$25	= .
	.globl	C$util.c$7$1_0$25
;util.c:7: ubox_put_tile(x++, y, *text++ + 128 - 31);
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
	C$util.c$8$1_0$25	= .
	.globl	C$util.c$8$1_0$25
;util.c:8: }
	C$util.c$8$1_0$25	= .
	.globl	C$util.c$8$1_0$25
	XG$put_text$0$0	= .
	.globl	XG$put_text$0$0
	jr	00101$
	G$RenderTile$0$0	= .
	.globl	G$RenderTile$0$0
	C$util.c$10$1_0$27	= .
	.globl	C$util.c$10$1_0$27
;util.c:10: void RenderTile(int x, int y, int tileNum)
;	---------------------------------
; Function RenderTile
; ---------------------------------
_RenderTile::
	C$util.c$13$1_0$27	= .
	.globl	C$util.c$13$1_0$27
;util.c:13: ubox_put_tile(x, y, tileNum);
	ld	iy, #6
	add	iy, sp
	ld	d, 0 (iy)
	dec	iy
	dec	iy
	ld	b, 0 (iy)
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	e, b
	push	de
	push	af
	inc	sp
	call	_ubox_put_tile
	pop	af
	inc	sp
	C$util.c$14$1_0$27	= .
	.globl	C$util.c$14$1_0$27
;util.c:14: }
	C$util.c$14$1_0$27	= .
	.globl	C$util.c$14$1_0$27
	XG$RenderTile$0$0	= .
	.globl	XG$RenderTile$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
