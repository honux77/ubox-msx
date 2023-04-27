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
	.globl _drawScore
	.globl _score2text
	.globl _now
	.globl _RenderTile
	.globl _put_text
	.globl _malloc
	.globl _srand
	.globl _rand
	.globl _ubox_read_keys
	.globl _ubox_wait
	.globl _ubox_fill_screen
	.globl _ubox_disable_screen
	.globl _ubox_enable_screen
	.globl _g_player
	.globl _g_key
	.globl _g_next_step
	.globl _step_time
	.globl _g_score_text
	.globl _g_score
	.globl _g_frog
	.globl _g_objMap
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
G$g_score_text$0_0$0==.
_g_score_text::
	.ds 4
G$step_time$0_0$0==.
_step_time::
	.ds 2
G$g_next_step$0_0$0==.
_g_next_step::
	.ds 4
G$g_key$0_0$0==.
_g_key::
	.ds 2
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
	G$score2text$0$0	= .
	.globl	G$score2text$0$0
	C$game.c$67$0_0$82	= .
	.globl	C$game.c$67$0_0$82
;game.c:67: void score2text(int num) {	
;	---------------------------------
; Function score2text
; ---------------------------------
_score2text::
	push	af
	C$game.c$69$1_0$82	= .
	.globl	C$game.c$69$1_0$82
;game.c:69: if (num == 0) {
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ,00110$
	C$game.c$70$2_0$83	= .
	.globl	C$game.c$70$2_0$83
;game.c:70: g_score_text[2] = '0';		
	ld	hl, #(_g_score_text + 0x0002)
	ld	(hl), #0x30
	C$game.c$71$2_0$83	= .
	.globl	C$game.c$71$2_0$83
;game.c:71: return;
	jr	00106$
	C$game.c$74$1_0$82	= .
	.globl	C$game.c$74$1_0$82
;game.c:74: while (num > 0) {
00110$:
	ld	bc, #0x0002
00103$:
	xor	a, a
	ld	iy, #4
	add	iy, sp
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00124$
	xor	a, #0x80
00124$:
	jp	P, 00106$
	C$game.c$75$2_0$84	= .
	.globl	C$game.c$75$2_0$84
;game.c:75: g_score_text[i--] = (num % 10) + '0';
	ld	a, #<(_g_score_text)
	ld	hl, #0
	add	hl, sp
	add	a, c
	ld	(hl), a
	ld	a, #>(_g_score_text)
	adc	a, b
	inc	hl
	ld	(hl), a
	dec	bc
	push	bc
	ld	hl, #0x000a
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__modsint
	pop	af
	pop	af
	pop	bc
	ld	a, l
	add	a, #0x30
	pop	hl
	push	hl
	ld	(hl), a
	C$game.c$76$1_0$82	= .
	.globl	C$game.c$76$1_0$82
;game.c:76: num /= 10;
	push	bc
	ld	hl, #0x000a
	push	hl
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	__divsint
	pop	af
	pop	af
	pop	bc
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	jr	00103$
00106$:
	C$game.c$78$1_0$82	= .
	.globl	C$game.c$78$1_0$82
;game.c:78: }
	pop	af
	C$game.c$78$1_0$82	= .
	.globl	C$game.c$78$1_0$82
	XG$score2text$0$0	= .
	.globl	XG$score2text$0$0
	ret
	G$run_game$0$0	= .
	.globl	G$run_game$0$0
	C$game.c$80$1_0$85	= .
	.globl	C$game.c$80$1_0$85
;game.c:80: void run_game()
;	---------------------------------
; Function run_game
; ---------------------------------
_run_game::
	C$game.c$82$1_0$85	= .
	.globl	C$game.c$82$1_0$85
;game.c:82: g_gamestate = STATE_IN_GAME;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x01
	C$game.c$84$1_0$85	= .
	.globl	C$game.c$84$1_0$85
;game.c:84: InitGame();
	call	_InitGame
	C$game.c$85$1_0$85	= .
	.globl	C$game.c$85$1_0$85
;game.c:85: ubox_disable_screen();
	call	_ubox_disable_screen
	C$game.c$86$1_0$85	= .
	.globl	C$game.c$86$1_0$85
;game.c:86: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$game.c$87$1_0$85	= .
	.globl	C$game.c$87$1_0$85
;game.c:87: DrawBackground();
	call	_DrawBackground
	C$game.c$88$1_0$85	= .
	.globl	C$game.c$88$1_0$85
;game.c:88: ubox_enable_screen();
	call	_ubox_enable_screen
	C$game.c$90$1_0$85	= .
	.globl	C$game.c$90$1_0$85
;game.c:90: while (1)
00104$:
	C$game.c$92$2_0$86	= .
	.globl	C$game.c$92$2_0$86
;game.c:92: ProcessLogic(g_player);		
	ld	hl, (_g_player)
	push	hl
	call	_ProcessLogic
	pop	af
	C$game.c$93$2_0$86	= .
	.globl	C$game.c$93$2_0$86
;game.c:93: ubox_wait();
	call	_ubox_wait
	C$game.c$95$2_0$86	= .
	.globl	C$game.c$95$2_0$86
;game.c:95: if (g_gamestate == STATE_GAME_OVER)
	ld	a,(#_g_gamestate + 0)
	sub	a, #0x02
	jr	NZ,00104$
	C$game.c$96$1_0$85	= .
	.globl	C$game.c$96$1_0$85
;game.c:96: break;
	C$game.c$98$1_0$85	= .
	.globl	C$game.c$98$1_0$85
;game.c:98: }
	C$game.c$98$1_0$85	= .
	.globl	C$game.c$98$1_0$85
	XG$run_game$0$0	= .
	.globl	XG$run_game$0$0
	ret
	G$drawScore$0$0	= .
	.globl	G$drawScore$0$0
	C$game.c$102$1_0$87	= .
	.globl	C$game.c$102$1_0$87
;game.c:102: void drawScore() {
;	---------------------------------
; Function drawScore
; ---------------------------------
_drawScore::
	C$game.c$103$1_0$87	= .
	.globl	C$game.c$103$1_0$87
;game.c:103: score2text(g_score);			
	ld	hl, (_g_score)
	push	hl
	call	_score2text
	C$game.c$104$1_0$87	= .
	.globl	C$game.c$104$1_0$87
;game.c:104: put_text(MAP_WIDTH - 2, MAP_HEIGHT, g_score_text); 
	ld	hl, #_g_score_text
	ex	(sp),hl
	ld	de, #0x141c
	push	de
	call	_put_text
	pop	af
	pop	af
	C$game.c$105$1_0$87	= .
	.globl	C$game.c$105$1_0$87
;game.c:105: }
	C$game.c$105$1_0$87	= .
	.globl	C$game.c$105$1_0$87
	XG$drawScore$0$0	= .
	.globl	XG$drawScore$0$0
	ret
	G$InitGame$0$0	= .
	.globl	G$InitGame$0$0
	C$game.c$107$1_0$88	= .
	.globl	C$game.c$107$1_0$88
;game.c:107: void InitGame()
;	---------------------------------
; Function InitGame
; ---------------------------------
_InitGame::
	push	af
	push	af
	C$game.c$109$1_0$88	= .
	.globl	C$game.c$109$1_0$88
;game.c:109: srand(now());
	call	_now
	push	hl
	call	_srand
	pop	af
	C$game.c$110$1_0$88	= .
	.globl	C$game.c$110$1_0$88
;game.c:110: g_score = 0;
	ld	hl, #0x0000
	ld	(_g_score), hl
	C$game.c$111$1_0$88	= .
	.globl	C$game.c$111$1_0$88
;game.c:111: step_time = 10;
	ld	l, #0x0a
	ld	(_step_time), hl
	C$game.c$114$1_0$88	= .
	.globl	C$game.c$114$1_0$88
;game.c:114: g_player = malloc(sizeof(SnakeNode));
	ld	l, #0x06
	push	hl
	call	_malloc
	pop	af
	ld	(_g_player), hl
	C$game.c$115$1_0$88	= .
	.globl	C$game.c$115$1_0$88
;game.c:115: g_player->dir = rand() % 4; //초기 방향
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
	C$game.c$117$1_0$88	= .
	.globl	C$game.c$117$1_0$88
;game.c:117: g_player->x = MAP_WIDTH / 2;
	ld	hl, (_g_player)
	inc	hl
	inc	hl
	ld	(hl), #0x0f
	C$game.c$118$1_0$88	= .
	.globl	C$game.c$118$1_0$88
;game.c:118: g_player->y = MAP_HEIGHT / 2;
	ld	hl, (_g_player)
	inc	hl
	inc	hl
	inc	hl
	ld	a, h
	ld	h, a
	ld	(hl), #0x0a
	C$game.c$119$1_0$88	= .
	.globl	C$game.c$119$1_0$88
;game.c:119: g_player->next = NULL;
	ld	hl, (_g_player)
	ld	bc, #0x0004
	add	hl, bc
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$122$5_1$93	= .
	.globl	C$game.c$122$5_1$93
;game.c:122: for (i = 0; i < MAP_HEIGHT; i++)
	ld	bc, #0x0000
	C$game.c$124$1_1$88	= .
	.globl	C$game.c$124$1_1$88
;game.c:124: for (j = 0; j < MAP_WIDTH; j++)
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
	C$game.c$126$5_1$93	= .
	.globl	C$game.c$126$5_1$93
;game.c:126: g_objMap[i][j] = NOTHING;
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
	C$game.c$124$4_1$92	= .
	.globl	C$game.c$124$4_1$92
;game.c:124: for (j = 0; j < MAP_WIDTH; j++)
	inc	de
	ld	a, e
	sub	a, #0x1e
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00103$
	C$game.c$122$2_1$90	= .
	.globl	C$game.c$122$2_1$90
;game.c:122: for (i = 0; i < MAP_HEIGHT; i++)
	inc	bc
	ld	a, c
	sub	a, #0x14
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00109$
	C$game.c$130$1_1$89	= .
	.globl	C$game.c$130$1_1$89
;game.c:130: GenerateNewFrog(&g_frog);
	ld	hl, #_g_frog
	push	hl
	call	_GenerateNewFrog
	pop	af
	C$game.c$131$1_1$89	= .
	.globl	C$game.c$131$1_1$89
;game.c:131: g_next_step = now() + step_time;	
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
	C$game.c$132$1_1$89	= .
	.globl	C$game.c$132$1_1$89
;game.c:132: drawScore();
	call	_drawScore
	C$game.c$133$1_1$88	= .
	.globl	C$game.c$133$1_1$88
;game.c:133: }
	pop	af
	pop	af
	C$game.c$133$1_1$88	= .
	.globl	C$game.c$133$1_1$88
	XG$InitGame$0$0	= .
	.globl	XG$InitGame$0$0
	ret
	G$MoveBody$0$0	= .
	.globl	G$MoveBody$0$0
	C$game.c$135$1_1$95	= .
	.globl	C$game.c$135$1_1$95
;game.c:135: SnakeNode* MoveBody(SnakeNode *node, int xPos, int yPos) 
;	---------------------------------
; Function MoveBody
; ---------------------------------
_MoveBody::
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
	C$game.c$137$1_0$95	= .
	.globl	C$game.c$137$1_0$95
;game.c:137: if (node->next == NULL) 
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
	C$game.c$139$1_0$95	= .
	.globl	C$game.c$139$1_0$95
;game.c:139: g_objMap[node->y][ node->x] = NOTHING;
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
	C$game.c$137$1_0$95	= .
	.globl	C$game.c$137$1_0$95
;game.c:137: if (node->next == NULL) 
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	NZ,00102$
	C$game.c$139$2_0$96	= .
	.globl	C$game.c$139$2_0$96
;game.c:139: g_objMap[node->y][ node->x] = NOTHING;
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
	C$game.c$143$2_0$97	= .
	.globl	C$game.c$143$2_0$97
;game.c:143: node->next = MoveBody(node->next, node->x, node->y);
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
	C$game.c$145$1_0$95	= .
	.globl	C$game.c$145$1_0$95
;game.c:145: node->x = xPos;
	ld	hl, #13+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$146$1_0$95	= .
	.globl	C$game.c$146$1_0$95
;game.c:146: node->y = yPos;
	ld	hl, #15+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$147$1_0$95	= .
	.globl	C$game.c$147$1_0$95
;game.c:147: return node;
	ld	l, c
	ld	h, b
	C$game.c$148$1_0$95	= .
	.globl	C$game.c$148$1_0$95
;game.c:148: }
	ld	iy, #9
	add	iy, sp
	ld	sp, iy
	C$game.c$148$1_0$95	= .
	.globl	C$game.c$148$1_0$95
	XG$MoveBody$0$0	= .
	.globl	XG$MoveBody$0$0
	ret
	G$GenerateNewFrog$0$0	= .
	.globl	G$GenerateNewFrog$0$0
	C$game.c$151$1_0$99	= .
	.globl	C$game.c$151$1_0$99
