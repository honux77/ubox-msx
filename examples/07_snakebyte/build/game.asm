;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _CheckWall
	.globl _MoveBody
	.globl _now
	.globl _RenderTile
	.globl _malloc
	.globl _srand
	.globl _rand
	.globl _ubox_read_keys
	.globl _ubox_wait
	.globl _ubox_fill_screen
	.globl _ubox_disable_screen
	.globl _ubox_enable_screen
	.globl _g_player
	.globl _g_next_input_step
	.globl _g_next_step
	.globl _input_step_time
	.globl _step_time
	.globl _g_score
	.globl _g_objMap
	.globl _run_game
	.globl _InitGame
	.globl _GenerateNewFrog
	.globl _ProcessLogic
	.globl _DrawObject
	.globl _DrawBackground
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$g_objMap$0_0$0==.
_g_objMap::
	.ds 600
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$g_score$0_0$0==.
_g_score::
	.ds 2
G$step_time$0_0$0==.
_step_time::
	.ds 2
G$input_step_time$0_0$0==.
_input_step_time::
	.ds 2
G$g_next_step$0_0$0==.
_g_next_step::
	.ds 4
G$g_next_input_step$0_0$0==.
_g_next_input_step::
	.ds 4
G$g_player$0_0$0==.
_g_player::
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
	G$run_game$0$0	= .
	.globl	G$run_game$0$0
	C$game.c$60$0_0$81	= .
	.globl	C$game.c$60$0_0$81
;game.c:60: void run_game()
;	---------------------------------
; Function run_game
; ---------------------------------
_run_game::
	C$game.c$62$1_0$81	= .
	.globl	C$game.c$62$1_0$81
;game.c:62: g_gamestate = STATE_IN_GAME;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x01
	C$game.c$64$1_0$81	= .
	.globl	C$game.c$64$1_0$81
;game.c:64: InitGame();
	call	_InitGame
	C$game.c$65$1_0$81	= .
	.globl	C$game.c$65$1_0$81
;game.c:65: ubox_disable_screen();
	call	_ubox_disable_screen
	C$game.c$66$1_0$81	= .
	.globl	C$game.c$66$1_0$81
;game.c:66: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$game.c$67$1_0$81	= .
	.globl	C$game.c$67$1_0$81
;game.c:67: DrawBackground();
	call	_DrawBackground
	C$game.c$68$1_0$81	= .
	.globl	C$game.c$68$1_0$81
;game.c:68: ubox_enable_screen();
	call	_ubox_enable_screen
	C$game.c$70$1_0$81	= .
	.globl	C$game.c$70$1_0$81
;game.c:70: while (1)
00106$:
	C$game.c$72$2_0$82	= .
	.globl	C$game.c$72$2_0$82
;game.c:72: if (ubox_read_keys(7) == UBOX_MSX_KEY_ESC)
	ld	l, #0x07
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x04
	ret	Z
	C$game.c$75$2_0$82	= .
	.globl	C$game.c$75$2_0$82
;game.c:75: ProcessLogic(g_player);
	ld	hl, (_g_player)
	push	hl
	call	_ProcessLogic
	pop	af
	C$game.c$77$2_0$82	= .
	.globl	C$game.c$77$2_0$82
;game.c:77: DrawObject();
	call	_DrawObject
	C$game.c$79$2_0$82	= .
	.globl	C$game.c$79$2_0$82
;game.c:79: ubox_wait();
	call	_ubox_wait
	C$game.c$81$2_0$82	= .
	.globl	C$game.c$81$2_0$82
;game.c:81: if (g_gamestate == STATE_GAME_OVER)
	ld	a,(#_g_gamestate + 0)
	sub	a, #0x02
	jr	NZ,00106$
	C$game.c$82$1_0$81	= .
	.globl	C$game.c$82$1_0$81
;game.c:82: break;
	C$game.c$84$1_0$81	= .
	.globl	C$game.c$84$1_0$81
;game.c:84: }
	C$game.c$84$1_0$81	= .
	.globl	C$game.c$84$1_0$81
	XG$run_game$0$0	= .
	.globl	XG$run_game$0$0
	ret
	G$InitGame$0$0	= .
	.globl	G$InitGame$0$0
	C$game.c$86$1_0$83	= .
	.globl	C$game.c$86$1_0$83
;game.c:86: void InitGame()
;	---------------------------------
; Function InitGame
; ---------------------------------
_InitGame::
	push	af
	push	af
	C$game.c$88$1_0$83	= .
	.globl	C$game.c$88$1_0$83
;game.c:88: srand(now());
	call	_now
	push	hl
	call	_srand
	C$game.c$91$1_0$83	= .
	.globl	C$game.c$91$1_0$83
;game.c:91: g_player = malloc(sizeof(SnakeNode));
	ld	hl, #0x0006
	ex	(sp),hl
	call	_malloc
	pop	af
	ld	(_g_player), hl
	C$game.c$92$1_0$83	= .
	.globl	C$game.c$92$1_0$83
;game.c:92: g_player->dir = rand() % 4; //초기 방향
	ld	bc, (_g_player)
	push	bc
	call	_rand
	ld	de, #0x0004
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	C$game.c$94$1_0$83	= .
	.globl	C$game.c$94$1_0$83
