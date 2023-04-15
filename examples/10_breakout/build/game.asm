;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _RandomBallSpeed
	.globl _ProcessInput
	.globl _ResetBall
	.globl _ResetStage
	.globl _draw_map
	.globl _EraseTiles
	.globl _InRect
	.globl _RenderBlock
	.globl _spman_hide_all_sprites
	.globl _spman_update
	.globl _spman_alloc_sprite
	.globl _spman_alloc_pat
	.globl _spman_init
	.globl _ubox_read_keys
	.globl _ubox_wait
	.globl _ubox_fill_screen
	.globl _ubox_disable_screen
	.globl _ubox_enable_screen
	.globl _g_paddle_posy
	.globl _g_paddle_posx
	.globl _g_screen_height
	.globl _g_screen_width
	.globl _g_pat_base
	.globl _sp
	.globl _g_bricks_dirty_map
	.globl _g_bricks
	.globl _g_ball
	.globl _breakout_sprite
	.globl _run_game
	.globl _ProcessBall
	.globl _CheckGameEnd
	.globl _InitGame
	.globl _ProcessLogic
	.globl _DrawWorld
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$g_ball$0_0$0==.
_g_ball::
	.ds 9
G$g_bricks$0_0$0==.
_g_bricks::
	.ds 50
G$g_bricks_dirty_map$0_0$0==.
_g_bricks_dirty_map::
	.ds 50
G$sp$0_0$0==.
_sp::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$g_pat_base$0_0$0==.
_g_pat_base::
	.ds 1
G$g_screen_width$0_0$0==.
_g_screen_width::
	.ds 2
G$g_screen_height$0_0$0==.
_g_screen_height::
	.ds 2
G$g_paddle_posx$0_0$0==.
_g_paddle_posx::
	.ds 2
G$g_paddle_posy$0_0$0==.
_g_paddle_posy::
	.ds 2
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
	G$draw_map$0$0	= .
	.globl	G$draw_map$0$0
	C$game.c$71$0_0$33	= .
	.globl	C$game.c$71$0_0$33
;game.c:71: void draw_map()
;	---------------------------------
; Function draw_map
; ---------------------------------
_draw_map::
	push	af
	C$game.c$74$5_0$36	= .
	.globl	C$game.c$74$5_0$36
;game.c:74: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	ld	bc, #0x0000
00109$:
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00111$
	C$game.c$76$6_0$37	= .
	.globl	C$game.c$76$6_0$37
;game.c:76: for (int x = 0; x < BRICKS_X_COUNT; x++)
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	ld	hl, #0x0000
	ex	(sp), hl
00106$:
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x0a
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00110$
	C$game.c$78$5_0$36	= .
	.globl	C$game.c$78$5_0$36
;game.c:78: if (g_bricks[x][y] != 0)
	push	de
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_g_bricks
	add	hl, de
	pop	de
	add	hl, bc
	ld	a, (hl)
	or	a, a
	jr	Z,00107$
	C$game.c$80$6_0$37	= .
	.globl	C$game.c$80$6_0$37
;game.c:80: RenderBlock(x * 3, y * 2);
	push	de
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	pop	de
	push	bc
	push	de
	push	de
	push	hl
	call	_RenderBlock
	pop	af
	pop	af
	pop	de
	pop	bc
00107$:
	C$game.c$76$4_0$35	= .
	.globl	C$game.c$76$4_0$35
;game.c:76: for (int x = 0; x < BRICKS_X_COUNT; x++)
	ld	iy, #0
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00106$
	inc	1 (iy)
	jr	00106$
00110$:
	C$game.c$74$2_0$33	= .
	.globl	C$game.c$74$2_0$33
;game.c:74: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	inc	bc
	jr	00109$
00111$:
	C$game.c$84$2_0$33	= .
	.globl	C$game.c$84$2_0$33
;game.c:84: }
	pop	af
	C$game.c$84$2_0$33	= .
	.globl	C$game.c$84$2_0$33
	XG$draw_map$0$0	= .
	.globl	XG$draw_map$0$0
	ret
G$breakout_sprite$0_0$0 == .
_breakout_sprite:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	G$run_game$0$0	= .
	.globl	G$run_game$0$0
	C$game.c$86$2_0$38	= .
	.globl	C$game.c$86$2_0$38
;game.c:86: void run_game()
;	---------------------------------
; Function run_game
; ---------------------------------
_run_game::
	C$game.c$88$1_0$38	= .
	.globl	C$game.c$88$1_0$38
;game.c:88: g_gamestate = STATE_IN_GAME;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x01
	C$game.c$90$1_0$38	= .
	.globl	C$game.c$90$1_0$38
;game.c:90: spman_init();
	call	_spman_init
	C$game.c$92$1_0$38	= .
	.globl	C$game.c$92$1_0$38
;game.c:92: InitGame(32 * 8, 21 * 8);
	ld	hl, #0x00a8
	push	hl
	ld	hl, #0x0100
	push	hl
	call	_InitGame
	pop	af
	pop	af
	C$game.c$94$1_0$38	= .
	.globl	C$game.c$94$1_0$38
;game.c:94: g_pat_base = spman_alloc_pat(0, breakout_sprite[0], 3, 0);
	xor	a, a
	ld	d,a
	ld	e,#0x03
	push	de
	ld	hl, #_breakout_sprite
	push	hl
	xor	a, a
	push	af
	inc	sp
	call	_spman_alloc_pat
	pop	af
	pop	af
	inc	sp
	ld	a, l
	ld	(_g_pat_base+0), a
	C$game.c$96$1_0$38	= .
	.globl	C$game.c$96$1_0$38
;game.c:96: ubox_disable_screen();
	call	_ubox_disable_screen
	C$game.c$98$1_0$38	= .
	.globl	C$game.c$98$1_0$38
;game.c:98: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$game.c$100$1_0$38	= .
	.globl	C$game.c$100$1_0$38