;game.c:151: void GenerateNewFrog(Point* point)
;	---------------------------------
; Function GenerateNewFrog
; ---------------------------------
_GenerateNewFrog::
	push	af
	C$game.c$153$1_0$99	= .
	.globl	C$game.c$153$1_0$99
;game.c:153: do
00101$:
	C$game.c$155$2_0$100	= .
	.globl	C$game.c$155$2_0$100
;game.c:155: point->x = (int)(rand() % (MAP_WIDTH - 1));
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
	C$game.c$156$2_0$100	= .
	.globl	C$game.c$156$2_0$100
;game.c:156: point->y = (int)(rand() % (MAP_HEIGHT - 1));
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
	C$game.c$158$1_0$99	= .
	.globl	C$game.c$158$1_0$99
;game.c:158: } while (g_objMap[point->y][point->x] != NOTHING);
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
	C$game.c$159$1_0$99	= .
	.globl	C$game.c$159$1_0$99
;game.c:159: g_objMap[point->y][point->x] = FROG;
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
	C$game.c$161$1_0$99	= .
	.globl	C$game.c$161$1_0$99
;game.c:161: }
	pop	af
	C$game.c$161$1_0$99	= .
	.globl	C$game.c$161$1_0$99
	XG$GenerateNewFrog$0$0	= .
	.globl	XG$GenerateNewFrog$0$0
	ret
	G$CheckWall$0$0	= .
	.globl	G$CheckWall$0$0
	C$game.c$163$1_0$102	= .
	.globl	C$game.c$163$1_0$102