;game.c:94: g_player->x = MAP_WIDTH / 2;
	ld	hl, (_g_player)
	inc	hl
	inc	hl
	ld	(hl), #0x0f
	C$game.c$95$1_0$83	= .
	.globl	C$game.c$95$1_0$83
;game.c:95: g_player->y = MAP_HEIGHT / 2;
	ld	hl, (_g_player)
	inc	hl
	inc	hl
	inc	hl
	ld	a, h
	ld	h, a
	ld	(hl), #0x0a
	C$game.c$96$1_0$83	= .
	.globl	C$game.c$96$1_0$83
;game.c:96: g_player->next = NULL;
	ld	hl, (_g_player)
	ld	bc, #0x0004
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$99$5_1$88	= .
	.globl	C$game.c$99$5_1$88
;game.c:99: for (i = 0; i < MAP_HEIGHT; i++)
	ld	bc, #0x0000
	C$game.c$101$1_1$83	= .
	.globl	C$game.c$101$1_1$83
;game.c:101: for (j = 0; j < MAP_WIDTH; j++)
00109$:
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	a, e
	ld	hl, #0
	add	hl, sp
	add	a, #<(_g_objMap)
	ld	(hl), a
	ld	a, d
	adc	a, #>(_g_objMap)
	inc	hl
	ld	(hl), a
	ld	de, #0x0000
00103$:
	C$game.c$103$5_1$88	= .
	.globl	C$game.c$103$5_1$88
;game.c:103: g_objMap[i][j] = NOTHING;
	ld	hl, #2
	add	hl, sp
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	add	a, e
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, d
	inc	hl
	ld	(hl), a
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), #0x00
	C$game.c$101$4_1$87	= .
	.globl	C$game.c$101$4_1$87
;game.c:101: for (j = 0; j < MAP_WIDTH; j++)
	inc	de
	ld	a, e
	sub	a, #0x1e
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00103$
	C$game.c$99$2_1$85	= .
	.globl	C$game.c$99$2_1$85
;game.c:99: for (i = 0; i < MAP_HEIGHT; i++)
	inc	bc
	ld	a, c
	sub	a, #0x14
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00109$
	C$game.c$107$1_1$84	= .
	.globl	C$game.c$107$1_1$84
;game.c:107: GenerateNewFrog();
	call	_GenerateNewFrog
	C$game.c$109$1_1$84	= .
	.globl	C$game.c$109$1_1$84
;game.c:109: g_next_step = now() + step_time;
	call	_now
	ld	de, (_step_time)
	add	hl, de
	ld	iy, #_g_next_step
	ld	0 (iy), l
	ld	a, h
	ld	(_g_next_step+1), a
	rla
	sbc	a, a
	ld	(_g_next_step+2), a
	ld	(_g_next_step+3), a
	C$game.c$110$1_1$84	= .
	.globl	C$game.c$110$1_1$84
;game.c:110: g_next_input_step = now() + input_step_time;
	call	_now
	ld	de, (_input_step_time)
	add	hl, de
	ld	iy, #_g_next_input_step
	ld	0 (iy), l
	ld	a, h
	ld	(_g_next_input_step+1), a
	rla
	sbc	a, a
	ld	(_g_next_input_step+2), a
	ld	(_g_next_input_step+3), a
	C$game.c$111$1_1$83	= .
	.globl	C$game.c$111$1_1$83
;game.c:111: }
	pop	af
	pop	af
	C$game.c$111$1_1$83	= .
	.globl	C$game.c$111$1_1$83
	XG$InitGame$0$0	= .
	.globl	XG$InitGame$0$0
	ret
	G$MoveBody$0$0	= .
	.globl	G$MoveBody$0$0
	C$game.c$113$1_1$90	= .
	.globl	C$game.c$113$1_1$90
;game.c:113: SnakeNode* MoveBody(SnakeNode *node, int xPos, int yPos) 
;	---------------------------------
; Function MoveBody
; ---------------------------------
_MoveBody::
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
	C$game.c$115$1_0$90	= .
	.globl	C$game.c$115$1_0$90
;game.c:115: if (node->next == NULL) 
	ld	hl, #11
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #0x0004
	add	hl, bc
	ex	(sp), hl
	pop	hl
	push	hl
	ld	a, (hl)
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	C$game.c$117$1_0$90	= .
	.globl	C$game.c$117$1_0$90
;game.c:117: g_objMap[node->y][ node->x] = NOTHING;
	ld	hl, #0x0003
	add	hl, bc
	inc	iy
	inc	iy
	ld	0 (iy), l
	ld	1 (iy), h
	ld	hl, #0x0002
	add	hl, bc
	inc	iy
	inc	iy
	ld	0 (iy), l
	ld	1 (iy), h
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	e, (hl)
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	inc	iy
	inc	iy
	ld	0 (iy), a
	C$game.c$115$1_0$90	= .
	.globl	C$game.c$115$1_0$90
;game.c:115: if (node->next == NULL) 
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ,00102$
	C$game.c$117$2_0$91	= .
	.globl	C$game.c$117$2_0$91
;game.c:117: g_objMap[node->y][ node->x] = NOTHING;
	ld	a, e
	rlc	a
	sbc	a, a
	ld	d, a
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de, hl
	ld	hl, #_g_objMap
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	hl, #8
	add	hl, sp
	add	a, (hl)
	ld	e, a
	jr	NC,00111$
	inc	d
