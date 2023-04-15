;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _draw_game_over
	.globl _draw_title
	.globl _put_text
	.globl _InitEnvironment
	.globl _run_game
	.globl _ubox_select_ctl
	.globl _ubox_wait_for
	.globl _ubox_wait
	.globl _ubox_fill_screen
	.globl _ubox_disable_screen
	.globl _ubox_enable_screen
	.globl _g_gamestate
	.globl _ctl
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$ctl$0_0$0==.
_ctl::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$g_gamestate$0_0$0==.
_g_gamestate::
	.ds 1
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
	G$draw_title$0$0	= .
	.globl	G$draw_title$0$0
	C$main.c$8$0_0$26	= .
	.globl	C$main.c$8$0_0$26
;main.c:8: void draw_title()
;	---------------------------------
; Function draw_title
; ---------------------------------
_draw_title::
	C$main.c$12$1_0$26	= .
	.globl	C$main.c$12$1_0$26
;main.c:12: ubox_disable_screen();
	call	_ubox_disable_screen
	C$main.c$14$1_0$26	= .
	.globl	C$main.c$14$1_0$26
;main.c:14: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$main.c$16$1_0$26	= .
	.globl	C$main.c$16$1_0$26
;main.c:16: put_text(13, 9, "TETRIS");
	ld	hl, #___str_0
	push	hl
	ld	de, #0x090d
	push	de
	call	_put_text
	pop	af
	C$main.c$17$1_0$26	= .
	.globl	C$main.c$17$1_0$26
;main.c:17: put_text(8, 11, "PRESS SPACE BAR");
	ld	hl, #___str_1
	ex	(sp),hl
	ld	de, #0x0b08
	push	de
	call	_put_text
	pop	af
	C$main.c$19$1_0$26	= .
	.globl	C$main.c$19$1_0$26
;main.c:19: put_text(8, 18, "\0372021 YUZA SOFT");
	ld	hl, #___str_2
	ex	(sp),hl
	ld	de, #0x1208
	push	de
	call	_put_text
	pop	af
	pop	af
	C$main.c$21$1_0$26	= .
	.globl	C$main.c$21$1_0$26
;main.c:21: ubox_enable_screen();
	call	_ubox_enable_screen
	C$main.c$23$1_0$26	= .
	.globl	C$main.c$23$1_0$26
;main.c:23: while (1)
00104$:
	C$main.c$25$2_0$27	= .
	.globl	C$main.c$25$2_0$27
;main.c:25: ctl = ubox_select_ctl();
	call	_ubox_select_ctl
	ld	a, l
	ld	(_ctl+0), a
	C$main.c$27$2_0$27	= .
	.globl	C$main.c$27$2_0$27
;main.c:27: if (ctl != UBOX_MSX_CTL_NONE)
	ld	a,(#_ctl + 0)
	inc	a
	jr	NZ,00105$
	C$main.c$30$2_0$27	= .
	.globl	C$main.c$30$2_0$27
;main.c:30: ubox_wait();
	call	_ubox_wait
	jr	00104$
00105$:
	C$main.c$33$1_0$26	= .
	.globl	C$main.c$33$1_0$26
;main.c:33: g_gamestate = STATE_IN_GAME;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x01
	C$main.c$34$1_0$26	= .
	.globl	C$main.c$34$1_0$26
;main.c:34: }
	C$main.c$34$1_0$26	= .
	.globl	C$main.c$34$1_0$26
	XG$draw_title$0$0	= .
	.globl	XG$draw_title$0$0
	ret
Fmain$__str_0$0_0$0 == .
___str_0:
	.ascii "TETRIS"
	.db 0x00
Fmain$__str_1$0_0$0 == .
___str_1:
	.ascii "PRESS SPACE BAR"
	.db 0x00
Fmain$__str_2$0_0$0 == .
___str_2:
	.db 0x1f
	.ascii "2021 YUZA SOFT"
	.db 0x00
	G$draw_game_over$0$0	= .
	.globl	G$draw_game_over$0$0
	C$main.c$36$1_0$28	= .
	.globl	C$main.c$36$1_0$28
;main.c:36: void draw_game_over()
;	---------------------------------
; Function draw_game_over
; ---------------------------------
_draw_game_over::
	C$main.c$38$1_0$28	= .
	.globl	C$main.c$38$1_0$28