;game.c:163: char CheckWall(SnakeNode *player)
;	---------------------------------
; Function CheckWall
; ---------------------------------
_CheckWall::
	dec	sp
	C$game.c$165$2_0$102	= .
	.globl	C$game.c$165$2_0$102
;game.c:165: char result = 1;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), #0x01
	C$game.c$166$1_0$102	= .
	.globl	C$game.c$166$1_0$102
;game.c:166: if (player->dir == LEFT)
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
	C$game.c$168$2_0$103	= .
	.globl	C$game.c$168$2_0$103
;game.c:168: if (player->x > 0)		
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
	C$game.c$169$2_0$103	= .
	.globl	C$game.c$169$2_0$103
;game.c:169: result = 0;				
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00118$:
	C$game.c$171$1_0$102	= .
	.globl	C$game.c$171$1_0$102
;game.c:171: else if (player->dir == RIGHT)
	ld	a, e
	dec	a
	or	a, d
	jr	NZ,00115$
	C$game.c$173$2_0$104	= .
	.globl	C$game.c$173$2_0$104
;game.c:173: if (player->x < MAP_WIDTH - 1)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x9d
	jr	NC,00119$
	C$game.c$174$2_0$104	= .
	.globl	C$game.c$174$2_0$104
;game.c:174: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00115$:
	C$game.c$176$1_0$102	= .
	.globl	C$game.c$176$1_0$102
