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
	.globl _put_text
	.globl _malloc
	.globl _srand
	.globl _rand
	.globl _ubox_read_keys
	.globl _ubox_read_ctl
	.globl _ubox_wait
	.globl _ubox_fill_screen
	.globl _ubox_disable_screen
	.globl _ubox_enable_screen
	.globl _g_player
	.globl _g_next_step
	.globl _step_time
	.globl _g_high_score_text
	.globl _g_score_text
	.globl _g_high_score
	.globl _g_score
	.globl _g_frog
	.globl _g_objMap
	.globl _DrawScore
	.globl _DrawHighScore
	.globl _run_game
	.globl _InitGame
	.globl _GenerateNewFrog
	.globl _ProcessLogic
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
G$g_frog$0_0$0==.
_g_frog::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$g_score$0_0$0==.
_g_score::
	.ds 2
G$g_high_score$0_0$0==.
_g_high_score::
	.ds 2
G$g_score_text$0_0$0==.
_g_score_text::
	.ds 10
G$g_high_score_text$0_0$0==.
_g_high_score_text::
	.ds 9
G$step_time$0_0$0==.
_step_time::
	.ds 2
G$g_next_step$0_0$0==.
_g_next_step::
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
	G$DrawScore$0$0	= .
	.globl	G$DrawScore$0$0
	C$game.c$69$0_0$81	= .
	.globl	C$game.c$69$0_0$81
