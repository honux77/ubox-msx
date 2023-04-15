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
	.globl _draw_end_game
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
	C$main.c$10$0_0$27	= .
	.globl	C$main.c$10$0_0$27
;main.c:10: void draw_title()
;	---------------------------------
; Function draw_title
; ---------------------------------
_draw_title::
	C$main.c$14$1_0$27	= .
	.globl	C$main.c$14$1_0$27
;main.c:14: ubox_disable_screen();
	call	_ubox_disable_screen
	C$main.c$16$1_0$27	= .
	.globl	C$main.c$16$1_0$27
;main.c:16: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$main.c$18$1_0$27	= .
	.globl	C$main.c$18$1_0$27
;main.c:18: put_text(11, 9, "BREAK OUT");
	ld	hl, #___str_0
	push	hl
	ld	de, #0x090b
	push	de
	call	_put_text
	pop	af
	C$main.c$19$1_0$27	= .
	.globl	C$main.c$19$1_0$27
;main.c:19: put_text(8, 11, "PRESS SPACE BAR");
	ld	hl, #___str_1
	ex	(sp),hl
	ld	de, #0x0b08
	push	de
	call	_put_text
	pop	af
	C$main.c$22$1_0$27	= .
	.globl	C$main.c$22$1_0$27
;main.c:22: put_text(8, 18, "\0372021 YUZA SOFT");
	ld	hl, #___str_2
	ex	(sp),hl
	ld	de, #0x1208
	push	de
	call	_put_text
	pop	af
	pop	af
	C$main.c$24$1_0$27	= .
	.globl	C$main.c$24$1_0$27
;main.c:24: ubox_enable_screen();
	call	_ubox_enable_screen
	C$main.c$26$1_0$27	= .
	.globl	C$main.c$26$1_0$27
;main.c:26: while (1)
00104$:
	C$main.c$28$2_0$28	= .
	.globl	C$main.c$28$2_0$28
;main.c:28: ctl = ubox_select_ctl();
	call	_ubox_select_ctl
	ld	a, l
	ld	(_ctl+0), a
	C$main.c$30$2_0$28	= .
	.globl	C$main.c$30$2_0$28
;main.c:30: if (ctl != UBOX_MSX_CTL_NONE)
	ld	a,(#_ctl + 0)
	inc	a
	jr	NZ,00105$
	C$main.c$33$2_0$28	= .
	.globl	C$main.c$33$2_0$28
;main.c:33: ubox_wait();
	call	_ubox_wait
	jr	00104$
00105$:
	C$main.c$36$1_0$27	= .
	.globl	C$main.c$36$1_0$27
;main.c:36: g_gamestate = STATE_IN_GAME;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x01
	C$main.c$37$1_0$27	= .
	.globl	C$main.c$37$1_0$27
;main.c:37: }
	C$main.c$37$1_0$27	= .
	.globl	C$main.c$37$1_0$27
	XG$draw_title$0$0	= .
	.globl	XG$draw_title$0$0
	ret
Fmain$__str_0$0_0$0 == .
___str_0:
	.ascii "BREAK OUT"
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
	G$draw_end_game$0$0	= .
	.globl	G$draw_end_game$0$0
	C$main.c$39$1_0$29	= .
	.globl	C$main.c$39$1_0$29
;main.c:39: void draw_end_game()
;	---------------------------------
; Function draw_end_game
; ---------------------------------
_draw_end_game::
	C$main.c$41$1_0$29	= .
	.globl	C$main.c$41$1_0$29
;main.c:41: ubox_disable_screen();
	call	_ubox_disable_screen
	C$main.c$43$1_0$29	= .
	.globl	C$main.c$43$1_0$29
;main.c:43: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$main.c$45$1_0$29	= .
	.globl	C$main.c$45$1_0$29