;game.c:176: else if (player->dir == UP)
	ld	a, e
	sub	a, #0x02
	or	a, d
	jr	NZ,00112$
	C$game.c$178$2_0$105	= .
	.globl	C$game.c$178$2_0$105
;game.c:178: if (player->y > 0)		
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
	C$game.c$179$2_0$105	= .
	.globl	C$game.c$179$2_0$105
;game.c:179: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	jr	00119$
00112$:
	C$game.c$181$1_0$102	= .
	.globl	C$game.c$181$1_0$102
;game.c:181: else if (player->dir == DOWN)
	ld	a, e
	sub	a, #0x03
	or	a, d
	jr	NZ,00119$
	C$game.c$183$2_0$106	= .
	.globl	C$game.c$183$2_0$106
;game.c:183: if (player->y < MAP_HEIGHT - 1)			
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x93
	jr	NC,00119$
	C$game.c$184$2_0$106	= .
	.globl	C$game.c$184$2_0$106
;game.c:184: result = 0;		
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
00119$:
	C$game.c$187$1_0$102	= .
	.globl	C$game.c$187$1_0$102
;game.c:187: return result;
	ld	iy, #0
	add	iy, sp
	ld	l, 0 (iy)
	C$game.c$188$1_0$102	= .
	.globl	C$game.c$188$1_0$102
;game.c:188: }
	inc	sp
	C$game.c$188$1_0$102	= .
	.globl	C$game.c$188$1_0$102
	XG$CheckWall$0$0	= .
	.globl	XG$CheckWall$0$0
	ret
	G$ProcessLogic$0$0	= .
	.globl	G$ProcessLogic$0$0
	C$game.c$190$1_0$108	= .
	.globl	C$game.c$190$1_0$108
;game.c:190: void ProcessLogic(SnakeNode *player)
;	---------------------------------
; Function ProcessLogic
; ---------------------------------
_ProcessLogic::
	ld	hl, #-15
	add	hl, sp
	ld	sp, hl
	C$game.c$192$1_0$108	= .
	.globl	C$game.c$192$1_0$108