;game.c:69: void DrawScore() {
;	---------------------------------
; Function DrawScore
; ---------------------------------
_DrawScore::
	push	af
	C$game.c$70$2_0$81	= .
	.globl	C$game.c$70$2_0$81
;game.c:70: int num = g_score;
	ld	bc, (_g_score)
	C$game.c$71$3_0$83	= .
	.globl	C$game.c$71$3_0$83
;game.c:71: for (int i = 8; i >= 6; i--) {			
	ld	de, #0x0008
00103$:
	ld	a, e
	sub	a, #0x06
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00101$
	C$game.c$72$3_0$83	= .
	.globl	C$game.c$72$3_0$83
;game.c:72: g_score_text[i] = (num % 10) + '0';
	ld	a, #<(_g_score_text)
	ld	hl, #0
	add	hl, sp
	add	a, e
	ld	(hl), a
	ld	a, #>(_g_score_text)
	adc	a, d
	inc	hl
	ld	(hl), a
	push	bc
	push	de
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a, l
	add	a, #0x30
	pop	hl
	push	hl
	ld	(hl), a
	C$game.c$73$1_0$81	= .
	.globl	C$game.c$73$1_0$81
;game.c:73: num /= 10;
	push	de
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__divsint
	pop	af
	pop	af
	pop	de
	ld	c, l
	ld	b, h
	C$game.c$71$2_0$82	= .
	.globl	C$game.c$71$2_0$82
;game.c:71: for (int i = 8; i >= 6; i--) {			
	dec	de
	jr	00103$
00101$:
	C$game.c$75$1_0$81	= .
	.globl	C$game.c$75$1_0$81
;game.c:75: put_text(MAP_WIDTH - 9, 0, g_score_text); 
	ld	hl, #_g_score_text
	push	hl
	xor	a, a
	ld	d,a
	ld	e,#0x15
	push	de
	call	_put_text
	pop	af
	pop	af
	C$game.c$76$1_0$81	= .
	.globl	C$game.c$76$1_0$81
;game.c:76: }
	pop	af
	C$game.c$76$1_0$81	= .
	.globl	C$game.c$76$1_0$81
	XG$DrawScore$0$0	= .
	.globl	XG$DrawScore$0$0
	ret
	G$DrawHighScore$0$0	= .
	.globl	G$DrawHighScore$0$0
	C$game.c$77$1_0$84	= .
	.globl	C$game.c$77$1_0$84
;game.c:77: void DrawHighScore() {
;	---------------------------------
; Function DrawHighScore
; ---------------------------------
_DrawHighScore::
	push	af
	C$game.c$78$1_0$84	= .
	.globl	C$game.c$78$1_0$84
;game.c:78: if (g_score > g_high_score) {
	ld	hl, #_g_high_score
	ld	a, (hl)
	ld	iy, #_g_score
	sub	a, 0 (iy)
	inc	hl
	ld	a, (hl)
	sbc	a, 1 (iy)
	jp	PO, 00125$
	xor	a, #0x80
00125$:
	jp	P, 00102$
	C$game.c$79$2_0$85	= .
	.globl	C$game.c$79$2_0$85
;game.c:79: g_high_score = g_score;
	ld	hl, (_g_score)
	ld	(_g_high_score), hl
00102$:
	C$game.c$81$2_0$86	= .
	.globl	C$game.c$81$2_0$86
;game.c:81: int num = g_high_score;
	ld	bc, (_g_high_score)
	C$game.c$83$3_1$88	= .
	.globl	C$game.c$83$3_1$88
;game.c:83: for (int i = 7; i >= 5; i--) {			
	ld	de, #0x0007
00105$:
	ld	a, e
	sub	a, #0x05
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00103$
	C$game.c$84$3_1$88	= .
	.globl	C$game.c$84$3_1$88
;game.c:84: g_high_score_text[i] = (num % 10) + '0';
	ld	a, #<(_g_high_score_text)
	ld	hl, #0
	add	hl, sp
	add	a, e
	ld	(hl), a
	ld	a, #>(_g_high_score_text)
	adc	a, d
	inc	hl
	ld	(hl), a
	push	bc
	push	de
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a, l
	add	a, #0x30
	pop	hl
	push	hl
	ld	(hl), a
	C$game.c$85$1_1$84	= .
	.globl	C$game.c$85$1_1$84
;game.c:85: num /= 10;
	push	de
	ld	hl, #0x000a
	push	hl
	push	bc
	call	__divsint
	pop	af
	pop	af
	pop	de
	ld	c, l
	ld	b, h
	C$game.c$83$2_1$87	= .
	.globl	C$game.c$83$2_1$87
;game.c:83: for (int i = 7; i >= 5; i--) {			
	dec	de
	jr	00105$
00103$:
	C$game.c$87$1_1$86	= .
	.globl	C$game.c$87$1_1$86
;game.c:87: put_text(MAP_WIDTH - 22, 0, g_high_score_text); 
	ld	hl, #_g_high_score_text
	push	hl
	xor	a, a
	ld	d,a
	ld	e,#0x08
	push	de
	call	_put_text
	pop	af
	pop	af
	C$game.c$88$1_1$84	= .
	.globl	C$game.c$88$1_1$84
;game.c:88: }
	pop	af
	C$game.c$88$1_1$84	= .
	.globl	C$game.c$88$1_1$84
	XG$DrawHighScore$0$0	= .
	.globl	XG$DrawHighScore$0$0
	ret
	G$run_game$0$0	= .
	.globl	G$run_game$0$0
	C$game.c$90$1_1$89	= .
	.globl	C$game.c$90$1_1$89
;game.c:90: void run_game()
;	---------------------------------
; Function run_game
; ---------------------------------
_run_game::
	C$game.c$92$1_0$89	= .
	.globl	C$game.c$92$1_0$89
;game.c:92: g_gamestate = STATE_IN_GAME;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x01
	C$game.c$94$1_0$89	= .
	.globl	C$game.c$94$1_0$89
;game.c:94: InitGame();
	call	_InitGame
	C$game.c$95$1_0$89	= .
	.globl	C$game.c$95$1_0$89
;game.c:95: ubox_disable_screen();
	call	_ubox_disable_screen
	C$game.c$96$1_0$89	= .
	.globl	C$game.c$96$1_0$89
;game.c:96: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$game.c$97$1_0$89	= .
	.globl	C$game.c$97$1_0$89
;game.c:97: DrawBackground();
	call	_DrawBackground
	C$game.c$98$1_0$89	= .
	.globl	C$game.c$98$1_0$89
;game.c:98: ubox_enable_screen();
	call	_ubox_enable_screen
	C$game.c$100$1_0$89	= .
	.globl	C$game.c$100$1_0$89
;game.c:100: while (1)
00104$:
	C$game.c$102$2_0$90	= .
	.globl	C$game.c$102$2_0$90
;game.c:102: ProcessLogic(g_player);		
	ld	hl, (_g_player)
	push	hl
	call	_ProcessLogic
	pop	af
	C$game.c$103$2_0$90	= .
	.globl	C$game.c$103$2_0$90
;game.c:103: ubox_wait();
	call	_ubox_wait
	C$game.c$105$2_0$90	= .
	.globl	C$game.c$105$2_0$90
;game.c:105: if (g_gamestate == STATE_GAME_OVER)
	ld	a,(#_g_gamestate + 0)
	sub	a, #0x02
	jr	NZ,00104$
	C$game.c$106$1_0$89	= .
	.globl	C$game.c$106$1_0$89
;game.c:106: break;
	C$game.c$108$1_0$89	= .
	.globl	C$game.c$108$1_0$89
;game.c:108: }
	C$game.c$108$1_0$89	= .
	.globl	C$game.c$108$1_0$89
	XG$run_game$0$0	= .
	.globl	XG$run_game$0$0
	ret
	G$InitGame$0$0	= .
	.globl	G$InitGame$0$0
	C$game.c$114$1_0$91	= .
	.globl	C$game.c$114$1_0$91
;game.c:114: void InitGame()
;	---------------------------------
; Function InitGame
; ---------------------------------
_InitGame::
	push	af
	push	af
	C$game.c$116$1_0$91	= .
	.globl	C$game.c$116$1_0$91
;game.c:116: srand(now());
	call	_now
	push	hl
	call	_srand
	pop	af
	C$game.c$117$1_0$91	= .
	.globl	C$game.c$117$1_0$91
;game.c:117: g_score = 0;
	ld	hl, #0x0000
	ld	(_g_score), hl
	C$game.c$118$1_0$91	= .
	.globl	C$game.c$118$1_0$91
;game.c:118: step_time = INIT_SPEED;
	ld	l, #0x07
	ld	(_step_time), hl
	C$game.c$120$1_0$91	= .
	.globl	C$game.c$120$1_0$91
;game.c:120: g_player = malloc(sizeof(SnakeNode));
	ld	l, #0x06
	push	hl
	call	_malloc
	pop	af
	ld	(_g_player), hl
	C$game.c$121$1_0$91	= .
	.globl	C$game.c$121$1_0$91
;game.c:121: g_player->dir = rand() % 4; //초기 방향
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
	C$game.c$123$1_0$91	= .
	.globl	C$game.c$123$1_0$91
;game.c:123: g_player->x = MAP_WIDTH / 2;
	ld	hl, (_g_player)
	inc	hl
	inc	hl
	ld	(hl), #0x0f
	C$game.c$124$1_0$91	= .
	.globl	C$game.c$124$1_0$91
;game.c:124: g_player->y = MAP_HEIGHT / 2;
	ld	hl, (_g_player)
	inc	hl
	inc	hl
	inc	hl
	ld	a, h
	ld	h, a
	ld	(hl), #0x0a
	C$game.c$125$1_0$91	= .
	.globl	C$game.c$125$1_0$91
;game.c:125: g_player->next = NULL;
	ld	hl, (_g_player)
	ld	bc, #0x0004
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$128$5_1$96	= .
	.globl	C$game.c$128$5_1$96
;game.c:128: for (i = 0; i < MAP_HEIGHT; i++)
	ld	bc, #0x0000
	C$game.c$130$1_1$91	= .
	.globl	C$game.c$130$1_1$91
;game.c:130: for (j = 0; j < MAP_WIDTH; j++)
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
	C$game.c$132$5_1$96	= .
	.globl	C$game.c$132$5_1$96
;game.c:132: g_objMap[i][j] = NOTHING;
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
	C$game.c$130$4_1$95	= .
	.globl	C$game.c$130$4_1$95
;game.c:130: for (j = 0; j < MAP_WIDTH; j++)
	inc	de
	ld	a, e
	sub	a, #0x1e
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00103$
	C$game.c$128$2_1$93	= .
	.globl	C$game.c$128$2_1$93
;game.c:128: for (i = 0; i < MAP_HEIGHT; i++)
	inc	bc
	ld	a, c
	sub	a, #0x14
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00109$
	C$game.c$136$1_1$92	= .
	.globl	C$game.c$136$1_1$92
;game.c:136: GenerateNewFrog(&g_frog);
	ld	hl, #_g_frog
	push	hl
	call	_GenerateNewFrog
	pop	af
	C$game.c$137$1_1$92	= .
	.globl	C$game.c$137$1_1$92
;game.c:137: g_next_step = now() + step_time;	
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
	C$game.c$138$1_1$91	= .
	.globl	C$game.c$138$1_1$91
;game.c:138: }
	pop	af
	pop	af
	C$game.c$138$1_1$91	= .
	.globl	C$game.c$138$1_1$91
	XG$InitGame$0$0	= .
	.globl	XG$InitGame$0$0
	ret
	G$MoveBody$0$0	= .
	.globl	G$MoveBody$0$0
	C$game.c$140$1_1$98	= .
	.globl	C$game.c$140$1_1$98
;game.c:140: SnakeNode* MoveBody(SnakeNode *node, int xPos, int yPos) 
;	---------------------------------
; Function MoveBody
; ---------------------------------
_MoveBody::
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
	C$game.c$142$1_0$98	= .
	.globl	C$game.c$142$1_0$98
;game.c:142: if (node->next == NULL) 
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
	C$game.c$144$1_0$98	= .
	.globl	C$game.c$144$1_0$98
;game.c:144: g_objMap[node->y][ node->x] = NOTHING;
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
	C$game.c$142$1_0$98	= .
	.globl	C$game.c$142$1_0$98
;game.c:142: if (node->next == NULL) 
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ,00102$
	C$game.c$144$2_0$99	= .
	.globl	C$game.c$144$2_0$99
;game.c:144: g_objMap[node->y][ node->x] = NOTHING;
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
	C$game.c$148$2_0$100	= .
	.globl	C$game.c$148$2_0$100
;game.c:148: node->next = MoveBody(node->next, node->x, node->y);
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
	C$game.c$150$1_0$98	= .
	.globl	C$game.c$150$1_0$98
;game.c:150: node->x = xPos;
	ld	hl, #13+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$151$1_0$98	= .
	.globl	C$game.c$151$1_0$98
;game.c:151: node->y = yPos;
	ld	hl, #15+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$152$1_0$98	= .
	.globl	C$game.c$152$1_0$98
;game.c:152: return node;
	ld	l, c
	ld	h, b
	C$game.c$153$1_0$98	= .
	.globl	C$game.c$153$1_0$98
;game.c:153: }
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	C$game.c$153$1_0$98	= .
	.globl	C$game.c$153$1_0$98
	XG$MoveBody$0$0	= .
	.globl	XG$MoveBody$0$0
	ret
	G$GenerateNewFrog$0$0	= .
	.globl	G$GenerateNewFrog$0$0
	C$game.c$156$1_0$102	= .
	.globl	C$game.c$156$1_0$102
;game.c:156: void GenerateNewFrog(Point* point)
;	---------------------------------
; Function GenerateNewFrog
; ---------------------------------
_GenerateNewFrog::
	push	af
	C$game.c$158$1_0$102	= .
	.globl	C$game.c$158$1_0$102
;game.c:158: do
00101$:
	C$game.c$160$2_0$103	= .
	.globl	C$game.c$160$2_0$103
;game.c:160: point->x = (int)(rand() % (MAP_WIDTH - 1));
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_rand
	ld	de, #0x001d
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a, l
	ld	(bc), a
	C$game.c$161$2_0$103	= .
	.globl	C$game.c$161$2_0$103
;game.c:161: point->y = (int)(rand() % (MAP_HEIGHT - 1));
	ld	hl, #0x0001
	add	hl, bc
	ex	(sp), hl
	push	bc
	call	_rand
	ld	de, #0x0013
	push	de
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a, l
	pop	hl
	push	hl
	ld	(hl), a
	C$game.c$163$1_0$102	= .
	.globl	C$game.c$163$1_0$102
;game.c:163: } while (g_objMap[point->y][point->x] != NOTHING);
	ld	e, a
	ld	d, #0x00
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
	ld	a, (bc)
	ld	c, a
	ld	l, c
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ,00101$
	C$game.c$164$1_0$102	= .
	.globl	C$game.c$164$1_0$102
;game.c:164: g_objMap[point->y][point->x] = FROG;
	pop	hl
	push	hl
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	de, #_g_objMap
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	(hl), #0x01
	C$game.c$166$1_0$102	= .
	.globl	C$game.c$166$1_0$102
;game.c:166: }
	pop	af
	C$game.c$166$1_0$102	= .
	.globl	C$game.c$166$1_0$102
	XG$GenerateNewFrog$0$0	= .
	.globl	XG$GenerateNewFrog$0$0
	ret
	G$CheckWall$0$0	= .
	.globl	G$CheckWall$0$0
	C$game.c$168$1_0$105	= .
	.globl	C$game.c$168$1_0$105
;game.c:168: char CheckWall(SnakeNode *player)
;	---------------------------------
; Function CheckWall
; ---------------------------------
_CheckWall::
	dec	sp
	C$game.c$170$2_0$105	= .
	.globl	C$game.c$170$2_0$105
;game.c:170: char result = 1;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x01
	C$game.c$171$1_0$105	= .
	.globl	C$game.c$171$1_0$105
;game.c:171: if (player->dir == LEFT)
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
	C$game.c$173$2_0$106	= .
	.globl	C$game.c$173$2_0$106
;game.c:173: if (player->x > 0)		
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
	C$game.c$174$2_0$106	= .
	.globl	C$game.c$174$2_0$106
;game.c:174: result = 0;				
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00118$:
	C$game.c$176$1_0$105	= .
	.globl	C$game.c$176$1_0$105
;game.c:176: else if (player->dir == RIGHT)
	ld	a, e
	dec	a
	or	a, d
	jr	NZ,00115$
	C$game.c$178$2_0$107	= .
	.globl	C$game.c$178$2_0$107
;game.c:178: if (player->x < MAP_WIDTH - 1)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x9d
	jr	NC,00119$
	C$game.c$179$2_0$107	= .
	.globl	C$game.c$179$2_0$107
;game.c:179: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00115$:
	C$game.c$181$1_0$105	= .
	.globl	C$game.c$181$1_0$105
;game.c:181: else if (player->dir == UP)
	ld	a, e
	sub	a, #0x02
	or	a, d
	jr	NZ,00112$
	C$game.c$183$2_0$108	= .
	.globl	C$game.c$183$2_0$108
;game.c:183: if (player->y > 0)		
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
	C$game.c$184$2_0$108	= .
	.globl	C$game.c$184$2_0$108
;game.c:184: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00112$:
	C$game.c$186$1_0$105	= .
	.globl	C$game.c$186$1_0$105
;game.c:186: else if (player->dir == DOWN)
	ld	a, e
	sub	a, #0x03
	or	a, d
	jr	NZ,00119$
	C$game.c$188$2_0$109	= .
	.globl	C$game.c$188$2_0$109
;game.c:188: if (player->y < MAP_HEIGHT - 1)			
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x93
	jr	NC,00119$
	C$game.c$189$2_0$109	= .
	.globl	C$game.c$189$2_0$109
;game.c:189: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
00119$:
	C$game.c$192$1_0$105	= .
	.globl	C$game.c$192$1_0$105
;game.c:192: return result;
	ld	iy, #0
	add	iy, sp
	ld	l, 0 (iy)
	C$game.c$193$1_0$105	= .
	.globl	C$game.c$193$1_0$105
;game.c:193: }
	inc	sp
	C$game.c$193$1_0$105	= .
	.globl	C$game.c$193$1_0$105
	XG$CheckWall$0$0	= .
	.globl	XG$CheckWall$0$0
	ret
	G$ProcessLogic$0$0	= .
	.globl	G$ProcessLogic$0$0
	C$game.c$195$1_0$111	= .
	.globl	C$game.c$195$1_0$111