;game.c:100: draw_map();
	call	_draw_map
	C$game.c$102$1_0$38	= .
	.globl	C$game.c$102$1_0$38
;game.c:102: ubox_enable_screen();
	call	_ubox_enable_screen
	C$game.c$104$1_0$38	= .
	.globl	C$game.c$104$1_0$38
;game.c:104: while (1)
00107$:
	C$game.c$106$2_0$39	= .
	.globl	C$game.c$106$2_0$39
;game.c:106: if (ubox_read_keys(7) == UBOX_MSX_KEY_ESC)
	ld	l, #0x07
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x04
	jp	Z,_spman_hide_all_sprites
	C$game.c$109$2_0$39	= .
	.globl	C$game.c$109$2_0$39
;game.c:109: ProcessLogic(0);
	ld	hl, #0x0000
	push	hl
	call	_ProcessLogic
	pop	af
	C$game.c$111$2_0$39	= .
	.globl	C$game.c$111$2_0$39
;game.c:111: DrawWorld();
	call	_DrawWorld
	C$game.c$113$2_0$39	= .
	.globl	C$game.c$113$2_0$39
;game.c:113: ubox_wait();
	call	_ubox_wait
	C$game.c$115$2_0$39	= .
	.globl	C$game.c$115$2_0$39
;game.c:115: spman_update();
	call	_spman_update
	C$game.c$117$2_0$39	= .
	.globl	C$game.c$117$2_0$39
;game.c:117: if (g_gamestate == STATE_GAME_OVER || g_gamestate == STATE_GAME_CLEAR)
	ld	iy, #_g_gamestate
	ld	a, 0 (iy)
	sub	a, #0x02
	jp	Z,_spman_hide_all_sprites
	ld	a, 0 (iy)
	sub	a, #0x03
	jr	NZ,00107$
	C$game.c$118$1_0$38	= .
	.globl	C$game.c$118$1_0$38
;game.c:118: break;
	C$game.c$121$1_0$38	= .
	.globl	C$game.c$121$1_0$38
;game.c:121: spman_hide_all_sprites();
	C$game.c$122$1_0$38	= .
	.globl	C$game.c$122$1_0$38
;game.c:122: }
	C$game.c$122$1_0$38	= .
	.globl	C$game.c$122$1_0$38
	XG$run_game$0$0	= .
	.globl	XG$run_game$0$0
	jp	_spman_hide_all_sprites
	G$ResetStage$0$0	= .
	.globl	G$ResetStage$0$0
	C$game.c$124$1_0$41	= .
	.globl	C$game.c$124$1_0$41
;game.c:124: void ResetStage()
;	---------------------------------
; Function ResetStage
; ---------------------------------
_ResetStage::
	push	af
	C$game.c$126$5_0$44	= .
	.globl	C$game.c$126$5_0$44
;game.c:126: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	ld	bc, #0x0000
00107$:
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00109$
	C$game.c$128$2_0$41	= .
	.globl	C$game.c$128$2_0$41
;game.c:128: for (int x = 0; x < BRICKS_X_COUNT; x++)
	ld	hl, #0x0000
	ex	(sp), hl
00104$:
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x0a
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00108$
	C$game.c$130$5_0$44	= .
	.globl	C$game.c$130$5_0$44
;game.c:130: g_bricks[x][y] = 1;
	pop	de
	push	de
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
	ld	hl, #_g_bricks
	add	hl, de
	add	hl, bc
	ld	(hl), #0x01
	C$game.c$131$5_0$44	= .
	.globl	C$game.c$131$5_0$44
;game.c:131: g_bricks_dirty_map[x][y] = 0;
	ld	hl, #_g_bricks_dirty_map
	add	hl, de
	add	hl, bc
	ld	(hl), #0x00
	C$game.c$128$4_0$43	= .
	.globl	C$game.c$128$4_0$43
;game.c:128: for (int x = 0; x < BRICKS_X_COUNT; x++)
	inc	0 (iy)
	jr	NZ,00104$
	inc	1 (iy)
	jr	00104$
00108$:
	C$game.c$126$2_0$41	= .
	.globl	C$game.c$126$2_0$41
;game.c:126: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	inc	bc
	jr	00107$
00109$:
	C$game.c$134$2_0$41	= .
	.globl	C$game.c$134$2_0$41
;game.c:134: }
	pop	af
	C$game.c$134$2_0$41	= .
	.globl	C$game.c$134$2_0$41
	XG$ResetStage$0$0	= .
	.globl	XG$ResetStage$0$0
	ret
	Fgame$GetBrickCount$0$0	= .
	.globl	Fgame$GetBrickCount$0$0
	C$game.c$136$2_0$45	= .
	.globl	C$game.c$136$2_0$45
;game.c:136: static int GetBrickCount()
;	---------------------------------
; Function GetBrickCount
; ---------------------------------
_GetBrickCount:
	push	af
	C$game.c$138$2_0$45	= .
	.globl	C$game.c$138$2_0$45
;game.c:138: int remainBlocksCount = 0;
	ld	bc, #0x0000
	C$game.c$140$5_0$49	= .
	.globl	C$game.c$140$5_0$49
;game.c:140: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	ld	de, #0x0000
00109$:
	ld	a, e
	sub	a, #0x05
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00104$
	C$game.c$142$1_0$45	= .
	.globl	C$game.c$142$1_0$45
;game.c:142: for (int x = 0; x < BRICKS_X_COUNT; x++)
	ld	hl, #0x0000
	ex	(sp), hl
00106$:
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x0a
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00118$
	C$game.c$144$5_0$49	= .
	.globl	C$game.c$144$5_0$49
;game.c:144: if (g_bricks[x][y] != 0)
	push	de
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_g_bricks
	add	hl, de
	pop	de
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	Z,00107$
	C$game.c$146$6_0$50	= .
	.globl	C$game.c$146$6_0$50