;game.c:192: if (g_gamestate != STATE_IN_GAME)
	ld	a,(#_g_gamestate + 0)
	C$game.c$193$1_0$108	= .
	.globl	C$game.c$193$1_0$108
;game.c:193: return;
	C$game.c$195$2_0$109	= .
	.globl	C$game.c$195$2_0$109
;game.c:195: char x_offset = 0;
	dec	a
	jp	NZ,00131$
	ld	c,a
	C$game.c$196$2_0$109	= .
	.globl	C$game.c$196$2_0$109
;game.c:196: char y_offset = 0;
	xor	a, a
	ld	iy, #13
	add	iy, sp
	ld	0 (iy), a
	C$game.c$198$1_1$109	= .
	.globl	C$game.c$198$1_1$109
;game.c:198: switch(ubox_read_keys(8))
	push	bc
	ld	l, #0x08
	call	_ubox_read_keys
	pop	bc
	C$game.c$201$1_1$108	= .
	.globl	C$game.c$201$1_1$108
;game.c:201: player->dir = LEFT;
	ld	iy, #17
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	C$game.c$198$1_1$109	= .
	.globl	C$game.c$198$1_1$109
;game.c:198: switch(ubox_read_keys(8))
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
	C$game.c$200$2_1$110	= .
	.globl	C$game.c$200$2_1$110
;game.c:200: case UBOX_MSX_KEY_LEFT:
00103$:
	C$game.c$201$2_1$110	= .
	.globl	C$game.c$201$2_1$110
;game.c:201: player->dir = LEFT;
	ld	l, e
	ld	h, d
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	C$game.c$202$2_1$110	= .
	.globl	C$game.c$202$2_1$110
;game.c:202: break;
	jr	00107$
	C$game.c$203$2_1$110	= .
	.globl	C$game.c$203$2_1$110
;game.c:203: case UBOX_MSX_KEY_RIGHT:
00104$:
	C$game.c$204$2_1$110	= .
	.globl	C$game.c$204$2_1$110
;game.c:204: player->dir = RIGHT;
	ld	l, e
	ld	h, d
	ld	(hl), #0x01
	inc	hl
	ld	(hl), #0x00
	C$game.c$205$2_1$110	= .
	.globl	C$game.c$205$2_1$110
;game.c:205: break;
	jr	00107$
	C$game.c$206$2_1$110	= .
	.globl	C$game.c$206$2_1$110
;game.c:206: case UBOX_MSX_KEY_UP:
00105$:
	C$game.c$207$2_1$110	= .
	.globl	C$game.c$207$2_1$110
;game.c:207: player->dir = UP;
	ld	l, e
	ld	h, d
	ld	(hl), #0x02
	inc	hl
	ld	(hl), #0x00
	C$game.c$208$2_1$110	= .
	.globl	C$game.c$208$2_1$110
;game.c:208: break;
	jr	00107$
	C$game.c$209$2_1$110	= .
	.globl	C$game.c$209$2_1$110
;game.c:209: case UBOX_MSX_KEY_DOWN:
00106$:
	C$game.c$210$2_1$110	= .
	.globl	C$game.c$210$2_1$110
;game.c:210: player->dir = DOWN;
	ld	l, e
	ld	h, d
	ld	(hl), #0x03
	inc	hl
	ld	(hl), #0x00
	C$game.c$212$1_1$109	= .
	.globl	C$game.c$212$1_1$109
;game.c:212: }
00107$:
	C$game.c$214$1_1$109	= .
	.globl	C$game.c$214$1_1$109
;game.c:214: switch(player->dir)
	ld	l, e
	ld	h, d
	ld	a, (hl)
	ld	iy, #11
	add	iy, sp
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	ld	a, 0 (iy)
	or	a, a
	or	a, 1 (iy)
	jr	Z,00108$
	ld	a, 0 (iy)
	dec	a
	or	a, 1 (iy)
	jr	Z,00109$
	ld	a, 0 (iy)
	sub	a, #0x02
	or	a, 1 (iy)
	jr	Z,00110$
	ld	a, 0 (iy)
	sub	a, #0x03
	or	a, 1 (iy)
	jr	Z,00111$
	jr	00112$
	C$game.c$216$2_1$111	= .
	.globl	C$game.c$216$2_1$111
;game.c:216: case LEFT:
00108$:
	C$game.c$217$2_1$111	= .
	.globl	C$game.c$217$2_1$111
;game.c:217: x_offset = -1;
	ld	c, #0xff
	C$game.c$218$2_1$111	= .
	.globl	C$game.c$218$2_1$111
;game.c:218: break;
	jr	00112$
	C$game.c$219$2_1$111	= .
	.globl	C$game.c$219$2_1$111
;game.c:219: case RIGHT:			
00109$:
	C$game.c$220$2_1$111	= .
	.globl	C$game.c$220$2_1$111
;game.c:220: x_offset = 1;
	ld	c, #0x01
	C$game.c$221$2_1$111	= .
	.globl	C$game.c$221$2_1$111
;game.c:221: break;
	jr	00112$
	C$game.c$222$2_1$111	= .
	.globl	C$game.c$222$2_1$111
;game.c:222: case UP:			
00110$:
	C$game.c$223$2_1$111	= .
	.globl	C$game.c$223$2_1$111
;game.c:223: y_offset = -1;
	ld	iy, #13
	add	iy, sp
	ld	0 (iy), #0xff
	C$game.c$224$2_1$111	= .
	.globl	C$game.c$224$2_1$111