;game.c:195: void ProcessLogic(SnakeNode *player)
;	---------------------------------
; Function ProcessLogic
; ---------------------------------
_ProcessLogic::
	ld	hl, #-19
	add	hl, sp
	ld	sp, hl
	C$game.c$197$1_0$111	= .
	.globl	C$game.c$197$1_0$111
;game.c:197: if (g_gamestate != STATE_IN_GAME)
	ld	a,(#_g_gamestate + 0)
	C$game.c$198$1_0$111	= .
	.globl	C$game.c$198$1_0$111
;game.c:198: return;
	C$game.c$200$2_0$112	= .
	.globl	C$game.c$200$2_0$112
;game.c:200: char x_offset = 0;
	dec	a
	jp	NZ,00136$
	ld	c,a
	C$game.c$201$2_0$112	= .
	.globl	C$game.c$201$2_0$112
;game.c:201: char y_offset = 0;
	xor	a, a
	ld	iy, #17
	add	iy, sp
	ld	0 (iy), a
	C$game.c$203$1_1$112	= .
	.globl	C$game.c$203$1_1$112
;game.c:203: switch(ubox_read_keys(8))
	push	bc
	ld	l, #0x08
	call	_ubox_read_keys
	pop	bc
	C$game.c$206$1_1$111	= .
	.globl	C$game.c$206$1_1$111
;game.c:206: player->dir = LEFT;
	ld	iy, #21
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	C$game.c$203$1_1$112	= .
	.globl	C$game.c$203$1_1$112
;game.c:203: switch(ubox_read_keys(8))
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
	C$game.c$205$2_1$113	= .
	.globl	C$game.c$205$2_1$113
;game.c:205: case UBOX_MSX_KEY_LEFT:
00103$:
	C$game.c$206$2_1$113	= .
	.globl	C$game.c$206$2_1$113
;game.c:206: player->dir = LEFT;
	ld	l, e
	ld	h, d
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$207$2_1$113	= .
	.globl	C$game.c$207$2_1$113
;game.c:207: break;
	jr	00107$
	C$game.c$208$2_1$113	= .
	.globl	C$game.c$208$2_1$113
;game.c:208: case UBOX_MSX_KEY_RIGHT:
00104$:
	C$game.c$209$2_1$113	= .
	.globl	C$game.c$209$2_1$113
;game.c:209: player->dir = RIGHT;
	ld	l, e
	ld	h, d
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	C$game.c$210$2_1$113	= .
	.globl	C$game.c$210$2_1$113
;game.c:210: break;
	jr	00107$
	C$game.c$211$2_1$113	= .
	.globl	C$game.c$211$2_1$113
;game.c:211: case UBOX_MSX_KEY_UP:
00105$:
	C$game.c$212$2_1$113	= .
	.globl	C$game.c$212$2_1$113
;game.c:212: player->dir = UP;
	ld	l, e
	ld	h, d
	ld	(hl), #0x02
	inc	hl
	ld	(hl), #0x00
	C$game.c$213$2_1$113	= .
	.globl	C$game.c$213$2_1$113
;game.c:213: break;
	jr	00107$
	C$game.c$214$2_1$113	= .
	.globl	C$game.c$214$2_1$113
;game.c:214: case UBOX_MSX_KEY_DOWN:
00106$:
	C$game.c$215$2_1$113	= .
	.globl	C$game.c$215$2_1$113
;game.c:215: player->dir = DOWN;
	ld	l, e
	ld	h, d
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
	C$game.c$217$1_1$112	= .
	.globl	C$game.c$217$1_1$112
;game.c:217: }
00107$:
	C$game.c$219$1_1$112	= .
	.globl	C$game.c$219$1_1$112