;game.c:146: remainBlocksCount++;
	inc	bc
00107$:
	C$game.c$142$4_0$48	= .
	.globl	C$game.c$142$4_0$48
;game.c:142: for (int x = 0; x < BRICKS_X_COUNT; x++)
	ld	iy, #0
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00106$
	inc	1 (iy)
	jr	00106$
00118$:
	C$game.c$140$2_0$46	= .
	.globl	C$game.c$140$2_0$46
;game.c:140: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	inc	de
	jr	00109$
00104$:
	C$game.c$151$1_0$45	= .
	.globl	C$game.c$151$1_0$45
;game.c:151: return remainBlocksCount;
	ld	l, c
	ld	h, b
	C$game.c$152$1_0$45	= .
	.globl	C$game.c$152$1_0$45
;game.c:152: }
	pop	af
	C$game.c$152$1_0$45	= .
	.globl	C$game.c$152$1_0$45
	XFgame$GetBrickCount$0$0	= .
	.globl	XFgame$GetBrickCount$0$0
	ret
	G$ResetBall$0$0	= .
	.globl	G$ResetBall$0$0
	C$game.c$154$1_0$51	= .
	.globl	C$game.c$154$1_0$51
;game.c:154: void ResetBall()
;	---------------------------------
; Function ResetBall
; ---------------------------------
_ResetBall::
	C$game.c$156$1_0$51	= .
	.globl	C$game.c$156$1_0$51
;game.c:156: g_ball.x = g_screen_width / 2 + 8;
	ld	bc, (_g_screen_width)
	bit	7, b
	jr	Z,00103$
	inc	bc
00103$:
	sra	b
	rr	c
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
	ld	((_g_ball + 0x0004)), de
	C$game.c$157$1_0$51	= .
	.globl	C$game.c$157$1_0$51
;game.c:157: g_ball.y = g_screen_height / 2 + 8;
	ld	bc, (_g_screen_height)
	bit	7, b
	jr	Z,00104$
	inc	bc
00104$:
	sra	b
	rr	c
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
	ld	((_g_ball + 0x0006)), de
	C$game.c$158$1_0$51	= .
	.globl	C$game.c$158$1_0$51
;game.c:158: g_ball.vel_x = BALL_VELOCITY_X;
	ld	hl, #0x0002
	ld	(_g_ball), hl
	C$game.c$159$1_0$51	= .
	.globl	C$game.c$159$1_0$51
;game.c:159: g_ball.vel_y = BALL_VELOCITY_Y;
	ld	l, #0x02
	ld	((_g_ball + 0x0002)), hl
	C$game.c$160$1_0$51	= .
	.globl	C$game.c$160$1_0$51
;game.c:160: g_ball.radius = 4;
	ld	hl, #(_g_ball + 0x0008)
	ld	(hl), #0x04
	C$game.c$161$1_0$51	= .
	.globl	C$game.c$161$1_0$51
;game.c:161: }
	C$game.c$161$1_0$51	= .
	.globl	C$game.c$161$1_0$51
	XG$ResetBall$0$0	= .
	.globl	XG$ResetBall$0$0
	ret
	G$ProcessInput$0$0	= .
	.globl	G$ProcessInput$0$0
	C$game.c$165$1_0$53	= .
	.globl	C$game.c$165$1_0$53
;game.c:165: void ProcessInput(int paddle_posx)
;	---------------------------------
; Function ProcessInput
; ---------------------------------
_ProcessInput::
	C$game.c$167$1_0$53	= .
	.globl	C$game.c$167$1_0$53
;game.c:167: if (ubox_read_keys(8) == UBOX_MSX_KEY_LEFT)
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x10
	jr	NZ,00102$
	C$game.c$168$1_0$53	= .
	.globl	C$game.c$168$1_0$53
;game.c:168: g_paddle_posx -= 4;
	ld	hl, #_g_paddle_posx
	ld	a, (hl)
	add	a, #0xfc
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00102$:
	C$game.c$170$1_0$53	= .
	.globl	C$game.c$170$1_0$53
;game.c:170: if (ubox_read_keys(8) == UBOX_MSX_KEY_RIGHT)
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x80
	jr	NZ,00104$
	C$game.c$171$1_0$53	= .
	.globl	C$game.c$171$1_0$53
;game.c:171: g_paddle_posx += 4;
	ld	hl, #_g_paddle_posx
	ld	a, (hl)
	add	a, #0x04
	ld	(hl), a
	jr	NC,00135$
	inc	hl
	inc	(hl)
00135$:
00104$:
	C$game.c$174$1_0$53	= .
	.globl	C$game.c$174$1_0$53
;game.c:174: if (g_paddle_posx >= g_screen_width - PADDLE_WIDTH)
	ld	iy, #_g_screen_width
	ld	a, 0 (iy)
	add	a, #0xe0
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0xff
	ld	b, a
	ld	iy, #_g_paddle_posx
	ld	a, 0 (iy)
	sub	a, c
	ld	a, 1 (iy)
	sbc	a, b
	jp	PO, 00136$
	xor	a, #0x80
00136$:
	jp	M, 00106$
	C$game.c$175$1_0$53	= .
	.globl	C$game.c$175$1_0$53
;game.c:175: g_paddle_posx = g_screen_width - PADDLE_WIDTH;
	ld	(_g_paddle_posx), bc
00106$:
	C$game.c$177$1_0$53	= .
	.globl	C$game.c$177$1_0$53
;game.c:177: if (g_paddle_posx <= 0)
	xor	a, a
	ld	iy, #_g_paddle_posx
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00137$
	xor	a, #0x80
00137$:
	ret	M
	C$game.c$178$1_0$53	= .
	.globl	C$game.c$178$1_0$53