;game.c:224: break;
	jr	00112$
	C$game.c$225$2_1$111	= .
	.globl	C$game.c$225$2_1$111
;game.c:225: case DOWN:			
00111$:
	C$game.c$226$2_1$111	= .
	.globl	C$game.c$226$2_1$111
;game.c:226: y_offset = 1;
	ld	iy, #13
	add	iy, sp
	ld	0 (iy), #0x01
	C$game.c$228$1_1$109	= .
	.globl	C$game.c$228$1_1$109
;game.c:228: }
00112$:
	C$game.c$230$1_1$109	= .
	.globl	C$game.c$230$1_1$109
;game.c:230: if (now() > g_next_step)
	push	bc
	push	de
	call	_now
	pop	de
	pop	bc
	ld	iy, #9
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
	jp	PO, 00237$
	xor	a, #0x80
00237$:
	jp	P, 00131$
	C$game.c$233$2_1$112	= .
	.globl	C$game.c$233$2_1$112
;game.c:233: if(CheckWall(player))
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
	C$game.c$235$3_1$113	= .
	.globl	C$game.c$235$3_1$113
;game.c:235: g_gamestate = STATE_GAME_OVER;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$236$3_1$113	= .
	.globl	C$game.c$236$3_1$113
;game.c:236: return;
	jp	00131$
00114$:
	C$game.c$239$2_2$114	= .
	.globl	C$game.c$239$2_2$114
;game.c:239: char pos_x = player->x;
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
	C$game.c$240$2_2$114	= .
	.globl	C$game.c$240$2_2$114
;game.c:240: char pos_y = player->y;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	l, (hl)
	inc	iy
	ld	0 (iy), l
	C$game.c$241$2_2$114	= .
	.globl	C$game.c$241$2_2$114
;game.c:241: char next_pos_x = player->x + x_offset;
	ld	a, b
	add	a, c
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), a
	C$game.c$242$2_2$114	= .
	.globl	C$game.c$242$2_2$114
;game.c:242: char next_pos_y = player->y + y_offset;
	ld	a, l
	dec	iy
	add	a, 0 (iy)
	ld	0 (iy), a
	C$game.c$244$2_2$114	= .
	.globl	C$game.c$244$2_2$114
;game.c:244: char objectType = g_objMap[next_pos_y][next_pos_x];
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
	ld	hl, #14
	add	hl, sp
	add	a, (hl)
	ld	c, a
	jr	NC,00238$
	inc	b
00238$:
	ld	a, (bc)
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), a
	C$game.c$245$2_2$114	= .
	.globl	C$game.c$245$2_2$114
;game.c:245: SnakeNode *tail = player; // 뱀의 마지막 부분을 찾는다
	C$game.c$246$2_2$114	= .
	.globl	C$game.c$246$2_2$114
;game.c:246: while (tail->next != NULL)
00115$:
	ld	hl, #0x0004
	add	hl, de
	ld	iy, #5
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l,a
	or	a,h
	jr	Z,00117$
	C$game.c$248$3_2$115	= .
	.globl	C$game.c$248$3_2$115
;game.c:248: tail = tail->next;
	ex	de,hl
	jr	00115$
00117$:
	C$game.c$251$2_3$116	= .
	.globl	C$game.c$251$2_3$116
;game.c:251: int tail_x = tail->x;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	iy, #7
	add	iy, sp
	ld	0 (iy), a
	rla
	sbc	a, a
	ld	1 (iy), a
	C$game.c$252$2_3$116	= .
	.globl	C$game.c$252$2_3$116
;game.c:252: int tail_y = tail->y;
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	iy
	inc	iy
	ld	0 (iy), a
	rla
	sbc	a, a
	ld	1 (iy), a
	C$game.c$265$1_1$108	= .
	.globl	C$game.c$265$1_1$108
;game.c:265: MoveBody(player, next_pos_x, next_pos_y);
	ld	iy, #13
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
	C$game.c$254$2_3$116	= .
	.globl	C$game.c$254$2_3$116
;game.c:254: switch (objectType)
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	dec	a
	jr	Z,00118$
	ld	a, 0 (iy)
	sub	a, #0x02
	jp	Z,00124$
	jp	00125$
	C$game.c$256$3_3$117	= .
	.globl	C$game.c$256$3_3$117
;game.c:256: case FROG:					
00118$:
	C$game.c$257$3_3$117	= .
	.globl	C$game.c$257$3_3$117
;game.c:257: g_score++;
	ld	hl, (_g_score)
	inc	hl
	ld	(_g_score), hl
	C$game.c$258$3_3$117	= .
	.globl	C$game.c$258$3_3$117