;game.c:219: switch(ubox_read_ctl(UBOX_MSX_CTL_PORT1)) {
	push	bc
	push	de
	ld	l, #0x01
	call	_ubox_read_ctl
	ld	a, l
	pop	de
	pop	bc
	cp	a, #0x01
	jr	Z,00111$
	cp	a, #0x02
	jr	Z,00109$
	cp	a, #0x04
	jr	Z,00108$
	sub	a, #0x08
	jr	Z,00110$
	jr	00112$
	C$game.c$220$2_1$114	= .
	.globl	C$game.c$220$2_1$114
;game.c:220: case UBOX_MSX_CTL_LEFT:
00108$:
	C$game.c$221$2_1$114	= .
	.globl	C$game.c$221$2_1$114
;game.c:221: player->dir = LEFT;
	ld	l, e
	ld	h, d
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$222$2_1$114	= .
	.globl	C$game.c$222$2_1$114
;game.c:222: break;
	jr	00112$
	C$game.c$223$2_1$114	= .
	.globl	C$game.c$223$2_1$114
;game.c:223: case UBOX_MSX_CTL_DOWN:
00109$:
	C$game.c$224$2_1$114	= .
	.globl	C$game.c$224$2_1$114
;game.c:224: player->dir = DOWN;
	ld	l, e
	ld	h, d
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
	C$game.c$225$2_1$114	= .
	.globl	C$game.c$225$2_1$114
;game.c:225: break;
	jr	00112$
	C$game.c$226$2_1$114	= .
	.globl	C$game.c$226$2_1$114
;game.c:226: case UBOX_MSX_CTL_RIGHT:
00110$:
	C$game.c$227$2_1$114	= .
	.globl	C$game.c$227$2_1$114
;game.c:227: player->dir = RIGHT;
	ld	l, e
	ld	h, d
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	C$game.c$228$2_1$114	= .
	.globl	C$game.c$228$2_1$114
;game.c:228: break;	
	jr	00112$
	C$game.c$229$2_1$114	= .
	.globl	C$game.c$229$2_1$114
;game.c:229: case UBOX_MSX_CTL_UP:
00111$:
	C$game.c$230$2_1$114	= .
	.globl	C$game.c$230$2_1$114
;game.c:230: player->dir = UP;
	ld	l, e
	ld	h, d
	ld	(hl), #0x02
	inc	hl
	ld	(hl), #0x00
	C$game.c$232$1_1$112	= .
	.globl	C$game.c$232$1_1$112
;game.c:232: }
00112$:
	C$game.c$234$1_1$112	= .
	.globl	C$game.c$234$1_1$112