00111$:
	xor	a, a
	ld	(de), a
	jr	00103$
00102$:
	C$game.c$121$2_0$92	= .
	.globl	C$game.c$121$2_0$92
;game.c:121: node->next = MoveBody(node->next, node->x, node->y);
	ld	a, e
	rla
	sbc	a, a
	ld	d, a
	ld	hl, #8+0
	add	hl, sp
	ld	a, (hl)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	push	bc
	push	de
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_MoveBody
	pop	af
	pop	af
	pop	af
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	pop	bc
	pop	hl
	push	hl
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
00103$:
	C$game.c$123$1_0$90	= .
	.globl	C$game.c$123$1_0$90
;game.c:123: node->x = xPos;
	ld	hl, #13+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$124$1_0$90	= .
	.globl	C$game.c$124$1_0$90
;game.c:124: node->y = yPos;
	ld	hl, #15+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$125$1_0$90	= .
	.globl	C$game.c$125$1_0$90
;game.c:125: return node;
	ld	l, c
	ld	h, b
	C$game.c$126$1_0$90	= .
	.globl	C$game.c$126$1_0$90
;game.c:126: }
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	C$game.c$126$1_0$90	= .
	.globl	C$game.c$126$1_0$90
	XG$MoveBody$0$0	= .
	.globl	XG$MoveBody$0$0
	ret
	G$GenerateNewFrog$0$0	= .
	.globl	G$GenerateNewFrog$0$0
	C$game.c$129$1_0$93	= .
	.globl	C$game.c$129$1_0$93
;game.c:129: void GenerateNewFrog()
;	---------------------------------
; Function GenerateNewFrog
; ---------------------------------
_GenerateNewFrog::
	C$game.c$133$1_0$93	= .
	.globl	C$game.c$133$1_0$93
;game.c:133: do
00101$:
	C$game.c$135$2_0$94	= .
	.globl	C$game.c$135$2_0$94
;game.c:135: randy = (int)(rand() % MAP_HEIGHT);
	call	_rand
	ld	bc, #0x0014
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	C$game.c$136$2_0$94	= .
	.globl	C$game.c$136$2_0$94
;game.c:136: randx = (int)(rand() % MAP_WIDTH);
	push	bc
	call	_rand
	ld	de, #0x001e
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	e, l
	C$game.c$138$1_0$93	= .
	.globl	C$game.c$138$1_0$93
;game.c:138: } while (g_objMap[randy][randx] != NOTHING);
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	bc, #_g_objMap
	add	hl, bc
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ,00101$
	C$game.c$139$1_0$93	= .
	.globl	C$game.c$139$1_0$93
;game.c:139: g_objMap[randy][randx] = FROG;
	ld	(hl), #0x01
	C$game.c$140$1_0$93	= .
	.globl	C$game.c$140$1_0$93
;game.c:140: }
	C$game.c$140$1_0$93	= .
	.globl	C$game.c$140$1_0$93
	XG$GenerateNewFrog$0$0	= .
	.globl	XG$GenerateNewFrog$0$0
	ret
	G$CheckWall$0$0	= .
	.globl	G$CheckWall$0$0
	C$game.c$142$1_0$96	= .
	.globl	C$game.c$142$1_0$96
;game.c:142: char CheckWall(SnakeNode *player)
;	---------------------------------
; Function CheckWall
; ---------------------------------
_CheckWall::
	dec	sp
	C$game.c$144$2_0$96	= .
	.globl	C$game.c$144$2_0$96
;game.c:144: char result = 1;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x01
	C$game.c$145$1_0$96	= .
	.globl	C$game.c$145$1_0$96
;game.c:145: if (player->dir == LEFT)
	inc	iy
	inc	iy
	inc	iy
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, d
	or	a, e
	jr	NZ,00118$
	C$game.c$147$2_0$97	= .
	.globl	C$game.c$147$2_0$97
;game.c:147: if (player->x > 0)		
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	c, (hl)
	xor	a, a
	sub	a, c
	jp	PO, 00162$
	xor	a, #0x80
00162$:
	jp	P, 00119$
	C$game.c$148$2_0$97	= .
	.globl	C$game.c$148$2_0$97
;game.c:148: result = 0;				
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00118$:
	C$game.c$150$1_0$96	= .
	.globl	C$game.c$150$1_0$96
;game.c:150: else if (player->dir == RIGHT)
	ld	a, e
	dec	a
	or	a, d
	jr	NZ,00115$
	C$game.c$152$2_0$98	= .
	.globl	C$game.c$152$2_0$98
;game.c:152: if (player->x < MAP_WIDTH - 1)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x9d
	jr	NC,00119$
	C$game.c$153$2_0$98	= .
	.globl	C$game.c$153$2_0$98
;game.c:153: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00115$:
	C$game.c$155$1_0$96	= .
	.globl	C$game.c$155$1_0$96
;game.c:155: else if (player->dir == UP)
	ld	a, e
	sub	a, #0x02
	or	a, d
	jr	NZ,00112$
	C$game.c$157$2_0$99	= .
	.globl	C$game.c$157$2_0$99