;game.c:258: if (g_score > 0 && g_score % 3 == 0) {
	xor	a, a
	ld	iy, #_g_score
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00241$
	xor	a, #0x80
00241$:
	jp	P, 00122$
	push	bc
	push	de
	ld	hl, #0x0003
	push	hl
	ld	hl, (_g_score)
	push	hl
	call	__modsint
	pop	af
	pop	af
	pop	de
	pop	bc
	ld	a, h
	or	a, l
	jr	NZ,00122$
	C$game.c$259$4_3$118	= .
	.globl	C$game.c$259$4_3$118
;game.c:259: step_time -= 1;
	ld	hl, (_step_time)
	dec	hl
	ld	(_step_time), hl
	C$game.c$260$4_3$118	= .
	.globl	C$game.c$260$4_3$118
;game.c:260: if (step_time < 1)
	ld	iy, #_step_time
	ld	a, 0 (iy)
	sub	a, #0x01
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00122$
	C$game.c$261$4_3$118	= .
	.globl	C$game.c$261$4_3$118
;game.c:261: step_time = 1;
	ld	hl, #0x0001
	ld	(_step_time), hl
00122$:
	C$game.c$264$3_3$117	= .
	.globl	C$game.c$264$3_3$117
;game.c:264: drawScore();			
	push	bc
	push	de
	call	_drawScore
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
	ld	hl, #8
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_MoveBody
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	ld	hl, #0x0006
	push	hl
	call	_malloc
	pop	af
	pop	de
	pop	bc
	inc	sp
	inc	sp
	push	hl
	C$game.c$268$3_4$119	= .
	.globl	C$game.c$268$3_4$119
;game.c:268: newNode->x = tail_x;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	ld	iy, #7
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$269$3_4$119	= .
	.globl	C$game.c$269$3_4$119
;game.c:269: newNode->y = tail_y;
	pop	hl
	push	hl
	inc	hl
	inc	hl
	inc	hl
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$271$3_4$119	= .
	.globl	C$game.c$271$3_4$119
;game.c:271: newNode->dir = tail->dir;
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	C$game.c$272$3_4$119	= .
	.globl	C$game.c$272$3_4$119
;game.c:272: newNode->next = NULL;
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x04
	ld	e, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	d, a
	xor	a, a
	ld	(de), a
	inc	de
	ld	(de), a
	C$game.c$273$3_4$119	= .
	.globl	C$game.c$273$3_4$119
;game.c:273: tail->next = newNode;
	ld	hl, #5
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	C$game.c$275$3_4$119	= .
	.globl	C$game.c$275$3_4$119
;game.c:275: GenerateNewFrog(&g_frog);						
	push	bc
	ld	hl, #_g_frog
	push	hl
	call	_GenerateNewFrog
	pop	af
	pop	bc
	C$game.c$277$3_4$119	= .
	.globl	C$game.c$277$3_4$119
;game.c:277: break;
	jr	00126$
	C$game.c$278$3_4$119	= .
	.globl	C$game.c$278$3_4$119
;game.c:278: case SNAKE:
00124$:
	C$game.c$279$3_4$119	= .
	.globl	C$game.c$279$3_4$119
;game.c:279: g_gamestate = STATE_GAME_OVER;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$280$3_4$119	= .
	.globl	C$game.c$280$3_4$119
;game.c:280: break;
	jr	00126$
	C$game.c$281$3_4$119	= .
	.globl	C$game.c$281$3_4$119
;game.c:281: default:
00125$:
	C$game.c$282$3_4$119	= .
	.globl	C$game.c$282$3_4$119
;game.c:282: MoveBody(player, next_pos_x, next_pos_y);
	push	bc
	ld	iy, #13
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_MoveBody
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$283$3_4$119	= .
	.globl	C$game.c$283$3_4$119
;game.c:283: RenderTile(tail_x + 1, tail_y + 1, BLACK_TILE); 
	ld	hl, #5
	add	hl, sp
	ld	iy, #9
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	dec	iy
	dec	iy
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	de
	push	bc
	ld	hl, #0x0055
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	push	de
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$285$2_3$116	= .
	.globl	C$game.c$285$2_3$116
;game.c:285: }
00126$:
	C$game.c$287$2_3$116	= .
	.globl	C$game.c$287$2_3$116
;game.c:287: g_objMap[next_pos_y][next_pos_x] = SNAKE;
	ld	a, #0x02
	ld	(bc), a
	C$game.c$288$2_3$116	= .
	.globl	C$game.c$288$2_3$116
;game.c:288: g_next_step = now() + step_time;
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
	C$game.c$290$2_3$116	= .
	.globl	C$game.c$290$2_3$116
;game.c:290: RenderTile(g_frog.x + 1, g_frog.y + 1, GREEN_TILE);
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
	C$game.c$292$2_3$116	= .
	.globl	C$game.c$292$2_3$116