;game.c:178: g_paddle_posx = 0;
	ld	hl, #0x0000
	ld	(_g_paddle_posx), hl
	C$game.c$179$1_0$53	= .
	.globl	C$game.c$179$1_0$53
;game.c:179: }
	C$game.c$179$1_0$53	= .
	.globl	C$game.c$179$1_0$53
	XG$ProcessInput$0$0	= .
	.globl	XG$ProcessInput$0$0
	ret
	G$RandomBallSpeed$0$0	= .
	.globl	G$RandomBallSpeed$0$0
	C$game.c$182$1_0$54	= .
	.globl	C$game.c$182$1_0$54
;game.c:182: void RandomBallSpeed()
;	---------------------------------
; Function RandomBallSpeed
; ---------------------------------
_RandomBallSpeed::
	C$game.c$184$1_0$54	= .
	.globl	C$game.c$184$1_0$54
;game.c:184: if (g_ball.x < g_paddle_posx + (PADDLE_WIDTH / 4))
	ld	bc, (#_g_ball + 4)
	ld	iy, #_g_paddle_posx
	ld	a, 0 (iy)
	add	a, #0x08
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	d, a
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	jp	P, 00108$
	C$game.c$185$1_0$54	= .
	.globl	C$game.c$185$1_0$54
;game.c:185: g_ball.vel_x = -3;
	ld	hl, #0xfffd
	ld	(_g_ball), hl
	ret
00108$:
	C$game.c$186$1_0$54	= .
	.globl	C$game.c$186$1_0$54
;game.c:186: else if (g_ball.x < g_paddle_posx + (PADDLE_WIDTH / 2))
	ld	iy, #_g_paddle_posx
	ld	a, 0 (iy)
	add	a, #0x10
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	d, a
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00128$
	xor	a, #0x80
00128$:
	jp	P, 00105$
	C$game.c$187$1_0$54	= .
	.globl	C$game.c$187$1_0$54
;game.c:187: g_ball.vel_x = -2;
	ld	hl, #0xfffe
	ld	(_g_ball), hl
	ret
00105$:
	C$game.c$188$1_0$54	= .
	.globl	C$game.c$188$1_0$54
;game.c:188: else if (g_ball.x < g_paddle_posx + (PADDLE_WIDTH / 2) + (PADDLE_WIDTH / 4))
	ld	iy, #_g_paddle_posx
	ld	a, 0 (iy)
	add	a, #0x18
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	d, a
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00129$
	xor	a, #0x80
00129$:
	jp	P, 00102$
	C$game.c$189$1_0$54	= .
	.globl	C$game.c$189$1_0$54
;game.c:189: g_ball.vel_x = 2;
	ld	hl, #0x0002
	ld	(_g_ball), hl
	ret
00102$:
	C$game.c$191$1_0$54	= .
	.globl	C$game.c$191$1_0$54
;game.c:191: g_ball.vel_x = 3;
	ld	hl, #0x0003
	ld	(_g_ball), hl
	C$game.c$192$1_0$54	= .
	.globl	C$game.c$192$1_0$54
;game.c:192: }
	C$game.c$192$1_0$54	= .
	.globl	C$game.c$192$1_0$54
	XG$RandomBallSpeed$0$0	= .
	.globl	XG$RandomBallSpeed$0$0
	ret
	G$ProcessBall$0$0	= .
	.globl	G$ProcessBall$0$0
	C$game.c$194$1_0$55	= .
	.globl	C$game.c$194$1_0$55
;game.c:194: void ProcessBall()
;	---------------------------------
; Function ProcessBall
; ---------------------------------
_ProcessBall::
	ld	hl, #-26
	add	hl, sp
	ld	sp, hl
	C$game.c$199$1_0$55	= .
	.globl	C$game.c$199$1_0$55