;game.c:157: if (player->y > 0)		
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	xor	a, a
	sub	a, c
	jp	PO, 00167$
	xor	a, #0x80
00167$:
	jp	P, 00119$
	C$game.c$158$2_0$99	= .
	.globl	C$game.c$158$2_0$99
;game.c:158: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00112$:
	C$game.c$160$1_0$96	= .
	.globl	C$game.c$160$1_0$96
;game.c:160: else if (player->dir == DOWN)
	ld	a, e
	sub	a, #0x03
	or	a, d
	jr	NZ,00119$
	C$game.c$162$2_0$100	= .
	.globl	C$game.c$162$2_0$100
;game.c:162: if (player->y < MAP_HEIGHT - 1)			
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x93
	jr	NC,00119$
	C$game.c$163$2_0$100	= .
	.globl	C$game.c$163$2_0$100
;game.c:163: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
00119$:
	C$game.c$166$1_0$96	= .
	.globl	C$game.c$166$1_0$96
;game.c:166: return result;
	ld	iy, #0
	add	iy, sp
	ld	l, 0 (iy)
	C$game.c$167$1_0$96	= .
	.globl	C$game.c$167$1_0$96
;game.c:167: }
	inc	sp
	C$game.c$167$1_0$96	= .
	.globl	C$game.c$167$1_0$96
	XG$CheckWall$0$0	= .
	.globl	XG$CheckWall$0$0
	ret
	G$ProcessLogic$0$0	= .
	.globl	G$ProcessLogic$0$0
	C$game.c$169$1_0$102	= .
	.globl	C$game.c$169$1_0$102
;game.c:169: void ProcessLogic(SnakeNode *player)
;	---------------------------------
; Function ProcessLogic
; ---------------------------------
_ProcessLogic::
	ld	hl, #-10
	add	hl, sp
	ld	sp, hl
	C$game.c$171$1_0$102	= .
	.globl	C$game.c$171$1_0$102
;game.c:171: if (g_gamestate != STATE_IN_GAME)
	ld	a,(#_g_gamestate + 0)
	dec	a
	C$game.c$172$1_0$102	= .
	.globl	C$game.c$172$1_0$102
;game.c:172: return;
	jp	NZ,00126$
	C$game.c$175$1_0$102	= .
	.globl	C$game.c$175$1_0$102
;game.c:175: if (now() > g_next_input_step)
	call	_now
	ld	c, l
	ld	a, h
	ld	b, a
	rla
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	hl, #_g_next_input_step
	ld	a, (hl)
	sub	a, c
	inc	hl
	ld	a, (hl)
	sbc	a, b
	inc	hl
	ld	a, (hl)
	sbc	a, e
	inc	hl
	ld	a, (hl)
	sbc	a, d
	jp	PO, 00209$
	xor	a, #0x80
00209$:
	jp	P, 00126$
	C$game.c$178$2_0$103	= .
	.globl	C$game.c$178$2_0$103
;game.c:178: g_next_input_step = now() + input_step_time;
	call	_now
	ld	de, (_input_step_time)
	add	hl, de
	ld	iy, #_g_next_input_step
	ld	0 (iy), l
	ld	a, h
	ld	(_g_next_input_step+1), a
	rla
	sbc	a, a
	ld	(_g_next_input_step+2), a
	ld	(_g_next_input_step+3), a
	C$game.c$179$3_0$104	= .
	.globl	C$game.c$179$3_0$104
;game.c:179: char x_offset = 0;
	C$game.c$180$3_0$104	= .
	.globl	C$game.c$180$3_0$104
;game.c:180: char y_offset = 0;
	ld	bc, #0x0000
	C$game.c$182$2_1$104	= .
	.globl	C$game.c$182$2_1$104
;game.c:182: switch(ubox_read_keys(8))
	push	bc
	ld	l, #0x08
	call	_ubox_read_keys
	pop	bc
	C$game.c$185$1_0$102	= .
	.globl	C$game.c$185$1_0$102
;game.c:185: player->dir = LEFT;
	ld	iy, #12
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	C$game.c$182$2_1$104	= .
	.globl	C$game.c$182$2_1$104
;game.c:182: switch(ubox_read_keys(8))
	ld	a,l
	cp	a,#0x10
	jr	Z,00103$
	cp	a,#0x20
	jr	Z,00105$
	cp	a,#0x40
	jr	Z,00106$
	sub	a, #0x80
	jr	Z,00104$
	jr	00107$
	C$game.c$184$3_1$105	= .
	.globl	C$game.c$184$3_1$105
;game.c:184: case UBOX_MSX_KEY_LEFT:
00103$:
	C$game.c$185$3_1$105	= .
	.globl	C$game.c$185$3_1$105
;game.c:185: player->dir = LEFT;
	ld	l, e
	ld	h, d
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$186$3_1$105	= .
	.globl	C$game.c$186$3_1$105
;game.c:186: break;
	jr	00107$
	C$game.c$187$3_1$105	= .
	.globl	C$game.c$187$3_1$105
;game.c:187: case UBOX_MSX_KEY_RIGHT:
00104$:
	C$game.c$188$3_1$105	= .
	.globl	C$game.c$188$3_1$105
;game.c:188: player->dir = RIGHT;
	ld	l, e
	ld	h, d
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	C$game.c$189$3_1$105	= .
	.globl	C$game.c$189$3_1$105
;game.c:189: break;
	jr	00107$
	C$game.c$190$3_1$105	= .
	.globl	C$game.c$190$3_1$105
;game.c:190: case UBOX_MSX_KEY_UP:
00105$:
	C$game.c$191$3_1$105	= .
	.globl	C$game.c$191$3_1$105
;game.c:191: player->dir = UP;
	ld	l, e
	ld	h, d
	ld	(hl), #0x02
	inc	hl
	ld	(hl), #0x00
	C$game.c$192$3_1$105	= .
	.globl	C$game.c$192$3_1$105
;game.c:192: break;
	jr	00107$
	C$game.c$193$3_1$105	= .
	.globl	C$game.c$193$3_1$105
;game.c:193: case UBOX_MSX_KEY_DOWN:
00106$:
	C$game.c$194$3_1$105	= .
	.globl	C$game.c$194$3_1$105
;game.c:194: player->dir = DOWN;
	ld	l, e
	ld	h, d
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
	C$game.c$196$2_1$104	= .
	.globl	C$game.c$196$2_1$104
;game.c:196: }
00107$:
	C$game.c$198$2_1$104	= .
	.globl	C$game.c$198$2_1$104