;main.c:45: put_text(3, 9, "GAME CLEAR!");
	ld	hl, #___str_3
	push	hl
	ld	de, #0x0903
	push	de
	call	_put_text
	pop	af
	C$main.c$47$1_0$29	= .
	.globl	C$main.c$47$1_0$29
;main.c:47: put_text(3, 12, "(PRESS ESC)");
	ld	hl, #___str_4
	ex	(sp),hl
	ld	de, #0x0c03
	push	de
	call	_put_text
	pop	af
	pop	af
	C$main.c$49$1_0$29	= .
	.globl	C$main.c$49$1_0$29
;main.c:49: ubox_enable_screen();
	call	_ubox_enable_screen
	C$main.c$50$1_0$29	= .
	.globl	C$main.c$50$1_0$29
;main.c:50: while (1)
00104$:
	C$main.c$52$2_0$30	= .
	.globl	C$main.c$52$2_0$30
;main.c:52: ctl = ubox_select_ctl();
	call	_ubox_select_ctl
	ld	a, l
	ld	(_ctl+0), a
	C$main.c$54$2_0$30	= .
	.globl	C$main.c$54$2_0$30
;main.c:54: if (ctl != UBOX_MSX_CTL_NONE)
	ld	a,(#_ctl + 0)
	inc	a
	jr	NZ,00105$
	C$main.c$57$2_0$30	= .
	.globl	C$main.c$57$2_0$30
;main.c:57: ubox_wait();
	call	_ubox_wait
	jr	00104$
00105$:
	C$main.c$60$1_0$29	= .
	.globl	C$main.c$60$1_0$29
;main.c:60: g_gamestate = STATE_TITLE;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x00
	C$main.c$61$1_0$29	= .
	.globl	C$main.c$61$1_0$29
;main.c:61: }
	C$main.c$61$1_0$29	= .
	.globl	C$main.c$61$1_0$29
	XG$draw_end_game$0$0	= .
	.globl	XG$draw_end_game$0$0
	ret
Fmain$__str_3$0_0$0 == .
___str_3:
	.ascii "GAME CLEAR!"
	.db 0x00
Fmain$__str_4$0_0$0 == .
___str_4:
	.ascii "(PRESS ESC)"
	.db 0x00
	G$draw_game_over$0$0	= .
	.globl	G$draw_game_over$0$0
	C$main.c$63$1_0$31	= .
	.globl	C$main.c$63$1_0$31
;main.c:63: void draw_game_over()
;	---------------------------------
; Function draw_game_over
; ---------------------------------
_draw_game_over::
	C$main.c$65$1_0$31	= .
	.globl	C$main.c$65$1_0$31
;main.c:65: ubox_disable_screen();
	call	_ubox_disable_screen
	C$main.c$67$1_0$31	= .
	.globl	C$main.c$67$1_0$31
;main.c:67: put_text(11, 10, "GAME  OVER");
	ld	hl, #___str_5
	push	hl
	ld	de, #0x0a0b
	push	de
	call	_put_text
	pop	af
	pop	af
	C$main.c$69$1_0$31	= .
	.globl	C$main.c$69$1_0$31
;main.c:69: ubox_enable_screen();
	call	_ubox_enable_screen
	C$main.c$71$1_0$31	= .
	.globl	C$main.c$71$1_0$31
;main.c:71: ubox_wait_for(128);
	ld	l, #0x80
	call	_ubox_wait_for
	C$main.c$73$1_0$31	= .
	.globl	C$main.c$73$1_0$31
;main.c:73: ubox_disable_screen();
	call	_ubox_disable_screen
	C$main.c$74$1_0$31	= .
	.globl	C$main.c$74$1_0$31
;main.c:74: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$main.c$75$1_0$31	= .
	.globl	C$main.c$75$1_0$31
;main.c:75: ubox_enable_screen();
	call	_ubox_enable_screen
	C$main.c$77$1_0$31	= .
	.globl	C$main.c$77$1_0$31