;game.c:292: if(g_score > 0)
	xor	a, a
	ld	iy, #_g_score
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00242$
	xor	a, #0x80
00242$:
	jp	P, 00128$
	C$game.c$293$2_3$116	= .
	.globl	C$game.c$293$2_3$116
;game.c:293: RenderTile(pos_x + 1, pos_y + 1, YELLOW_TILE);  	
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
00128$:
	C$game.c$295$2_3$116	= .
	.globl	C$game.c$295$2_3$116
;game.c:295: RenderTile(next_pos_x + 1, next_pos_y + 1, WHITE_TILE); 
	ld	iy, #11
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
00131$:
	C$game.c$297$1_1$108	= .
	.globl	C$game.c$297$1_1$108
;game.c:297: }
	ld	hl, #15
	add	hl, sp
	ld	sp, hl
	C$game.c$297$1_1$108	= .
	.globl	C$game.c$297$1_1$108
	XG$ProcessLogic$0$0	= .
	.globl	XG$ProcessLogic$0$0
	ret
	G$DrawBackground$0$0	= .
	.globl	G$DrawBackground$0$0
	C$game.c$299$1_1$120	= .
	.globl	C$game.c$299$1_1$120
;game.c:299: void DrawBackground()
;	---------------------------------
; Function DrawBackground
; ---------------------------------
_DrawBackground::
	C$game.c$301$2_0$120	= .
	.globl	C$game.c$301$2_0$120
;game.c:301: for (int index = 0; index < MAP_WIDTH + 1; index++)
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
	C$game.c$302$2_0$121	= .
	.globl	C$game.c$302$2_0$121
;game.c:302: RenderTile(index, 0, 77);
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
	C$game.c$301$2_0$121	= .
	.globl	C$game.c$301$2_0$121
;game.c:301: for (int index = 0; index < MAP_WIDTH + 1; index++)
	inc	bc
	jr	00106$
00101$:
	C$game.c$304$2_0$120	= .
	.globl	C$game.c$304$2_0$120
;game.c:304: for (int index = 0; index < MAP_WIDTH + 2; index++)
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
	C$game.c$305$2_0$122	= .
	.globl	C$game.c$305$2_0$122
;game.c:305: RenderTile(index, MAP_HEIGHT + 1, 77);
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
	C$game.c$304$2_0$122	= .
	.globl	C$game.c$304$2_0$122
;game.c:304: for (int index = 0; index < MAP_WIDTH + 2; index++)
	inc	bc
	jr	00109$
00102$:
	C$game.c$307$2_0$120	= .
	.globl	C$game.c$307$2_0$120
;game.c:307: for (int index = 1; index < MAP_HEIGHT + 1; index++)
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
	C$game.c$308$2_0$123	= .
	.globl	C$game.c$308$2_0$123
;game.c:308: RenderTile(0, index, 77);
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
	C$game.c$307$2_0$123	= .
	.globl	C$game.c$307$2_0$123
;game.c:307: for (int index = 1; index < MAP_HEIGHT + 1; index++)
	inc	bc
	jr	00112$
00103$:
	C$game.c$310$2_0$120	= .
	.globl	C$game.c$310$2_0$120
;game.c:310: for (int index = 0; index < MAP_HEIGHT + 1; index++)
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
	C$game.c$311$2_0$124	= .
	.globl	C$game.c$311$2_0$124
;game.c:311: RenderTile(MAP_WIDTH + 1, index, 77);
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
	C$game.c$310$2_0$124	= .
	.globl	C$game.c$310$2_0$124
;game.c:310: for (int index = 0; index < MAP_HEIGHT + 1; index++)
	inc	bc
	C$game.c$312$2_0$120	= .
	.globl	C$game.c$312$2_0$120
;game.c:312: }
	C$game.c$312$2_0$120	= .
	.globl	C$game.c$312$2_0$120
	XG$DrawBackground$0$0	= .
	.globl	XG$DrawBackground$0$0
	jr	00115$
	.area _CODE
	.area _INITIALIZER
Fgame$__xinit_g_score$0_0$0 == .
__xinit__g_score:
	.dw #0x0000
Fgame$__xinit_g_score_text$0_0$0 == .
__xinit__g_score_text:
	.ascii "000"
	.db 0x00
Fgame$__xinit_step_time$0_0$0 == .
__xinit__step_time:
	.dw #0x000a
Fgame$__xinit_g_next_step$0_0$0 == .
__xinit__g_next_step:
	.byte #0x00, #0x00, #0x00, #0x00	;  0
Fgame$__xinit_g_key$0_0$0 == .
__xinit__g_key:
	.dw #0x0000
Fgame$__xinit_g_player$0_0$0 == .
__xinit__g_player:
	.dw #0x0000
	.area _CABS (ABS)