;game.c:198: switch(player->dir)
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	or	a, a
	or	a, h
	jr	Z,00108$
	ld	a, l
	dec	a
	or	a, h
	jr	Z,00109$
	ld	a, l
	sub	a, #0x02
	or	a, h
	jr	Z,00110$
	ld	a, l
	sub	a, #0x03
	or	a, h
	jr	Z,00111$
	jr	00112$
	C$game.c$200$3_1$106	= .
	.globl	C$game.c$200$3_1$106
;game.c:200: case LEFT:
00108$:
	C$game.c$201$3_1$106	= .
	.globl	C$game.c$201$3_1$106
;game.c:201: x_offset = -1;
	ld	c, #0xff
	C$game.c$202$3_1$106	= .
	.globl	C$game.c$202$3_1$106
;game.c:202: break;
	jr	00112$
	C$game.c$203$3_1$106	= .
	.globl	C$game.c$203$3_1$106
;game.c:203: case RIGHT:			
00109$:
	C$game.c$204$3_1$106	= .
	.globl	C$game.c$204$3_1$106
;game.c:204: x_offset = 1;
	ld	c, #0x01
	C$game.c$205$3_1$106	= .
	.globl	C$game.c$205$3_1$106
;game.c:205: break;
	jr	00112$
	C$game.c$206$3_1$106	= .
	.globl	C$game.c$206$3_1$106
;game.c:206: case UP:			
00110$:
	C$game.c$207$3_1$106	= .
	.globl	C$game.c$207$3_1$106
;game.c:207: y_offset = -1;
	ld	b, #0xff
	C$game.c$208$3_1$106	= .
	.globl	C$game.c$208$3_1$106
;game.c:208: break;
	jr	00112$
	C$game.c$209$3_1$106	= .
	.globl	C$game.c$209$3_1$106
;game.c:209: case DOWN:			
00111$:
	C$game.c$210$3_1$106	= .
	.globl	C$game.c$210$3_1$106
;game.c:210: y_offset = 1;
	ld	b, #0x01
	C$game.c$212$2_1$104	= .
	.globl	C$game.c$212$2_1$104
;game.c:212: }
00112$:
	C$game.c$214$2_1$104	= .
	.globl	C$game.c$214$2_1$104
;game.c:214: if (now() > g_next_step)
	push	bc
	push	de
	call	_now
	pop	de
	pop	bc
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), l
	ld	a, h
	ld	1 (iy), a
	rla
	sbc	a, a
	ld	2 (iy), a
	ld	3 (iy), a
	ld	hl, #_g_next_step
	ld	a, (hl)
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 2 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 3 (iy)
	jp	PO, 00218$
	xor	a, #0x80
00218$:
	jp	P, 00126$
	C$game.c$216$3_1$107	= .
	.globl	C$game.c$216$3_1$107
;game.c:216: if(CheckWall(player))
	push	bc
	push	de
	push	de
	call	_CheckWall
	pop	af
	ld	a, l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00114$
	C$game.c$218$4_1$108	= .
	.globl	C$game.c$218$4_1$108
;game.c:218: g_gamestate = STATE_GAME_OVER;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$219$4_1$108	= .
	.globl	C$game.c$219$4_1$108
;game.c:219: return;
	jp	00126$
00114$:
	C$game.c$222$3_2$109	= .
	.globl	C$game.c$222$3_2$109
;game.c:222: char next_pos_x = player->x + x_offset;
	inc	sp
	inc	sp
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	add	a, c
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), a
	C$game.c$223$3_2$109	= .
	.globl	C$game.c$223$3_2$109
;game.c:223: char next_pos_y = player->y + y_offset;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	add	a, b
	inc	iy
	ld	0 (iy), a
	C$game.c$225$3_2$109	= .
	.globl	C$game.c$225$3_2$109