;game.c:234: switch(player->dir)
	ld	l, e
	ld	h, d
	ld	b, (hl)
	inc	hl
	ld	l, (hl)
	ld	a, b
	or	a, a
	or	a, l
	jr	Z,00113$
	ld	a, b
	dec	a
	or	a, l
	jr	Z,00114$
	ld	a, b
	sub	a, #0x02
	or	a, l
	jr	Z,00115$
	ld	a, b
	sub	a, #0x03
	or	a, l
	jr	Z,00116$
	jr	00117$
	C$game.c$236$2_1$115	= .
	.globl	C$game.c$236$2_1$115
;game.c:236: case LEFT:
00113$:
	C$game.c$237$2_1$115	= .
	.globl	C$game.c$237$2_1$115
;game.c:237: x_offset = -1;
	ld	c, #0xff
	C$game.c$238$2_1$115	= .
	.globl	C$game.c$238$2_1$115
;game.c:238: break;
	jr	00117$
	C$game.c$239$2_1$115	= .
	.globl	C$game.c$239$2_1$115
;game.c:239: case RIGHT:			
00114$:
	C$game.c$240$2_1$115	= .
	.globl	C$game.c$240$2_1$115
;game.c:240: x_offset = 1;
	ld	c, #0x01
	C$game.c$241$2_1$115	= .
	.globl	C$game.c$241$2_1$115
;game.c:241: break;
	jr	00117$
	C$game.c$242$2_1$115	= .
	.globl	C$game.c$242$2_1$115
;game.c:242: case UP:			
00115$:
	C$game.c$243$2_1$115	= .
	.globl	C$game.c$243$2_1$115