;game.c:199: rect.x1 = g_paddle_posx;
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a,(#_g_paddle_posx + 0)
	ld	(de), a
	C$game.c$200$1_0$55	= .
	.globl	C$game.c$200$1_0$55
;game.c:200: rect.y1 = g_paddle_posy;
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	c, e
	ld	b, d
	inc	bc
	ld	a,(#_g_paddle_posy + 0)
	ld	(bc), a
	C$game.c$201$1_0$55	= .
	.globl	C$game.c$201$1_0$55
;game.c:201: rect.x2 = g_paddle_posx + PADDLE_WIDTH;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a,(#_g_paddle_posx + 0)
	add	a, #0x20
	ld	(bc), a
	C$game.c$202$1_0$55	= .
	.globl	C$game.c$202$1_0$55
;game.c:202: rect.y2 = g_paddle_posy + PADDLE_HEIGHT;
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	inc	bc
	ld	a,(#_g_paddle_posy + 0)
	add	a, #0x10
	ld	(bc), a
	C$game.c$204$1_0$55	= .
	.globl	C$game.c$204$1_0$55
;game.c:204: if (g_ball.vel_y > 0)
	ld	hl, (#(_g_ball + 0x0002) + 0)
	C$game.c$207$2_0$55	= .
	.globl	C$game.c$207$2_0$55
;game.c:207: if (InRect(g_ball.x, g_ball.y + g_ball.radius, &rect) == 1) 
	C$game.c$204$1_0$55	= .
	.globl	C$game.c$204$1_0$55
;game.c:204: if (g_ball.vel_y > 0)
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00196$
	xor	a, #0x80
00196$:
	jp	P, 00104$
	C$game.c$207$2_0$56	= .
	.globl	C$game.c$207$2_0$56
;game.c:207: if (InRect(g_ball.x, g_ball.y + g_ball.radius, &rect) == 1) 
	ld	c, e
	ld	b, d
	ld	de, (#(_g_ball + 0x0006) + 0)
	ld	a, (#(_g_ball + 0x0008) + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ex	de, hl
	ld	hl, (#(_g_ball + 0x0004) + 0)
	push	bc
	push	de
	push	hl
	call	_InRect
	pop	af
	pop	af
	pop	af
	ld	a, l
	dec	a
	or	a, h
	jr	NZ,00104$
	C$game.c$209$3_0$57	= .
	.globl	C$game.c$209$3_0$57
;game.c:209: g_ball.vel_y *= -1; 
	ld	hl, (#(_g_ball + 0x0002) + 0)
	xor	a, a
	sub	a, l
	ld	c, a
	ld	a, #0x00
	sbc	a, h
	ld	b, a
	ld	((_g_ball + 0x0002)), bc
	C$game.c$210$3_0$57	= .
	.globl	C$game.c$210$3_0$57
;game.c:210: RandomBallSpeed();
	call	_RandomBallSpeed
00104$:
	C$game.c$215$1_0$55	= .
	.globl	C$game.c$215$1_0$55
;game.c:215: g_ball.x += g_ball.vel_x;
	ld	bc, (#(_g_ball + 0x0004) + 0)
	ld	hl, (#_g_ball + 0)
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	((_g_ball + 0x0004)), bc
	C$game.c$216$1_0$55	= .
	.globl	C$game.c$216$1_0$55
;game.c:216: g_ball.y += g_ball.vel_y;
	ld	de, (#(_g_ball + 0x0006) + 0)
	ld	hl, (#(_g_ball + 0x0002) + 0)
	add	hl, de
	ex	de, hl
	ld	((_g_ball + 0x0006)), de
	C$game.c$219$1_0$55	= .
	.globl	C$game.c$219$1_0$55
;game.c:219: if (g_ball.x + 8 >= g_screen_width - 8)
	ld	hl, #0x0008
	add	hl, bc
	ex	de, hl
	ld	iy, #_g_screen_width
	ld	a, 0 (iy)
	add	a, #0xf8
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0xff
	ld	b, a
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00199$
	xor	a, #0x80
00199$:
	jp	M, 00106$
	C$game.c$221$2_0$58	= .
	.globl	C$game.c$221$2_0$58
;game.c:221: g_ball.vel_x *= -1;
	ld	hl, (#_g_ball + 0)
	xor	a, a
	sub	a, l
	ld	c, a
	ld	a, #0x00
	sbc	a, h
	ld	b, a
	ld	(_g_ball), bc
00106$:
	C$game.c$224$1_0$55	= .
	.globl	C$game.c$224$1_0$55
;game.c:224: if ((g_ball.x - 8) <= 0)
	ld	bc, (#(_g_ball + 0x0004) + 0)
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00200$
	xor	a, #0x80
00200$:
	jp	M, 00108$
	C$game.c$226$2_0$59	= .
	.globl	C$game.c$226$2_0$59
;game.c:226: g_ball.vel_x *= -1;
	ld	hl, (#_g_ball + 0)
	xor	a, a
	sub	a, l
	ld	c, a
	ld	a, #0x00
	sbc	a, h
	ld	b, a
	ld	(_g_ball), bc
00108$:
	C$game.c$229$1_0$55	= .
	.globl	C$game.c$229$1_0$55
;game.c:229: if (g_ball.y - 8 <= 0) {
	ld	bc, (#(_g_ball + 0x0006) + 0)
	ld	a, c
	add	a, #0xf8
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00201$
	xor	a, #0x80
00201$:
	jp	M, 00141$
	C$game.c$230$2_0$60	= .
	.globl	C$game.c$230$2_0$60
;game.c:230: g_ball.vel_y *= -1;
	ld	hl, (#(_g_ball + 0x0002) + 0)
	xor	a, a
	sub	a, l
	ld	c, a
	ld	a, #0x00
	sbc	a, h
	ld	b, a
	ld	((_g_ball + 0x0002)), bc
	C$game.c$234$2_0$55	= .
	.globl	C$game.c$234$2_0$55
;game.c:234: for (int y = 0; y < BRICKS_Y_COUNT; y++)
00141$:
	ld	hl, #4
	add	hl, sp
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	a, 0 (iy)
	inc	iy
	inc	iy
	ld	0 (iy), a
	dec	iy
	dec	iy
	ld	a, 1 (iy)
	inc	iy
	inc	iy
	ld	1 (iy), a
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	iy, #12
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #8+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #12
	add	iy, sp
	ld	1 (iy), a
	xor	a, a
	ld	iy, #22
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
00125$:
	ld	iy, #22
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x05
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00127$
	C$game.c$236$2_0$55	= .
	.globl	C$game.c$236$2_0$55
;game.c:236: for (int x = 0; x < BRICKS_X_COUNT; x++)
	xor	a, a
	inc	iy
	inc	iy
	ld	0 (iy), a
	ld	1 (iy), a
00122$:
	ld	iy, #24
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x0a
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00126$
	C$game.c$238$2_0$55	= .
	.globl	C$game.c$238$2_0$55
;game.c:238: if (g_bricks[x][y] != 0) //벽돌이 존재한다면
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	a, #<(_g_bricks)
	ld	hl, #14
	add	hl, sp
	ld	iy, #20
	add	iy, sp
	add	a, (hl)
	ld	0 (iy), a
	ld	a, #>(_g_bricks)
	inc	hl
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
	ld	hl, #22
	add	hl, sp
	push	de
	ld	iy, #18
	add	iy, sp
	push	iy
	pop	de
	ld	iy, #22
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	(de), a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de), a
	pop	de
	ld	hl, #16
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	or	a, a
	jp	Z, 00123$
	C$game.c$243$6_0$65	= .
	.globl	C$game.c$243$6_0$65
;game.c:243: rect.x1 = x * BRICK_WIDTH;
	ld	hl, #4
	add	hl, sp
	ex	de, hl
	ld	hl, #24+0
	add	hl, sp
	ld	c, (hl)
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
	C$game.c$244$6_0$65	= .
	.globl	C$game.c$244$6_0$65
;game.c:244: rect.y1 = y * BRICK_HEIGHT;
	ld	hl, #8
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	hl, #22+0
	add	hl, sp
	ld	b, (hl)
	ld	a, b
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	ld	(de), a
	C$game.c$245$6_0$65	= .
	.globl	C$game.c$245$6_0$65
;game.c:245: rect.x2 = (x + 1) * BRICK_WIDTH - BRICK_GAP;
	ld	iy, #8
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	de
	inc	de
	inc	c
	ld	a, c
	add	a, a
	add	a, c
	add	a, a
	add	a, a
	add	a, a
	dec	a
	ld	(de), a
	C$game.c$246$6_0$65	= .
	.globl	C$game.c$246$6_0$65
;game.c:246: rect.y2 = (y + 1) * BRICK_HEIGHT - BRICK_GAP;
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	de
	inc	de
	inc	de
	ld	a, b
	inc	a
	add	a, a
	add	a, a
	add	a, a
	add	a, a
	dec	a
	ld	(de), a
	C$game.c$248$7_0$66	= .
	.globl	C$game.c$248$7_0$66
;game.c:248: char result = 0;
	ld	c, #0x00
	C$game.c$249$6_1$66	= .
	.globl	C$game.c$249$6_1$66
;game.c:249: if (g_ball.vel_y > 0)
	ld	hl, (#(_g_ball + 0x0002) + 0)
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00202$
	xor	a, #0x80
00202$:
	jp	P, 00112$
	C$game.c$251$7_1$67	= .
	.globl	C$game.c$251$7_1$67
;game.c:251: result = InRect(g_ball.x, g_ball.y + g_ball.radius, &rect);
	ld	hl, #12+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #12+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	1 (iy), a
	ld	hl, #(_g_ball + 0x0006) + 0
	ld	a, (hl)
	inc	iy
	inc	iy
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	ld	a, (#(_g_ball + 0x0008) + 0)
	ld	c, a
	ld	b, #0x00
	ld	a, 0 (iy)
	add	a, c
	ld	c, a
	ld	a, 1 (iy)
	adc	a, b
	ld	b, a
	ld	hl, (#(_g_ball + 0x0004) + 0)
	dec	iy
	dec	iy
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	push	de
	push	bc
	push	hl
	call	_InRect
	pop	af
	pop	af
	pop	af
	ld	c, l
00112$:
	C$game.c$254$6_1$66	= .
	.globl	C$game.c$254$6_1$66
;game.c:254: if (g_ball.vel_y < 0)
	ld	hl, (#(_g_ball + 0x0002) + 0)
	bit	7, h
	jr	Z,00114$
	C$game.c$256$7_1$68	= .
	.globl	C$game.c$256$7_1$68
;game.c:256: result = InRect(g_ball.x, g_ball.y - g_ball.radius, &rect);
	ld	hl, #10
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, (#(_g_ball + 0x0006) + 0)
	ld	a, (#(_g_ball + 0x0008) + 0)
	ld	iy, #20
	add	iy, sp
	ld	0 (iy), a
	xor	a, a
	ld	1 (iy), a
	ld	hl, #20
	add	hl, sp
	ld	a, e
	sub	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	sbc	a, (hl)
	ld	d, a
	ld	hl, (#(_g_ball + 0x0004) + 0)
	push	bc
	push	de
	push	hl
	call	_InRect
	pop	af
	pop	af
	pop	af
	ld	c, l
00114$:
	C$game.c$259$6_1$66	= .
	.globl	C$game.c$259$6_1$66
;game.c:259: if (result)
	ld	a, c
	or	a, a
	jr	Z,00123$
	C$game.c$261$7_1$69	= .
	.globl	C$game.c$261$7_1$69
;game.c:261: g_ball.vel_y *= -1;
	ld	hl, (#(_g_ball + 0x0002) + 0)
	xor	a, a
	sub	a, l
	ld	c, a
	ld	a, #0x00
	sbc	a, h
	ld	b, a
	ld	((_g_ball + 0x0002)), bc
	C$game.c$262$7_1$69	= .
	.globl	C$game.c$262$7_1$69
;game.c:262: g_bricks[x][y] = 0;
	ld	hl, #16
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
	C$game.c$263$7_1$69	= .
	.globl	C$game.c$263$7_1$69
;game.c:263: g_bricks_dirty_map[x][y] = 1;
	ld	a, #<(_g_bricks_dirty_map)
	ld	hl, #14
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, #>(_g_bricks_dirty_map)
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	hl, #22
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	(hl), #0x01
00123$:
	C$game.c$236$4_0$63	= .
	.globl	C$game.c$236$4_0$63
;game.c:236: for (int x = 0; x < BRICKS_X_COUNT; x++)
	ld	iy, #24
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00122$
	inc	1 (iy)
	jp	00122$
00126$:
	C$game.c$234$2_0$61	= .
	.globl	C$game.c$234$2_0$61
;game.c:234: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	ld	iy, #22
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00125$
	inc	1 (iy)
	jp	00125$
00127$:
	C$game.c$268$2_0$55	= .
	.globl	C$game.c$268$2_0$55
;game.c:268: }
	ld	hl, #26
	add	hl, sp
	ld	sp, hl
	C$game.c$268$2_0$55	= .
	.globl	C$game.c$268$2_0$55
	XG$ProcessBall$0$0	= .
	.globl	XG$ProcessBall$0$0
	ret
	G$CheckGameEnd$0$0	= .
	.globl	G$CheckGameEnd$0$0
	C$game.c$270$2_0$70	= .
	.globl	C$game.c$270$2_0$70
;game.c:270: void CheckGameEnd()
;	---------------------------------
; Function CheckGameEnd
; ---------------------------------
_CheckGameEnd::
	C$game.c$272$1_0$70	= .
	.globl	C$game.c$272$1_0$70
;game.c:272: if (GetBrickCount() == 0)
	call	_GetBrickCount
	ld	a, h
	or	a, l
	jr	NZ,00102$
	C$game.c$273$1_0$70	= .
	.globl	C$game.c$273$1_0$70
;game.c:273: g_gamestate = STATE_GAME_CLEAR;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x03
00102$:
	C$game.c$276$1_0$70	= .
	.globl	C$game.c$276$1_0$70
;game.c:276: if (g_ball.y >= g_screen_height)
	ld	bc, (#(_g_ball + 0x0006) + 0)
	ld	hl, #_g_screen_height
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00117$
	xor	a, #0x80
00117$:
	ret	M
	C$game.c$277$1_0$70	= .
	.globl	C$game.c$277$1_0$70
;game.c:277: g_gamestate = STATE_GAME_OVER;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$278$1_0$70	= .
	.globl	C$game.c$278$1_0$70
;game.c:278: }
	C$game.c$278$1_0$70	= .
	.globl	C$game.c$278$1_0$70
	XG$CheckGameEnd$0$0	= .
	.globl	XG$CheckGameEnd$0$0
	ret
	G$InitGame$0$0	= .
	.globl	G$InitGame$0$0
	C$game.c$280$1_0$72	= .
	.globl	C$game.c$280$1_0$72
;game.c:280: void InitGame(int screen_width, int screen_height)
;	---------------------------------
; Function InitGame
; ---------------------------------
_InitGame::
	C$game.c$282$1_0$72	= .
	.globl	C$game.c$282$1_0$72
;game.c:282: g_screen_width = screen_width;
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(_g_screen_width+0), a
	ld	a, 1 (iy)
	ld	(_g_screen_width+1), a
	C$game.c$283$1_0$72	= .
	.globl	C$game.c$283$1_0$72
;game.c:283: g_screen_height = screen_height;
	inc	iy
	inc	iy
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	(_g_screen_height), bc
	C$game.c$285$1_0$72	= .
	.globl	C$game.c$285$1_0$72
;game.c:285: g_paddle_posy = screen_height - PADDLE_HEIGHT;
	ld	hl, #_g_paddle_posy
	ld	a, c
	add	a, #0xf0
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
	C$game.c$286$1_0$72	= .
	.globl	C$game.c$286$1_0$72
;game.c:286: g_paddle_posx = g_screen_width / 2 - PADDLE_WIDTH;
	ld	bc, (_g_screen_width)
	bit	7, b
	jr	Z,00103$
	inc	bc
00103$:
	sra	b
	rr	c
	ld	hl, #_g_paddle_posx
	ld	a, c
	add	a, #0xe0
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
	C$game.c$288$1_0$72	= .
	.globl	C$game.c$288$1_0$72
;game.c:288: ResetStage();
	call	_ResetStage
	C$game.c$289$1_0$72	= .
	.globl	C$game.c$289$1_0$72
;game.c:289: ResetBall();
	C$game.c$292$1_0$72	= .
	.globl	C$game.c$292$1_0$72
;game.c:292: }
	C$game.c$292$1_0$72	= .
	.globl	C$game.c$292$1_0$72
	XG$InitGame$0$0	= .
	.globl	XG$InitGame$0$0
	jp	_ResetBall
	G$ProcessLogic$0$0	= .
	.globl	G$ProcessLogic$0$0
	C$game.c$294$1_0$74	= .
	.globl	C$game.c$294$1_0$74
;game.c:294: void ProcessLogic(int mouse_posx)
;	---------------------------------
; Function ProcessLogic
; ---------------------------------
_ProcessLogic::
	C$game.c$296$1_0$74	= .
	.globl	C$game.c$296$1_0$74
;game.c:296: ProcessInput(mouse_posx);
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	call	_ProcessInput
	pop	af
	C$game.c$297$1_0$74	= .
	.globl	C$game.c$297$1_0$74
;game.c:297: ProcessBall();
	call	_ProcessBall
	C$game.c$298$1_0$74	= .
	.globl	C$game.c$298$1_0$74
;game.c:298: CheckGameEnd();
	C$game.c$299$1_0$74	= .
	.globl	C$game.c$299$1_0$74
;game.c:299: }
	C$game.c$299$1_0$74	= .
	.globl	C$game.c$299$1_0$74
	XG$ProcessLogic$0$0	= .
	.globl	XG$ProcessLogic$0$0
	jp	_CheckGameEnd
	G$DrawWorld$0$0	= .
	.globl	G$DrawWorld$0$0
	C$game.c$301$1_0$75	= .
	.globl	C$game.c$301$1_0$75
;game.c:301: void DrawWorld()
;	---------------------------------
; Function DrawWorld
; ---------------------------------
_DrawWorld::
	push	af
	push	af
	C$game.c$304$5_0$79	= .
	.globl	C$game.c$304$5_0$79
;game.c:304: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	ld	bc, #0x0000
00109$:
	ld	a, c
	sub	a, #0x05
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00104$
	C$game.c$306$6_0$80	= .
	.globl	C$game.c$306$6_0$80
;game.c:306: for (int x = 0; x < BRICKS_X_COUNT; x++)
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	sla	0 (iy)
	rl	1 (iy)
	xor	a, a
	inc	iy
	inc	iy
	ld	0 (iy), a
	ld	1 (iy), a
00106$:
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x0a
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00110$
	C$game.c$308$5_0$79	= .
	.globl	C$game.c$308$5_0$79
;game.c:308: if (g_bricks_dirty_map[x][y] == 1)
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	de, #_g_bricks_dirty_map
	add	hl, de
	add	hl, bc
	ld	a, (hl)
	C$game.c$310$6_0$80	= .
	.globl	C$game.c$310$6_0$80
;game.c:310: g_bricks_dirty_map[x][y] = 0;
	dec	a
	jr	NZ,00107$
	ld	(hl),a
	C$game.c$311$6_0$80	= .
	.globl	C$game.c$311$6_0$80
;game.c:311: EraseTiles(x * 3, y * 2, 3, 2, BLACK_TILE);
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	push	bc
	ld	de, #0x0055
	push	de
	ld	de, #0x0002
	push	de
	ld	de, #0x0003
	push	de
	dec	iy
	dec	iy
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	push	de
	push	hl
	call	_EraseTiles
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	pop	bc
00107$:
	C$game.c$306$4_0$78	= .
	.globl	C$game.c$306$4_0$78
;game.c:306: for (int x = 0; x < BRICKS_X_COUNT; x++)
	ld	iy, #2
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00106$
	inc	1 (iy)
	jr	00106$
00110$:
	C$game.c$304$2_0$76	= .
	.globl	C$game.c$304$2_0$76
;game.c:304: for (int y = 0; y < BRICKS_Y_COUNT; y++)
	inc	bc
	jp	00109$
00104$:
	C$game.c$317$1_0$75	= .
	.globl	C$game.c$317$1_0$75
;game.c:317: sp.x = g_ball.x - 8;
	ld	bc, #_sp+0
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (#_g_ball + 4)
	add	a, #0xf8
	ld	(de), a
	C$game.c$318$1_0$75	= .
	.globl	C$game.c$318$1_0$75
;game.c:318: sp.y = g_ball.y - 8;
	ld	a, (#_g_ball + 6)
	add	a, #0xf8
	ld	(bc), a
	C$game.c$319$1_0$75	= .
	.globl	C$game.c$319$1_0$75
;game.c:319: sp.pattern = g_pat_base + 0 * 8;
	ld	hl, #(_sp + 0x0002)
	ld	a,(#_g_pat_base + 0)
	ld	(hl), a
	C$game.c$321$1_0$75	= .
	.globl	C$game.c$321$1_0$75
;game.c:321: sp.attr = 13;
	ld	hl, #(_sp + 0x0003)
	ld	(hl), #0x0d
	C$game.c$322$1_0$75	= .
	.globl	C$game.c$322$1_0$75
;game.c:322: spman_alloc_sprite(&sp);
	ld	l, c
	ld	h, b
	push	bc
	push	de
	push	hl
	call	_spman_alloc_sprite
	pop	af
	pop	de
	pop	bc
	C$game.c$325$1_0$75	= .
	.globl	C$game.c$325$1_0$75
;game.c:325: sp.x = g_paddle_posx;
	ld	a,(#_g_paddle_posx + 0)
	ld	(de), a
	C$game.c$326$1_0$75	= .
	.globl	C$game.c$326$1_0$75
;game.c:326: sp.y = g_paddle_posy;
	ld	a,(#_g_paddle_posy + 0)
	ld	(bc), a
	C$game.c$327$1_0$75	= .
	.globl	C$game.c$327$1_0$75
;game.c:327: sp.pattern = g_pat_base + 1 * 8;
	ld	a,(#_g_pat_base + 0)
	add	a, #0x08
	ld	(#(_sp + 0x0002)),a
	C$game.c$329$1_0$75	= .
	.globl	C$game.c$329$1_0$75
;game.c:329: sp.attr = 15;
	ld	hl, #(_sp + 0x0003)
	ld	(hl), #0x0f
	C$game.c$330$1_0$75	= .
	.globl	C$game.c$330$1_0$75
;game.c:330: spman_alloc_sprite(&sp);
	ld	l, c
	ld	h, b
	push	bc
	push	de
	push	hl
	call	_spman_alloc_sprite
	pop	af
	pop	de
	pop	bc
	C$game.c$332$1_0$75	= .
	.globl	C$game.c$332$1_0$75
;game.c:332: sp.x = g_paddle_posx + PADDLE_WIDTH / 2;
	ld	a,(#_g_paddle_posx + 0)
	add	a, #0x10
	ld	(de), a
	C$game.c$333$1_0$75	= .
	.globl	C$game.c$333$1_0$75
;game.c:333: sp.y = g_paddle_posy;
	ld	a,(#_g_paddle_posy + 0)
	ld	(bc), a
	C$game.c$334$1_0$75	= .
	.globl	C$game.c$334$1_0$75
;game.c:334: sp.pattern = g_pat_base + 1 * 8;
	ld	a,(#_g_pat_base + 0)
	add	a, #0x08
	ld	(#(_sp + 0x0002)),a
	C$game.c$336$1_0$75	= .
	.globl	C$game.c$336$1_0$75
;game.c:336: sp.attr = 11;
	ld	hl, #(_sp + 0x0003)
	ld	(hl), #0x0b
	C$game.c$337$1_0$75	= .
	.globl	C$game.c$337$1_0$75
;game.c:337: spman_alloc_sprite(&sp);
	push	bc
	call	_spman_alloc_sprite
	pop	af
	C$game.c$338$1_0$75	= .
	.globl	C$game.c$338$1_0$75
;game.c:338: }
	pop	af
	pop	af
	C$game.c$338$1_0$75	= .
	.globl	C$game.c$338$1_0$75
	XG$DrawWorld$0$0	= .
	.globl	XG$DrawWorld$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Fgame$__xinit_g_pat_base$0_0$0 == .
__xinit__g_pat_base:
	.db #0x00	; 0
Fgame$__xinit_g_screen_width$0_0$0 == .
__xinit__g_screen_width:
	.dw #0x0000
Fgame$__xinit_g_screen_height$0_0$0 == .
__xinit__g_screen_height:
	.dw #0x0000
Fgame$__xinit_g_paddle_posx$0_0$0 == .
__xinit__g_paddle_posx:
	.dw #0x0000
Fgame$__xinit_g_paddle_posy$0_0$0 == .
__xinit__g_paddle_posy:
	.dw #0x0000
	.area _CABS (ABS)