;main.c:77: g_gamestate = STATE_TITLE;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x00
	C$main.c$79$1_0$31	= .
	.globl	C$main.c$79$1_0$31
;main.c:79: }       
	C$main.c$79$1_0$31	= .
	.globl	C$main.c$79$1_0$31
	XG$draw_game_over$0$0	= .
	.globl	XG$draw_game_over$0$0
	ret
Fmain$__str_5$0_0$0 == .
___str_5:
	.ascii "GAME  OVER"
	.db 0x00
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$82$1_0$32	= .
	.globl	C$main.c$82$1_0$32
;main.c:82: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$85$1_0$32	= .
	.globl	C$main.c$85$1_0$32
;main.c:85: InitEnvironment();
	call	_InitEnvironment
	C$main.c$87$1_0$32	= .
	.globl	C$main.c$87$1_0$32
;main.c:87: draw_title();
	call	_draw_title
	C$main.c$89$1_0$32	= .
	.globl	C$main.c$89$1_0$32
;main.c:89: while (1)
00107$:
	C$main.c$92$2_0$33	= .
	.globl	C$main.c$92$2_0$33
;main.c:92: switch (g_gamestate)
	ld	iy, #_g_gamestate
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00104$
	ld	a, 0 (iy)
	dec	a
	jr	Z,00103$
	ld	a, 0 (iy)
	sub	a, #0x02
	jr	Z,00101$
	ld	a, 0 (iy)
	sub	a, #0x03
	jr	Z,00102$
	jr	00105$
	C$main.c$94$3_0$34	= .
	.globl	C$main.c$94$3_0$34
;main.c:94: case STATE_GAME_OVER:
00101$:
	C$main.c$95$3_0$34	= .
	.globl	C$main.c$95$3_0$34
;main.c:95: draw_game_over();
	call	_draw_game_over
	C$main.c$96$3_0$34	= .
	.globl	C$main.c$96$3_0$34
;main.c:96: break;
	jr	00105$
	C$main.c$97$3_0$34	= .
	.globl	C$main.c$97$3_0$34
;main.c:97: case STATE_GAME_CLEAR:
00102$:
	C$main.c$98$3_0$34	= .
	.globl	C$main.c$98$3_0$34
;main.c:98: draw_end_game();
	call	_draw_end_game
	C$main.c$99$3_0$34	= .
	.globl	C$main.c$99$3_0$34
;main.c:99: break;
	jr	00105$
	C$main.c$100$3_0$34	= .
	.globl	C$main.c$100$3_0$34
;main.c:100: case STATE_IN_GAME:
00103$:
	C$main.c$101$3_0$34	= .
	.globl	C$main.c$101$3_0$34
;main.c:101: run_game();
	call	_run_game
	C$main.c$102$3_0$34	= .
	.globl	C$main.c$102$3_0$34
;main.c:102: break;
	jr	00105$
	C$main.c$103$3_0$34	= .
	.globl	C$main.c$103$3_0$34
;main.c:103: case STATE_TITLE:
00104$:
	C$main.c$104$3_0$34	= .
	.globl	C$main.c$104$3_0$34
;main.c:104: draw_title();
	call	_draw_title
	C$main.c$106$2_0$33	= .
	.globl	C$main.c$106$2_0$33
;main.c:106: }
00105$:
	C$main.c$108$2_0$33	= .
	.globl	C$main.c$108$2_0$33
;main.c:108: ubox_wait();
	call	_ubox_wait
	C$main.c$110$1_0$32	= .
	.globl	C$main.c$110$1_0$32
;main.c:110: }
	C$main.c$110$1_0$32	= .
	.globl	C$main.c$110$1_0$32
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jr	00107$
	.area _CODE
	.area _INITIALIZER
Fmain$__xinit_g_gamestate$0_0$0 == .
__xinit__g_gamestate:
	.db #0x00	; 0
	.area _CABS (ABS)