;main.c:38: ubox_disable_screen();
	call	_ubox_disable_screen
	C$main.c$40$1_0$28	= .
	.globl	C$main.c$40$1_0$28
;main.c:40: put_text(11, 10, "GAME  OVER");
	ld	hl, #___str_3
	push	hl
	ld	de, #0x0a0b
	push	de
	call	_put_text
	pop	af
	pop	af
	C$main.c$42$1_0$28	= .
	.globl	C$main.c$42$1_0$28
;main.c:42: ubox_enable_screen();
	call	_ubox_enable_screen
	C$main.c$44$1_0$28	= .
	.globl	C$main.c$44$1_0$28
;main.c:44: ubox_wait_for(128);
	ld	l, #0x80
	call	_ubox_wait_for
	C$main.c$46$1_0$28	= .
	.globl	C$main.c$46$1_0$28
;main.c:46: ubox_disable_screen();
	call	_ubox_disable_screen
	C$main.c$47$1_0$28	= .
	.globl	C$main.c$47$1_0$28
;main.c:47: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$main.c$48$1_0$28	= .
	.globl	C$main.c$48$1_0$28
;main.c:48: ubox_enable_screen();
	call	_ubox_enable_screen
	C$main.c$50$1_0$28	= .
	.globl	C$main.c$50$1_0$28
;main.c:50: g_gamestate = STATE_TITLE;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x00
	C$main.c$52$1_0$28	= .
	.globl	C$main.c$52$1_0$28
;main.c:52: }       
	C$main.c$52$1_0$28	= .
	.globl	C$main.c$52$1_0$28
	XG$draw_game_over$0$0	= .
	.globl	XG$draw_game_over$0$0
	ret
Fmain$__str_3$0_0$0 == .
___str_3:
	.ascii "GAME  OVER"
	.db 0x00
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$54$1_0$29	= .
	.globl	C$main.c$54$1_0$29
;main.c:54: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$56$1_0$29	= .
	.globl	C$main.c$56$1_0$29
;main.c:56: InitEnvironment();
	call	_InitEnvironment
	C$main.c$58$1_0$29	= .
	.globl	C$main.c$58$1_0$29
;main.c:58: draw_title();
	call	_draw_title
	C$main.c$60$1_0$29	= .
	.globl	C$main.c$60$1_0$29
;main.c:60: while (1)
00106$:
	C$main.c$62$2_0$30	= .
	.globl	C$main.c$62$2_0$30
;main.c:62: switch (g_gamestate)
	ld	iy, #_g_gamestate
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00103$
	ld	a, 0 (iy)
	dec	a
	jr	Z,00102$
	ld	a, 0 (iy)
	sub	a, #0x02
	jr	NZ,00104$
	C$main.c$65$3_0$31	= .
	.globl	C$main.c$65$3_0$31
;main.c:65: draw_game_over();
	call	_draw_game_over
	C$main.c$66$3_0$31	= .
	.globl	C$main.c$66$3_0$31
;main.c:66: break;
	jr	00104$
	C$main.c$67$3_0$31	= .
	.globl	C$main.c$67$3_0$31
;main.c:67: case STATE_IN_GAME:
00102$:
	C$main.c$68$3_0$31	= .
	.globl	C$main.c$68$3_0$31
;main.c:68: run_game();
	call	_run_game
	C$main.c$69$3_0$31	= .
	.globl	C$main.c$69$3_0$31
;main.c:69: break;
	jr	00104$
	C$main.c$70$3_0$31	= .
	.globl	C$main.c$70$3_0$31
;main.c:70: case STATE_TITLE:
00103$:
	C$main.c$71$3_0$31	= .
	.globl	C$main.c$71$3_0$31
;main.c:71: draw_title();
	call	_draw_title
	C$main.c$73$2_0$30	= .
	.globl	C$main.c$73$2_0$30
;main.c:73: }
00104$:
	C$main.c$75$2_0$30	= .
	.globl	C$main.c$75$2_0$30
;main.c:75: ubox_wait();
	call	_ubox_wait
	C$main.c$77$1_0$29	= .
	.globl	C$main.c$77$1_0$29
;main.c:77: }
	C$main.c$77$1_0$29	= .
	.globl	C$main.c$77$1_0$29
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jr	00106$
	.area _CODE
	.area _INITIALIZER
Fmain$__xinit_g_gamestate$0_0$0 == .
__xinit__g_gamestate:
	.db #0x00	; 0
	.area _CABS (ABS)
