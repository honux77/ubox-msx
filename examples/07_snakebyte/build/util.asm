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
	.globl _g_tick_count
	.globl _put_text
	.globl _RenderTile
	.globl _now
	.globl _my_isr
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
G$g_tick_count$0_0$0==.
_g_tick_count::
	.ds 4
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
	C$util.c$6$0_0$57	= .
	.globl	C$util.c$6$0_0$57
;util.c:6: void put_text(uint8_t x, uint8_t y, const uint8_t *text)
;	---------------------------------
; Function put_text
; ---------------------------------
_put_text::
	C$util.c$8$1_0$57	= .
	.globl	C$util.c$8$1_0$57
;util.c:8: while (*text)
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
	C$util.c$9$1_0$57	= .
	.globl	C$util.c$9$1_0$57
;util.c:9: ubox_put_tile(x++, y, *text++ + 128 - 31);
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
	C$util.c$10$1_0$57	= .
	.globl	C$util.c$10$1_0$57
;util.c:10: }
	C$util.c$10$1_0$57	= .
	.globl	C$util.c$10$1_0$57
	XG$put_text$0$0	= .
	.globl	XG$put_text$0$0
	jr	00101$
	G$RenderTile$0$0	= .
	.globl	G$RenderTile$0$0
	C$util.c$12$1_0$59	= .
	.globl	C$util.c$12$1_0$59
;util.c:12: void RenderTile(int x, int y, int tileNum)
;	---------------------------------
; Function RenderTile
; ---------------------------------
_RenderTile::
	C$util.c$14$1_0$59	= .
	.globl	C$util.c$14$1_0$59
;util.c:14: ubox_put_tile(x, y, tileNum);
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
	C$util.c$15$1_0$59	= .
	.globl	C$util.c$15$1_0$59
;util.c:15: }
	C$util.c$15$1_0$59	= .
	.globl	C$util.c$15$1_0$59
	XG$RenderTile$0$0	= .
	.globl	XG$RenderTile$0$0
	ret
	G$now$0$0	= .
	.globl	G$now$0$0
	C$util.c$18$1_0$60	= .
	.globl	C$util.c$18$1_0$60
;util.c:18: int now()
;	---------------------------------
; Function now
; ---------------------------------
_now::
	C$util.c$20$1_0$60	= .
	.globl	C$util.c$20$1_0$60
;util.c:20: return g_tick_count;
	ld	hl, (_g_tick_count)
	C$util.c$21$1_0$60	= .
	.globl	C$util.c$21$1_0$60
;util.c:21: }
	C$util.c$21$1_0$60	= .
	.globl	C$util.c$21$1_0$60
	XG$now$0$0	= .
	.globl	XG$now$0$0
	ret
	G$my_isr$0$0	= .
	.globl	G$my_isr$0$0
	C$util.c$23$1_0$61	= .
	.globl	C$util.c$23$1_0$61
;util.c:23: void my_isr()
;	---------------------------------
; Function my_isr
; ---------------------------------
_my_isr::
	push	af
	push	af
	C$util.c$25$1_0$61	= .
	.globl	C$util.c$25$1_0$61
;util.c:25: g_tick_count++;
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #_g_tick_count
	ld	bc, #4
	ldir
	ld	hl, #_g_tick_count
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	a, 2 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	a, 3 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$util.c$26$1_0$61	= .
	.globl	C$util.c$26$1_0$61
;util.c:26: }
	pop	af
	pop	af
	C$util.c$26$1_0$61	= .
	.globl	C$util.c$26$1_0$61
	XG$my_isr$0$0	= .
	.globl	XG$my_isr$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Futil$__xinit_g_tick_count$0_0$0 == .
__xinit__g_tick_count:
	.byte #0x00, #0x00, #0x00, #0x00	;  0
	.area _CABS (ABS)