;game.c:243: y_offset = -1;
	ld	iy, #17
	add	iy, sp
	ld	0 (iy), #0xff
	C$game.c$244$2_1$115	= .
	.globl	C$game.c$244$2_1$115
;game.c:244: break;
	jr	00117$
	C$game.c$245$2_1$115	= .
	.globl	C$game.c$245$2_1$115
;game.c:245: case DOWN:			
00116$:
	C$game.c$246$2_1$115	= .
	.globl	C$game.c$246$2_1$115
;game.c:246: y_offset = 1;
	ld	iy, #17
	add	iy, sp
	ld	0 (iy), #0x01
	C$game.c$248$1_1$112	= .
	.globl	C$game.c$248$1_1$112
;game.c:248: }
00117$:
	C$game.c$250$1_1$112	= .
	.globl	C$game.c$250$1_1$112
;game.c:250: if (now() > g_next_step)
	push	bc
	push	de
	call	_now
	pop	de
	pop	bc
	ld	iy, #13
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
	jp	PO, 00266$
	xor	a, #0x80
00266$:
	jp	P, 00136$
	C$game.c$253$2_1$116	= .
	.globl	C$game.c$253$2_1$116
;game.c:253: if(CheckWall(player))
	push	bc
	push	de
	push	de
	call	_CheckWall
	pop	af
	ld	a, l
	pop	de
	pop	bc
	or	a, a
	jr	Z,00119$
	C$game.c$255$3_1$117	= .
	.globl	C$game.c$255$3_1$117
;game.c:255: g_gamestate = STATE_GAME_OVER;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$256$3_1$117	= .
	.globl	C$game.c$256$3_1$117
;game.c:256: return;
	jp	00136$
00119$:
	C$game.c$259$2_2$118	= .
	.globl	C$game.c$259$2_2$118
;game.c:259: char pos_x = player->x;
	inc	sp
	inc	sp
	push	de
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	b, (hl)
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), b
	C$game.c$260$2_2$118	= .
	.globl	C$game.c$260$2_2$118
;game.c:260: char pos_y = player->y;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	inc	iy
	ld	0 (iy), l
	C$game.c$261$2_2$118	= .
	.globl	C$game.c$261$2_2$118
;game.c:261: char next_pos_x = player->x + x_offset;
	ld	a, b
	add	a, c
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	C$game.c$262$2_2$118	= .
	.globl	C$game.c$262$2_2$118
;game.c:262: char next_pos_y = player->y + y_offset;
	ld	a, l
	dec	iy
	add	a, 0 (iy)
	ld	0 (iy), a
	C$game.c$264$2_2$118	= .
	.globl	C$game.c$264$2_2$118
;game.c:264: char objectType = g_objMap[next_pos_y][next_pos_x];
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
	ld	hl, #18
	add	hl, sp
	ld	iy, #4
	add	iy, sp
	add	a, (hl)
	ld	0 (iy), a
	ld	a, b
	adc	a, #0x00
	inc	iy
	ld	0 (iy), a
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	inc	iy
	inc	iy
	ld	0 (iy), a
	C$game.c$265$2_2$118	= .
	.globl	C$game.c$265$2_2$118
;game.c:265: SnakeNode *tail = player; // 뱀의 마지막 부분을 찾는다
	inc	iy
	ld	0 (iy), e
	ld	1 (iy), d
	C$game.c$266$2_2$118	= .
	.globl	C$game.c$266$2_2$118
;game.c:266: while (tail->next != NULL)
00120$:
	ld	hl, #9
	add	hl, sp
	ld	iy, #7
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x04
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	ld	iy, #15
	add	iy, sp
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00122$
	C$game.c$268$3_2$119	= .
	.globl	C$game.c$268$3_2$119
;game.c:268: tail = tail->next;
	ld	a, 0 (iy)
	ld	iy, #7
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #15+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #7
	add	iy, sp
	ld	1 (iy), a
	jr	00120$
00122$:
	C$game.c$271$2_3$120	= .
	.globl	C$game.c$271$2_3$120
;game.c:271: int tail_x = tail->x;
	ld	hl, #7
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	iy, #11
	add	iy, sp
	ld	0 (iy), a
	rla
	sbc	a, a
	ld	1 (iy), a
	C$game.c$272$2_3$120	= .
	.globl	C$game.c$272$2_3$120
;game.c:272: int tail_y = tail->y;
	ld	hl, #7
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	iy, #13
	add	iy, sp
	ld	0 (iy), a
	rla
	sbc	a, a
	ld	1 (iy), a
	C$game.c$286$1_1$111	= .
	.globl	C$game.c$286$1_1$111
;game.c:286: MoveBody(player, next_pos_x, next_pos_y);
	ld	iy, #17
	add	iy, sp
	ld	a, 0 (iy)
	dec	iy
	dec	iy
	ld	0 (iy), a
	rla
	sbc	a, a
	ld	1 (iy), a
	inc	iy
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	dec	iy
	ld	0 (iy), a
	rla
	sbc	a, a
	ld	1 (iy), a
	C$game.c$274$2_3$120	= .
	.globl	C$game.c$274$2_3$120
;game.c:274: switch (objectType)
	ld	iy, #6
	add	iy, sp
	ld	a, 0 (iy)
	dec	a
	jr	Z,00123$
	ld	a, 0 (iy)
	sub	a, #0x02
	jp	Z,00129$
	jp	00130$
	C$game.c$276$3_3$121	= .
	.globl	C$game.c$276$3_3$121
;game.c:276: case FROG:					
00123$:
	C$game.c$277$3_3$121	= .
	.globl	C$game.c$277$3_3$121