;game.c:225: char objectType = g_objMap[next_pos_y][next_pos_x];
	ld	c, 0 (iy)
	ld	a, c
	rlc	a
	sbc	a, a
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	a, #<(_g_objMap)
	add	a, l
	ld	c, a
	ld	a, #>(_g_objMap)
	adc	a, h
	ld	b, a
	ld	a, c
	ld	hl, #2
	add	hl, sp
	inc	iy
	add	a, (hl)
	ld	0 (iy), a
	ld	a, b
	adc	a, #0x00
	inc	iy
	ld	0 (iy), a
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	C$game.c$227$3_2$109	= .
	.globl	C$game.c$227$3_2$109
;game.c:227: switch (objectType)
	cp	a, #0x01
	jr	Z,00115$
	sub	a, #0x02
	jp	Z,00119$
	jp	00120$
	C$game.c$229$4_2$110	= .
	.globl	C$game.c$229$4_2$110
;game.c:229: case FROG:			
00115$:
	C$game.c$230$4_2$110	= .
	.globl	C$game.c$230$4_2$110
;game.c:230: g_score++;
	ld	hl, (_g_score)
	inc	hl
	ld	(_g_score), hl
	C$game.c$231$5_2$111	= .
	.globl	C$game.c$231$5_2$111
;game.c:231: SnakeNode *tail = player; //뱀의 마지막 부분을 찾는다
	C$game.c$232$4_3$111	= .
	.globl	C$game.c$232$4_3$111
;game.c:232: while (tail->next != NULL)
00116$:
	ld	hl, #0x0004
	add	hl, de
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, b
	or	a, c
	jr	Z,00118$
	C$game.c$234$5_3$112	= .
	.globl	C$game.c$234$5_3$112
;game.c:234: tail = tail->next;
	ld	e, c
	ld	d, b
	jr	00116$
00118$:
	C$game.c$236$4_4$113	= .
	.globl	C$game.c$236$4_4$113
;game.c:236: int new_node_x = tail->x;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), a
	C$game.c$237$4_4$113	= .
	.globl	C$game.c$237$4_4$113
;game.c:237: int new_node_y = tail->y;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	iy
	ld	0 (iy), a
	C$game.c$239$4_4$113	= .
	.globl	C$game.c$239$4_4$113
;game.c:239: MoveBody(player, next_pos_x, next_pos_y);
	ld	iy, #3
	add	iy, sp
	ld	a, 0 (iy)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	dec	iy
	ld	a, 0 (iy)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	push	de
	push	bc
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	_MoveBody
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	ld	hl, #0x0006
	push	hl
	call	_malloc
	pop	af
	pop	de
	C$game.c$242$4_5$114	= .
	.globl	C$game.c$242$4_5$114
;game.c:242: newNode->x = new_node_x;
	ld	c,l
	ld	b,h
	inc	hl
	inc	hl
	ld	iy, #8
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$243$4_5$114	= .
	.globl	C$game.c$243$4_5$114
;game.c:243: newNode->y = new_node_y;
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	inc	iy
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$245$4_5$114	= .
	.globl	C$game.c$245$4_5$114
;game.c:245: newNode->dir = tail->dir;
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$game.c$246$4_5$114	= .
	.globl	C$game.c$246$4_5$114
;game.c:246: newNode->next = NULL;
	ld	hl, #0x0004
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$247$4_5$114	= .
	.globl	C$game.c$247$4_5$114
;game.c:247: tail->next = newNode;
	dec	iy
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$game.c$249$4_5$114	= .
	.globl	C$game.c$249$4_5$114
;game.c:249: GenerateNewFrog();			
	call	_GenerateNewFrog
	C$game.c$250$4_5$114	= .
	.globl	C$game.c$250$4_5$114
;game.c:250: break;
	jr	00121$
	C$game.c$251$4_5$114	= .
	.globl	C$game.c$251$4_5$114
;game.c:251: case SNAKE:
00119$:
	C$game.c$252$4_5$114	= .
	.globl	C$game.c$252$4_5$114
;game.c:252: g_gamestate = STATE_GAME_OVER;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$253$4_5$114	= .
	.globl	C$game.c$253$4_5$114
;game.c:253: break;
	jr	00121$
	C$game.c$254$4_5$114	= .
	.globl	C$game.c$254$4_5$114
;game.c:254: default:
00120$:
	C$game.c$255$4_5$114	= .
	.globl	C$game.c$255$4_5$114
;game.c:255: MoveBody(player, next_pos_x, next_pos_y);
	ld	iy, #3
	add	iy, sp
	ld	a, 0 (iy)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	dec	iy
	ld	a, 0 (iy)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	push	bc
	push	hl
	push	de
	call	_MoveBody
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	C$game.c$257$3_2$109	= .
	.globl	C$game.c$257$3_2$109
;game.c:257: }
00121$:
	C$game.c$259$3_2$109	= .
	.globl	C$game.c$259$3_2$109
;game.c:259: g_objMap[next_pos_y][next_pos_x] = SNAKE;
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
	C$game.c$260$3_2$109	= .
	.globl	C$game.c$260$3_2$109
;game.c:260: g_next_step = now() + step_time;
	call	_now
	ld	de, (_step_time)
	add	hl, de
	ld	iy, #_g_next_step
	ld	0 (iy), l
	ld	a, h
	ld	(_g_next_step+1), a
	rla
	sbc	a, a
	ld	(_g_next_step+2), a
	ld	(_g_next_step+3), a