;game.c:277: g_score++;
	ld	hl, (_g_score)
	inc	hl
	ld	(_g_score), hl
	C$game.c$278$3_3$121	= .
	.globl	C$game.c$278$3_3$121
;game.c:278: if (g_score > 0 && g_score % 3 == 0) {
	xor	a, a
	ld	iy, #_g_score
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00269$
	xor	a, #0x80
00269$:
	jp	P, 00127$
	ld	hl, #0x0003
	push	hl
	ld	hl, (_g_score)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	a, h
	or	a, l
	jr	NZ,00127$
	C$game.c$279$4_3$122	= .
	.globl	C$game.c$279$4_3$122
;game.c:279: step_time -= 1;
	ld	hl, (_step_time)
	dec	hl
	ld	(_step_time), hl
	C$game.c$280$4_3$122	= .
	.globl	C$game.c$280$4_3$122
;game.c:280: if (step_time < 1)
	ld	iy, #_step_time
	ld	a, 0 (iy)
	sub	a, #0x01
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00127$
	C$game.c$281$4_3$122	= .
	.globl	C$game.c$281$4_3$122
;game.c:281: step_time = 1;
	ld	hl, #0x0001
	ld	(_step_time), hl
00127$:
	C$game.c$284$3_3$121	= .
	.globl	C$game.c$284$3_3$121
;game.c:284: DrawScore();				
	call	_DrawScore
	C$game.c$285$3_3$121	= .
	.globl	C$game.c$285$3_3$121
;game.c:285: DrawHighScore();	
	call	_DrawHighScore
	C$game.c$286$3_3$121	= .
	.globl	C$game.c$286$3_3$121
;game.c:286: MoveBody(player, next_pos_x, next_pos_y);
	ld	iy, #15
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_MoveBody
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	C$game.c$288$3_4$123	= .
	.globl	C$game.c$288$3_4$123
;game.c:288: SnakeNode *newNode = malloc(sizeof(SnakeNode));
	ld	hl, #0x0006
	push	hl
	call	_malloc
	pop	af
	ld	c, l
	ld	b, h
	C$game.c$289$3_4$123	= .
	.globl	C$game.c$289$3_4$123
;game.c:289: newNode->x = tail_x;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	iy, #11
	add	iy, sp
	ld	a, 0 (iy)
	ld	(de), a
	C$game.c$290$3_4$123	= .
	.globl	C$game.c$290$3_4$123
;game.c:290: newNode->y = tail_y;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	ld	(de), a
	C$game.c$292$3_4$123	= .
	.globl	C$game.c$292$3_4$123
;game.c:292: newNode->dir = tail->dir;
	ld	iy, #7
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, b
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$game.c$293$3_4$123	= .
	.globl	C$game.c$293$3_4$123
;game.c:293: newNode->next = NULL;
	ld	hl, #0x0004
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$294$3_4$123	= .
	.globl	C$game.c$294$3_4$123
;game.c:294: tail->next = newNode;
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), c
	inc	hl
	ld	(hl), b
	C$game.c$296$3_4$123	= .
	.globl	C$game.c$296$3_4$123
;game.c:296: GenerateNewFrog(&g_frog);						
	ld	hl, #_g_frog
	push	hl
	call	_GenerateNewFrog
	pop	af
	C$game.c$298$3_4$123	= .
	.globl	C$game.c$298$3_4$123
;game.c:298: break;
	jr	00131$
	C$game.c$299$3_4$123	= .
	.globl	C$game.c$299$3_4$123
;game.c:299: case SNAKE:
00129$:
	C$game.c$300$3_4$123	= .
	.globl	C$game.c$300$3_4$123
;game.c:300: g_gamestate = STATE_GAME_OVER;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$301$3_4$123	= .
	.globl	C$game.c$301$3_4$123
;game.c:301: break;
	jr	00131$
	C$game.c$302$3_4$123	= .
	.globl	C$game.c$302$3_4$123
;game.c:302: default:
00130$:
	C$game.c$303$3_4$123	= .
	.globl	C$game.c$303$3_4$123
;game.c:303: MoveBody(player, next_pos_x, next_pos_y);
	ld	iy, #15
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_MoveBody
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	C$game.c$304$3_4$123	= .
	.globl	C$game.c$304$3_4$123
;game.c:304: RenderTile(tail_x + 1, tail_y + 1, BLACK_TILE); 
	ld	iy, #13
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	bc
	dec	iy
	dec	iy
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	de
	ld	hl, #0x0055
	push	hl
	push	bc
	push	de
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	C$game.c$306$2_3$120	= .
	.globl	C$game.c$306$2_3$120
;game.c:306: }
00131$:
	C$game.c$308$2_3$120	= .
	.globl	C$game.c$308$2_3$120
;game.c:308: g_objMap[next_pos_y][next_pos_x] = SNAKE;
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x02
	C$game.c$309$2_3$120	= .
	.globl	C$game.c$309$2_3$120
;game.c:309: g_next_step = now() + step_time;
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
	C$game.c$311$2_3$120	= .
	.globl	C$game.c$311$2_3$120