00126$:
	C$game.c$263$1_0$102	= .
	.globl	C$game.c$263$1_0$102
;game.c:263: }
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	C$game.c$263$1_0$102	= .
	.globl	C$game.c$263$1_0$102
	XG$ProcessLogic$0$0	= .
	.globl	XG$ProcessLogic$0$0
	ret
	G$DrawObject$0$0	= .
	.globl	G$DrawObject$0$0
	C$game.c$265$1_0$116	= .
	.globl	C$game.c$265$1_0$116
;game.c:265: void DrawObject()
;	---------------------------------
; Function DrawObject
; ---------------------------------
_DrawObject::
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	C$game.c$267$2_0$116	= .
	.globl	C$game.c$267$2_0$116
;game.c:267: uint8_t c = 0;
	xor	a, a
	ld	iy, #5
	add	iy, sp
	ld	0 (iy), a
	C$game.c$270$5_0$119	= .
	.globl	C$game.c$270$5_0$119
;game.c:270: for (uint8_t row = 0; row < MAP_HEIGHT; row++)
	xor	a, a
	inc	iy
	ld	0 (iy), a
00119$:
	ld	iy, #6
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x14
	jp	NC, 00121$
	C$game.c$272$5_0$119	= .
	.globl	C$game.c$272$5_0$119
;game.c:272: for (uint8_t col = 0; col < MAP_WIDTH; col++)
	ld	c, 0 (iy)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	dec	iy
	dec	iy
	dec	iy
	ld	0 (iy), l
	ld	1 (iy), h
	ld	hl, #0
	add	hl, sp
	ld	a, 0 (iy)
	add	a, #<(_g_objMap)
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #>(_g_objMap)
	inc	hl
	ld	(hl), a
	xor	a, a
	ld	iy, #7
	add	iy, sp
	ld	0 (iy), a
00116$:
	ld	hl, #7+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x1e
	jp	NC, 00120$
	C$game.c$274$5_0$119	= .
	.globl	C$game.c$274$5_0$119
;game.c:274: if (g_objMap[row][col] == NOTHING) //정보가 없으면 검은색을 그린다.
	ld	hl, #7
	add	hl, sp
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	l, c
	ld	h, a
	ld	e, (hl)
	C$game.c$283$2_0$116	= .
	.globl	C$game.c$283$2_0$116
;game.c:283: if (g_player->x == col && g_player->y == row)
	ld	iy, #7
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, #0x00
	dec	iy
	ld	a, 0 (iy)
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), a
	xor	a, a
	ld	1 (iy), a
	C$game.c$274$5_0$119	= .
	.globl	C$game.c$274$5_0$119
;game.c:274: if (g_objMap[row][col] == NOTHING) //정보가 없으면 검은색을 그린다.
	ld	a, e
	or	a, a
	jr	NZ,00111$
	C$game.c$275$5_0$119	= .
	.globl	C$game.c$275$5_0$119
;game.c:275: c = BLACK_TILE;
	inc	iy
	inc	iy
	inc	iy
	ld	0 (iy), #0x55
	jr	00112$
00111$:
	C$game.c$277$5_0$119	= .
	.globl	C$game.c$277$5_0$119
;game.c:277: else if (g_objMap[row][col] == FROG) //개구리라면 녹색을 그린다.
	ld	a, e
	dec	a
	jr	NZ,00108$
	C$game.c$278$5_0$119	= .
	.globl	C$game.c$278$5_0$119
;game.c:278: c = GREEN_TILE;
	ld	iy, #5
	add	iy, sp
	ld	0 (iy), #0x4a
	jr	00112$
00108$:
	C$game.c$280$5_0$119	= .
	.globl	C$game.c$280$5_0$119
;game.c:280: else if (g_objMap[row][col] == SNAKE)
	ld	a, e
	sub	a, #0x02
	jr	NZ,00112$
	C$game.c$283$2_0$116	= .
	.globl	C$game.c$283$2_0$116
;game.c:283: if (g_player->x == col && g_player->y == row)
	ld	de, (_g_player)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), a
	rla
	sbc	a, a
	ld	1 (iy), a
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	cp	a, a
	sbc	hl, bc
	jr	NZ,00102$
	ex	de,hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	cp	a, a
	sbc	hl, de
	jr	NZ,00102$
	C$game.c$284$6_0$120	= .
	.globl	C$game.c$284$6_0$120
;game.c:284: c = YELLOW_TILE;
	inc	iy
	inc	iy
	inc	iy
	ld	0 (iy), #0x4d
	jr	00112$
00102$:
	C$game.c$286$6_0$120	= .
	.globl	C$game.c$286$6_0$120
;game.c:286: c = WHITE_TILE;
	ld	iy, #5
	add	iy, sp
	ld	0 (iy), #0x51
00112$:
	C$game.c$289$5_0$119	= .
	.globl	C$game.c$289$5_0$119
;game.c:289: RenderTile(col + 1, row + 1, c); //타일을 그린다.
	ld	iy, #5
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, #0x00
	dec	iy
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	inc	hl
	inc	bc
	push	de
	push	hl
	push	bc
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	C$game.c$272$4_0$118	= .
	.globl	C$game.c$272$4_0$118
;game.c:272: for (uint8_t col = 0; col < MAP_WIDTH; col++)
	ld	iy, #7
	add	iy, sp
	inc	0 (iy)
	jp	00116$
00120$:
	C$game.c$270$2_0$116	= .
	.globl	C$game.c$270$2_0$116
;game.c:270: for (uint8_t row = 0; row < MAP_HEIGHT; row++)
	ld	iy, #6
	add	iy, sp
	inc	0 (iy)
	jp	00119$
00121$:
	C$game.c$292$2_0$116	= .
	.globl	C$game.c$292$2_0$116
;game.c:292: }
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	C$game.c$292$2_0$116	= .
	.globl	C$game.c$292$2_0$116
	XG$DrawObject$0$0	= .
	.globl	XG$DrawObject$0$0
	ret
	G$DrawBackground$0$0	= .
	.globl	G$DrawBackground$0$0
	C$game.c$294$2_0$121	= .
	.globl	C$game.c$294$2_0$121
;game.c:294: void DrawBackground()
;	---------------------------------
; Function DrawBackground
; ---------------------------------
_DrawBackground::
	C$game.c$296$2_0$121	= .
	.globl	C$game.c$296$2_0$121
;game.c:296: for (int index = 0; index < MAP_WIDTH + 1; index++)
	ld	bc, #0x0000
00106$:
	ld	a, c
	sub	a, #0x1f
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00101$
	C$game.c$297$2_0$122	= .
	.globl	C$game.c$297$2_0$122
;game.c:297: RenderTile(index, 0, 77);
	push	bc
	ld	hl, #0x004d
	push	hl
	ld	l, #0x00
	push	hl
	push	bc
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$296$2_0$122	= .
	.globl	C$game.c$296$2_0$122
;game.c:296: for (int index = 0; index < MAP_WIDTH + 1; index++)
	inc	bc
	jr	00106$
00101$:
	C$game.c$299$2_0$121	= .
	.globl	C$game.c$299$2_0$121
;game.c:299: for (int index = 0; index < MAP_WIDTH + 2; index++)
	ld	bc, #0x0000
00109$:
	ld	a, c
	sub	a, #0x20
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
	C$game.c$300$2_0$123	= .
	.globl	C$game.c$300$2_0$123
;game.c:300: RenderTile(index, MAP_HEIGHT + 1, 77);
	push	bc
	ld	hl, #0x004d
	push	hl
	ld	l, #0x15
	push	hl
	push	bc
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$299$2_0$123	= .
	.globl	C$game.c$299$2_0$123
;game.c:299: for (int index = 0; index < MAP_WIDTH + 2; index++)
	inc	bc
	jr	00109$
00102$:
	C$game.c$302$2_0$121	= .
	.globl	C$game.c$302$2_0$121
;game.c:302: for (int index = 1; index < MAP_HEIGHT + 1; index++)
	ld	bc, #0x0001
00112$:
	ld	a, c
	sub	a, #0x15
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00103$
	C$game.c$303$2_0$124	= .
	.globl	C$game.c$303$2_0$124
;game.c:303: RenderTile(0, index, 77);
	push	bc
	ld	hl, #0x004d
	push	hl
	push	bc
	ld	l, #0x00
	push	hl
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$302$2_0$124	= .
	.globl	C$game.c$302$2_0$124
;game.c:302: for (int index = 1; index < MAP_HEIGHT + 1; index++)
	inc	bc
	jr	00112$
00103$:
	C$game.c$305$2_0$121	= .
	.globl	C$game.c$305$2_0$121
;game.c:305: for (int index = 0; index < MAP_HEIGHT + 1; index++)
	ld	bc, #0x0000
00115$:
	ld	a, c
	sub	a, #0x15
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
	C$game.c$306$2_0$125	= .
	.globl	C$game.c$306$2_0$125
;game.c:306: RenderTile(MAP_WIDTH + 1, index, 77);
	push	bc
	ld	hl, #0x004d
	push	hl
	push	bc
	ld	l, #0x1f
	push	hl
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$305$2_0$125	= .
	.globl	C$game.c$305$2_0$125
;game.c:305: for (int index = 0; index < MAP_HEIGHT + 1; index++)
	inc	bc
	C$game.c$307$2_0$121	= .
	.globl	C$game.c$307$2_0$121
;game.c:307: }
	C$game.c$307$2_0$121	= .
	.globl	C$game.c$307$2_0$121
	XG$DrawBackground$0$0	= .
	.globl	XG$DrawBackground$0$0
	jr	00115$
	.area _CODE
	.area _INITIALIZER
Fgame$__xinit_g_score$0_0$0 == .
__xinit__g_score:
	.dw #0x0000
Fgame$__xinit_step_time$0_0$0 == .
__xinit__step_time:
	.dw #0x0005
Fgame$__xinit_input_step_time$0_0$0 == .
__xinit__input_step_time:
	.dw #0x0004
Fgame$__xinit_g_next_step$0_0$0 == .
__xinit__g_next_step:
	.byte #0x00, #0x00, #0x00, #0x00	;  0
Fgame$__xinit_g_next_input_step$0_0$0 == .
__xinit__g_next_input_step:
	.byte #0x00, #0x00, #0x00, #0x00	;  0
Fgame$__xinit_g_player$0_0$0 == .
__xinit__g_player:
	.dw #0x0000
	.area _CABS (ABS)