;game.c:311: RenderTile(g_frog.x + 1, g_frog.y + 1, GREEN_TILE);
	ld	a, (#_g_frog + 1)
	ld	c, a
	ld	b, #0x00
	inc	bc
	ld	a, (#_g_frog + 0)
	ld	e, a
	ld	d, #0x00
	inc	de
	ld	hl, #0x004a
	push	hl
	push	bc
	push	de
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	C$game.c$313$2_3$120	= .
	.globl	C$game.c$313$2_3$120
;game.c:313: if(g_score > 0)
	xor	a, a
	ld	iy, #_g_score
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00270$
	xor	a, #0x80
00270$:
	jp	P, 00133$
	C$game.c$314$2_3$120	= .
	.globl	C$game.c$314$2_3$120
;game.c:314: RenderTile(pos_x + 1, pos_y + 1, YELLOW_TILE);  	
	ld	iy, #3
	add	iy, sp
	ld	a, 0 (iy)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
	inc	de
	dec	iy
	ld	a, 0 (iy)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	inc	bc
	ld	hl, #0x004d
	push	hl
	push	de
	push	bc
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
00133$:
	C$game.c$316$2_3$120	= .
	.globl	C$game.c$316$2_3$120
;game.c:316: RenderTile(next_pos_x + 1, next_pos_y + 1, WHITE_TILE); 
	ld	iy, #15
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	bc
	inc	iy
	inc	iy
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	de
	ld	hl, #0x0051
	push	hl
	push	bc
	push	de
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
00136$:
	C$game.c$318$1_1$111	= .
	.globl	C$game.c$318$1_1$111
;game.c:318: }
	ld	hl, #19
	add	hl, sp
	ld	sp, hl
	C$game.c$318$1_1$111	= .
	.globl	C$game.c$318$1_1$111
	XG$ProcessLogic$0$0	= .
	.globl	XG$ProcessLogic$0$0
	ret
	G$DrawBackground$0$0	= .
	.globl	G$DrawBackground$0$0
	C$game.c$320$1_1$124	= .
	.globl	C$game.c$320$1_1$124
;game.c:320: void DrawBackground()
;	---------------------------------
; Function DrawBackground
; ---------------------------------
_DrawBackground::
	C$game.c$322$1_0$124	= .
	.globl	C$game.c$322$1_0$124
;game.c:322: for (int index = 0; index < MAP_WIDTH + 1; index++)
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
	C$game.c$323$2_0$125	= .
	.globl	C$game.c$323$2_0$125
;game.c:323: RenderTile(index, 0, 77);
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
	C$game.c$322$2_0$125	= .
	.globl	C$game.c$322$2_0$125
;game.c:322: for (int index = 0; index < MAP_WIDTH + 1; index++)
	inc	bc
	jr	00106$
00101$:
	C$game.c$325$1_0$124	= .
	.globl	C$game.c$325$1_0$124
;game.c:325: for (int index = 0; index < MAP_WIDTH + 2; index++)
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
	C$game.c$326$2_0$126	= .
	.globl	C$game.c$326$2_0$126
;game.c:326: RenderTile(index, MAP_HEIGHT + 1, 77);
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
	C$game.c$325$2_0$126	= .
	.globl	C$game.c$325$2_0$126
;game.c:325: for (int index = 0; index < MAP_WIDTH + 2; index++)
	inc	bc
	jr	00109$
00102$:
	C$game.c$328$1_0$124	= .
	.globl	C$game.c$328$1_0$124
;game.c:328: for (int index = 1; index < MAP_HEIGHT + 1; index++)
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
	C$game.c$329$2_0$127	= .
	.globl	C$game.c$329$2_0$127
;game.c:329: RenderTile(0, index, 77);
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
	C$game.c$328$2_0$127	= .
	.globl	C$game.c$328$2_0$127
;game.c:328: for (int index = 1; index < MAP_HEIGHT + 1; index++)
	inc	bc
	jr	00112$
00103$:
	C$game.c$331$1_0$124	= .
	.globl	C$game.c$331$1_0$124
;game.c:331: for (int index = 0; index < MAP_HEIGHT + 1; index++)
	ld	bc, #0x0000
00115$:
	ld	a, c
	sub	a, #0x15
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00104$
	C$game.c$332$2_0$128	= .
	.globl	C$game.c$332$2_0$128
;game.c:332: RenderTile(MAP_WIDTH + 1, index, 77);
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
	C$game.c$331$2_0$128	= .
	.globl	C$game.c$331$2_0$128
;game.c:331: for (int index = 0; index < MAP_HEIGHT + 1; index++)
	inc	bc
	jr	00115$
00104$:
	C$game.c$333$1_0$124	= .
	.globl	C$game.c$333$1_0$124
;game.c:333: DrawScore();
	call	_DrawScore
	C$game.c$334$1_0$124	= .
	.globl	C$game.c$334$1_0$124
;game.c:334: DrawHighScore();
	C$game.c$335$1_0$124	= .
	.globl	C$game.c$335$1_0$124
;game.c:335: }
	C$game.c$335$1_0$124	= .
	.globl	C$game.c$335$1_0$124
	XG$DrawBackground$0$0	= .
	.globl	XG$DrawBackground$0$0
	jp	_DrawHighScore
	.area _CODE
	.area _INITIALIZER
Fgame$__xinit_g_score$0_0$0 == .
__xinit__g_score:
	.dw #0x0000
Fgame$__xinit_g_high_score$0_0$0 == .
__xinit__g_high_score:
	.dw #0x0000
Fgame$__xinit_g_score_text$0_0$0 == .
__xinit__g_score_text:
	.ascii "SCORE 000"
	.db 0x00
Fgame$__xinit_g_high_score_text$0_0$0 == .
__xinit__g_high_score_text:
	.ascii "HIGH 000"
	.db 0x00
Fgame$__xinit_step_time$0_0$0 == .
__xinit__step_time:
	.dw #0x000a
Fgame$__xinit_g_next_step$0_0$0 == .
__xinit__g_next_step:
	.byte #0x00, #0x00, #0x00, #0x00	;  0
Fgame$__xinit_g_player$0_0$0 == .
__xinit__g_player:
	.dw #0x0000
	.area _CABS (ABS)
