;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DrawBackground
	.globl _UpdateScore
	.globl _Step
	.globl _ClearLines
	.globl _DropLine
	.globl _GetPiece
	.globl _PlacePiece
	.globl _IsColliding
	.globl _Rotate
	.globl _now
	.globl _RenderTile
	.globl _ubox_read_keys
	.globl _ubox_wait
	.globl _ubox_fill_screen
	.globl _ubox_disable_screen
	.globl _ubox_enable_screen
	.globl _srand
	.globl _rand
	.globl _g_key_table
	.globl _g_map
	.globl _g_score
	.globl _g_next_piece
	.globl _g_piece
	.globl _g_next_input_step
	.globl _g_next_step
	.globl _input_step_time
	.globl _step_time
	.globl _shapes
	.globl _shape_t
	.globl _shape_z
	.globl _shape_s
	.globl _shape_l
	.globl _shape_j
	.globl _shape_square
	.globl _shape_bar
	.globl _run_game
	.globl _InitGame
	.globl _ProcessGame
	.globl _DrawBoard
	.globl _DrawNextPiece
	.globl _RenderPiece
	.globl _DrawWorld
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
G$shapes$0_0$0==.
_shapes::
	.ds 14
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
G$g_piece$0_0$0==.
_g_piece::
	.ds 35
G$g_next_piece$0_0$0==.
_g_next_piece::
	.ds 35
G$g_score$0_0$0==.
_g_score::
	.ds 2
G$g_map$0_0$0==.
_g_map::
	.ds 180
G$g_key_table$0_0$0==.
_g_key_table::
	.ds 5
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
	G$Rotate$0$0	= .
	.globl	G$Rotate$0$0
	C$game.c$127$0_0$78	= .
	.globl	C$game.c$127$0_0$78
;game.c:127: uint8_t Rotate(Piece *piece)
;	---------------------------------
; Function Rotate
; ---------------------------------
_Rotate::
	ld	hl, #-46
	add	hl, sp
	ld	sp, hl
	C$game.c$130$1_0$78	= .
	.globl	C$game.c$130$1_0$78
;game.c:130: memcpy(&tmp, piece, sizeof(tmp));
	ld	hl, #0
	add	hl, sp
	ld	iy, #35
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	hl, #48
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	bc, #0x0023
	ldir
	C$game.c$133$2_0$79	= .
	.globl	C$game.c$133$2_0$79
;game.c:133: uint8_t n = 3;
	ld	iy, #37
	add	iy, sp
	ld	0 (iy), #0x03
	C$game.c$134$1_1$79	= .
	.globl	C$game.c$134$1_1$79
;game.c:134: if (piece->id == 0)
	ld	hl, #48
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	de, #0x0022
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	NZ,00117$
	C$game.c$135$1_1$79	= .
	.globl	C$game.c$135$1_1$79
;game.c:135: n = 4;
	ld	iy, #37
	add	iy, sp
	ld	0 (iy), #0x04
	C$game.c$136$1_1$78	= .
	.globl	C$game.c$136$1_1$78
;game.c:136: for (uint8_t row = 0; row < n; row++)
00117$:
	ld	e, #0x00
00109$:
	ld	hl, #37
	add	hl, sp
	C$game.c$138$5_1$83	= .
	.globl	C$game.c$138$5_1$83
;game.c:138: for (uint8_t col = 0; col < n; col++)
	ld	a,e
	cp	a,(hl)
	jp	NC,00104$
	add	a, a
	add	a, a
	ld	hl, #38
	add	hl, sp
	add	a, c
	ld	(hl), a
	ld	a, #0x00
	adc	a, b
	inc	hl
	ld	(hl), a
	ld	d, #0x00
00106$:
	ld	hl, #37
	add	hl, sp
	ld	a, d
	sub	a, (hl)
	jr	NC,00110$
	C$game.c$140$5_1$83	= .
	.globl	C$game.c$140$5_1$83
;game.c:140: piece->shape[row][col] = tmp.shape[n - col - 1][row];
	ld	hl, #40
	add	hl, sp
	ld	iy, #38
	add	iy, sp
	ld	a, 0 (iy)
	add	a, d
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	dec	iy
	ld	a, 0 (iy)
	sub	a, d
	dec	a
	add	a, a
	add	a, a
	ld	hl, #35
	add	hl, sp
	ld	iy, #42
	add	iy, sp
	add	a, (hl)
	ld	0 (iy), a
	ld	a, #0x00
	inc	hl
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
	ld	hl, #44
	add	hl, sp
	ld	iy, #42
	add	iy, sp
	ld	a, 0 (iy)
	add	a, e
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
	ld	iy, #40
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$138$4_1$82	= .
	.globl	C$game.c$138$4_1$82
;game.c:138: for (uint8_t col = 0; col < n; col++)
	inc	d
	jr	00106$
00110$:
	C$game.c$136$2_1$80	= .
	.globl	C$game.c$136$2_1$80
;game.c:136: for (uint8_t row = 0; row < n; row++)
	inc	e
	jp	00109$
00104$:
	C$game.c$143$1_1$79	= .
	.globl	C$game.c$143$1_1$79
;game.c:143: return 0;
	ld	l, #0x00
	C$game.c$144$1_1$78	= .
	.globl	C$game.c$144$1_1$78
;game.c:144: }
	ld	iy, #46
	add	iy, sp
	ld	sp, iy
	C$game.c$144$1_1$78	= .
	.globl	C$game.c$144$1_1$78
	XG$Rotate$0$0	= .
	.globl	XG$Rotate$0$0
	ret
G$shape_bar$0_0$0 == .
_shape_bar:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
G$shape_square$0_0$0 == .
_shape_square:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
G$shape_j$0_0$0 == .
_shape_j:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
G$shape_l$0_0$0 == .
_shape_l:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
G$shape_s$0_0$0 == .
_shape_s:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
G$shape_z$0_0$0 == .
_shape_z:
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
G$shape_t$0_0$0 == .
_shape_t:
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	G$IsColliding$0$0	= .
	.globl	G$IsColliding$0$0
	C$game.c$147$1_1$85	= .
	.globl	C$game.c$147$1_1$85
;game.c:147: char IsColliding(const uint8_t *map, const Piece *piece)
;	---------------------------------
; Function IsColliding
; ---------------------------------
_IsColliding::
	ld	hl, #-17
	add	hl, sp
	ld	sp, hl
	C$game.c$149$5_0$89	= .
	.globl	C$game.c$149$5_0$89
;game.c:149: for (uint8_t row = 0; row < 4; row++)
	ld	hl, #21
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	sp
	inc	sp
	push	bc
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	ld	e, #0x00
00112$:
	ld	a, e
	sub	a, #0x04
	jp	NC, 00107$
	C$game.c$151$5_0$89	= .
	.globl	C$game.c$151$5_0$89
;game.c:151: for (uint8_t col = 0; col < 4; col++)
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x0020
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), a
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	bc
	ld	bc, #0x0021
	add	hl, bc
	pop	bc
	ld	a, (hl)
	add	a, e
	inc	iy
	inc	iy
	inc	iy
	ld	0 (iy), a
	ld	a, e
	add	a, a
	add	a, a
	ld	hl, #6
	add	hl, sp
	add	a, c
	ld	(hl), a
	ld	a, #0x00
	adc	a, b
	inc	hl
	ld	(hl), a
	xor	a, a
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), a
00109$:
	ld	hl, #16+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x04
	jp	NC, 00113$
	C$game.c$153$5_0$89	= .
	.globl	C$game.c$153$5_0$89
;game.c:153: uint8_t mapx = piece->x + col;
	ld	hl, #16
	add	hl, sp
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), a
	C$game.c$154$5_0$89	= .
	.globl	C$game.c$154$5_0$89
;game.c:154: uint8_t mapy = piece->y + row;
	dec	iy
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	iy, #9
	add	iy, sp
	ld	0 (iy), a
	C$game.c$155$5_0$89	= .
	.globl	C$game.c$155$5_0$89
;game.c:155: if ((piece->shape[row][col] &&
	ld	hl, #16
	add	hl, sp
	dec	iy
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	add	a, (hl)
	ld	d, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	l, d
	ld	h, a
	ld	a, (hl)
	or	a, a
	jp	Z, 00110$
	C$game.c$156$5_0$89	= .
	.globl	C$game.c$156$5_0$89
;game.c:156: (map[mapy * COLS + mapx] ||
	inc	iy
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, #0x00
	push	de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	inc	iy
	ld	0 (iy), l
	ld	1 (iy), h
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	iy, #12
	add	iy, sp
	ld	0 (iy), a
	xor	a, a
	ld	1 (iy), a
	ld	hl, #10
	add	hl, sp
	push	de
	inc	iy
	inc	iy
	push	iy
	pop	de
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	add	a, (hl)
	ld	(de), a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	inc	de
	ld	(de), a
	pop	de
	ld	hl, #19
	add	hl, sp
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	add	a, (hl)
	ld	d, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	l, d
	ld	h, a
	ld	a, (hl)
	or	a, a
	jr	NZ,00101$
	C$game.c$157$5_0$89	= .
	.globl	C$game.c$157$5_0$89
;game.c:157: mapy >= ROWS || mapx >= COLS)))
	ld	iy, #9
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x12
	jr	NC,00101$
	dec	iy
	ld	a, 0 (iy)
	sub	a, #0x0a
	jr	C,00110$
00101$:
	C$game.c$159$6_0$90	= .
	.globl	C$game.c$159$6_0$90
;game.c:159: return 1;
	ld	l, #0x01
	jr	00114$
00110$:
	C$game.c$151$4_0$88	= .
	.globl	C$game.c$151$4_0$88
;game.c:151: for (uint8_t col = 0; col < 4; col++)
	ld	iy, #16
	add	iy, sp
	inc	0 (iy)
	jp	00109$
00113$:
	C$game.c$149$2_0$86	= .
	.globl	C$game.c$149$2_0$86
;game.c:149: for (uint8_t row = 0; row < 4; row++)
	inc	e
	jp	00112$
00107$:
	C$game.c$164$1_0$85	= .
	.globl	C$game.c$164$1_0$85
;game.c:164: return 0;
	ld	l, #0x00
00114$:
	C$game.c$165$1_0$85	= .
	.globl	C$game.c$165$1_0$85
;game.c:165: }
	ld	iy, #17
	add	iy, sp
	ld	sp, iy
	C$game.c$165$1_0$85	= .
	.globl	C$game.c$165$1_0$85
	XG$IsColliding$0$0	= .
	.globl	XG$IsColliding$0$0
	ret
	G$PlacePiece$0$0	= .
	.globl	G$PlacePiece$0$0
	C$game.c$167$1_0$92	= .
	.globl	C$game.c$167$1_0$92
;game.c:167: uint8_t PlacePiece(uint8_t *map, Piece *piece)
;	---------------------------------
; Function PlacePiece
; ---------------------------------
_PlacePiece::
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
	C$game.c$169$5_0$96	= .
	.globl	C$game.c$169$5_0$96
;game.c:169: for (uint8_t row = 0; row < 4; row++)
	ld	hl, #18
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	sp
	inc	sp
	push	bc
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	ld	e, #0x00
00109$:
	C$game.c$171$5_0$96	= .
	.globl	C$game.c$171$5_0$96
;game.c:171: for (uint8_t col = 0; col < 4; col++)
	ld	a,e
	cp	a,#0x04
	jp	NC,00104$
	add	a, a
	add	a, a
	ld	hl, #4
	add	hl, sp
	add	a, c
	ld	(hl), a
	ld	a, #0x00
	adc	a, b
	inc	hl
	ld	(hl), a
	xor	a, a
	ld	iy, #13
	add	iy, sp
	ld	0 (iy), a
00106$:
	ld	iy, #13
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x04
	jp	NC, 00110$
	C$game.c$173$5_0$96	= .
	.globl	C$game.c$173$5_0$96
;game.c:173: uint8_t mapx = piece->x + col;
	pop	hl
	push	hl
	push	bc
	ld	bc, #0x0020
	add	hl, bc
	pop	bc
	ld	a, (hl)
	ld	hl, #13
	add	hl, sp
	add	a, (hl)
	dec	iy
	ld	0 (iy), a
	C$game.c$174$5_0$96	= .
	.globl	C$game.c$174$5_0$96
;game.c:174: uint8_t mapy = piece->y + row;
	ld	hl, #2
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	bc
	ld	bc, #0x0021
	add	hl, bc
	pop	bc
	ld	a, (hl)
	add	a, e
	ld	iy, #11
	add	iy, sp
	ld	0 (iy), a
	C$game.c$175$5_0$96	= .
	.globl	C$game.c$175$5_0$96
;game.c:175: uint8_t tile = piece->shape[row][col];
	ld	hl, #13
	add	hl, sp
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	d, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	l, d
	ld	h, a
	ld	a, (hl)
	inc	iy
	inc	iy
	ld	0 (iy), a
	C$game.c$176$5_0$96	= .
	.globl	C$game.c$176$5_0$96
;game.c:176: if (tile)
	or	a, a
	jr	Z,00107$
	C$game.c$178$6_0$97	= .
	.globl	C$game.c$178$6_0$97
;game.c:178: map[mapy * COLS + mapx] = tile;
	ld	iy, #11
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, #0x00
	push	de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	iy, #7
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	iy, #12
	add	iy, sp
	ld	a, 0 (iy)
	dec	iy
	dec	iy
	dec	iy
	ld	0 (iy), a
	xor	a, a
	ld	1 (iy), a
	ld	hl, #7
	add	hl, sp
	push	de
	inc	iy
	inc	iy
	push	iy
	pop	de
	dec	iy
	dec	iy
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
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	add	a, (hl)
	ld	d, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	l, d
	ld	h, a
	ld	iy, #6
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
00107$:
	C$game.c$171$4_0$95	= .
	.globl	C$game.c$171$4_0$95
;game.c:171: for (uint8_t col = 0; col < 4; col++)
	ld	iy, #13
	add	iy, sp
	inc	0 (iy)
	jp	00106$
00110$:
	C$game.c$169$2_0$93	= .
	.globl	C$game.c$169$2_0$93
;game.c:169: for (uint8_t row = 0; row < 4; row++)
	inc	e
	jp	00109$
00104$:
	C$game.c$182$1_0$92	= .
	.globl	C$game.c$182$1_0$92
;game.c:182: return 0;
	ld	l, #0x00
	C$game.c$183$1_0$92	= .
	.globl	C$game.c$183$1_0$92
;game.c:183: }
	ld	iy, #14
	add	iy, sp
	ld	sp, iy
	C$game.c$183$1_0$92	= .
	.globl	C$game.c$183$1_0$92
	XG$PlacePiece$0$0	= .
	.globl	XG$PlacePiece$0$0
	ret
	G$GetPiece$0$0	= .
	.globl	G$GetPiece$0$0
	C$game.c$185$1_0$99	= .
	.globl	C$game.c$185$1_0$99
;game.c:185: void GetPiece(Piece *piece)
;	---------------------------------
; Function GetPiece
; ---------------------------------
_GetPiece::
	push	af
	C$game.c$187$1_0$99	= .
	.globl	C$game.c$187$1_0$99
;game.c:187: piece->id = rand() % 7;
	ld	hl, #4
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0x0022
	add	hl, de
	ex	(sp), hl
	push	de
	call	_rand
	ld	bc, #0x0007
	push	bc
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	pop	de
	pop	hl
	push	hl
	ld	(hl), c
	C$game.c$188$1_0$99	= .
	.globl	C$game.c$188$1_0$99
;game.c:188: memcpy(piece->shape, shapes[piece->id], sizeof(piece->shape));
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	bc, #_shapes
	add	hl, bc
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	bc, #0x0010
	ldir
	C$game.c$189$1_0$99	= .
	.globl	C$game.c$189$1_0$99
;game.c:189: }
	pop	af
	C$game.c$189$1_0$99	= .
	.globl	C$game.c$189$1_0$99
	XG$GetPiece$0$0	= .
	.globl	XG$GetPiece$0$0
	ret
	G$DropLine$0$0	= .
	.globl	G$DropLine$0$0
	C$game.c$191$1_0$102	= .
	.globl	C$game.c$191$1_0$102
;game.c:191: void DropLine(uint8_t *map, uint8_t n)
;	---------------------------------
; Function DropLine
; ---------------------------------
_DropLine::
	dec	sp
	C$game.c$193$3_0$102	= .
	.globl	C$game.c$193$3_0$102
;game.c:193: for (uint8_t row = n; row > 0; row--)
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
00106$:
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00107$
	C$game.c$195$3_0$103	= .
	.globl	C$game.c$195$3_0$103
;game.c:195: if (row == ROWS)
	ld	a, 0 (iy)
	sub	a, #0x12
	jr	Z,00103$
	C$game.c$198$3_0$103	= .
	.globl	C$game.c$198$3_0$103
;game.c:198: memcpy(&map[row * COLS], &map[(row - 1) * COLS], sizeof(uint8_t) * COLS);
	ld	c, 0 (iy)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ex	de, hl
	ld	a, e
	ld	hl, #3
	add	hl, sp
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	dec	bc
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #3
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	l, c
	ld	h, b
	ld	bc, #0x000a
	ldir
00103$:
	C$game.c$193$2_0$102	= .
	.globl	C$game.c$193$2_0$102
;game.c:193: for (uint8_t row = n; row > 0; row--)
	ld	iy, #0
	add	iy, sp
	dec	0 (iy)
	jr	00106$
00107$:
	C$game.c$200$2_0$102	= .
	.globl	C$game.c$200$2_0$102
;game.c:200: }
	inc	sp
	C$game.c$200$2_0$102	= .
	.globl	C$game.c$200$2_0$102
	XG$DropLine$0$0	= .
	.globl	XG$DropLine$0$0
	ret
	G$ClearLines$0$0	= .
	.globl	G$ClearLines$0$0
	C$game.c$204$2_0$105	= .
	.globl	C$game.c$204$2_0$105
;game.c:204: uint8_t ClearLines(uint8_t *map)
;	---------------------------------
; Function ClearLines
; ---------------------------------
_ClearLines::
	push	af
	C$game.c$207$1_0$105	= .
	.globl	C$game.c$207$1_0$105
;game.c:207: for (uint8_t row = 0; row < ROWS; row++)
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	ld	b, #0x00
00111$:
	ld	a, b
	sub	a, #0x12
	jr	NC,00106$
	C$game.c$209$4_0$107	= .
	.globl	C$game.c$209$4_0$107
;game.c:209: uint8_t result = 1;
	ld	c, #0x01
	C$game.c$210$1_0$105	= .
	.globl	C$game.c$210$1_0$105
;game.c:210: for (uint8_t col = 0; col < COLS; col++)
	xor	a, a
	ld	iy, #1
	add	iy, sp
	ld	0 (iy), a
00108$:
	ld	iy, #1
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x0a
	jr	NC,00103$
	C$game.c$212$5_0$109	= .
	.globl	C$game.c$212$5_0$109
;game.c:212: if (!map[row * COLS + col])
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ld	e, 0 (iy)
	ld	d, #0x00
	add	hl, de
	ex	de, hl
	ld	a, e
	ld	hl, #4
	add	hl, sp
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	ld	a, (de)
	C$game.c$214$6_0$110	= .
	.globl	C$game.c$214$6_0$110
;game.c:214: result = 0;
	or	a,a
	jr	NZ,00109$
	ld	c,a
00109$:
	C$game.c$210$4_0$108	= .
	.globl	C$game.c$210$4_0$108
;game.c:210: for (uint8_t col = 0; col < COLS; col++)
	ld	iy, #1
	add	iy, sp
	inc	0 (iy)
	jr	00108$
00103$:
	C$game.c$217$3_0$107	= .
	.globl	C$game.c$217$3_0$107
;game.c:217: if (result)
	ld	a, c
	or	a, a
	jr	Z,00112$
	C$game.c$219$4_0$111	= .
	.globl	C$game.c$219$4_0$111
;game.c:219: DropLine(map, row);
	push	bc
	push	bc
	inc	sp
	ld	hl, #7
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_DropLine
	pop	af
	inc	sp
	pop	bc
	C$game.c$220$4_0$111	= .
	.globl	C$game.c$220$4_0$111
;game.c:220: n_lines++;
	ld	iy, #0
	add	iy, sp
	inc	0 (iy)
00112$:
	C$game.c$207$2_0$106	= .
	.globl	C$game.c$207$2_0$106
;game.c:207: for (uint8_t row = 0; row < ROWS; row++)
	inc	b
	jr	00111$
00106$:
	C$game.c$223$1_0$105	= .
	.globl	C$game.c$223$1_0$105
;game.c:223: return n_lines;
	ld	iy, #0
	add	iy, sp
	ld	l, 0 (iy)
	C$game.c$224$1_0$105	= .
	.globl	C$game.c$224$1_0$105
;game.c:224: }
	pop	af
	C$game.c$224$1_0$105	= .
	.globl	C$game.c$224$1_0$105
	XG$ClearLines$0$0	= .
	.globl	XG$ClearLines$0$0
	ret
	G$Step$0$0	= .
	.globl	G$Step$0$0
	C$game.c$231$1_0$113	= .
	.globl	C$game.c$231$1_0$113
;game.c:231: uint8_t Step(uint8_t *map, Piece *piece, uint8_t *cleared_lines)
;	---------------------------------
; Function Step
; ---------------------------------
_Step::
	C$game.c$234$1_0$113	= .
	.globl	C$game.c$234$1_0$113
;game.c:234: piece->y += 1;
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	hl, #0x0021
	add	hl, bc
	ex	de, hl
	ld	a, (de)
	inc	a
	ld	(de), a
	C$game.c$235$1_0$113	= .
	.globl	C$game.c$235$1_0$113
;game.c:235: if (!IsColliding(map, piece))
	push	bc
	push	de
	push	bc
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	_IsColliding
	pop	af
	pop	af
	ld	a, l
	pop	de
	pop	bc
	C$game.c$238$2_0$114	= .
	.globl	C$game.c$238$2_0$114
;game.c:238: return COLLIDE_NO;
	or	a,a
	jr	NZ,00102$
	ld	l,a
	ret
00102$:
	C$game.c$241$1_0$113	= .
	.globl	C$game.c$241$1_0$113
;game.c:241: piece->y -= 1;
	ld	a, (de)
	dec	a
	ld	(de), a
	C$game.c$242$1_0$113	= .
	.globl	C$game.c$242$1_0$113
;game.c:242: PlacePiece(map, piece);
	push	bc
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_PlacePiece
	pop	af
	pop	af
	C$game.c$243$1_0$113	= .
	.globl	C$game.c$243$1_0$113
;game.c:243: *cleared_lines = ClearLines(map);
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_ClearLines
	pop	af
	ld	a, l
	pop	bc
	ld	(bc), a
	C$game.c$245$1_0$113	= .
	.globl	C$game.c$245$1_0$113
;game.c:245: return COLLIDE;
	ld	l, #0x01
	C$game.c$246$1_0$113	= .
	.globl	C$game.c$246$1_0$113
;game.c:246: }
	C$game.c$246$1_0$113	= .
	.globl	C$game.c$246$1_0$113
	XG$Step$0$0	= .
	.globl	XG$Step$0$0
	ret
	G$UpdateScore$0$0	= .
	.globl	G$UpdateScore$0$0
	C$game.c$249$1_0$116	= .
	.globl	C$game.c$249$1_0$116
;game.c:249: void UpdateScore(uint8_t clearline)
;	---------------------------------
; Function UpdateScore
; ---------------------------------
_UpdateScore::
	C$game.c$251$1_0$116	= .
	.globl	C$game.c$251$1_0$116
;game.c:251: switch (clearline)
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	dec	a
	jr	Z,00101$
	ld	a, 0 (iy)
	sub	a, #0x02
	jr	Z,00102$
	ld	a, 0 (iy)
	sub	a, #0x03
	jr	Z,00103$
	ld	a, 0 (iy)
	sub	a, #0x04
	jr	Z,00104$
	ret
	C$game.c$253$2_0$117	= .
	.globl	C$game.c$253$2_0$117
;game.c:253: case 1:
00101$:
	C$game.c$254$2_0$117	= .
	.globl	C$game.c$254$2_0$117
;game.c:254: g_score += 40;
	ld	hl, #_g_score
	ld	a, (hl)
	add	a, #0x28
	ld	(hl), a
	ret	NC
	inc	hl
	inc	(hl)
	C$game.c$255$2_0$117	= .
	.globl	C$game.c$255$2_0$117
;game.c:255: break;
	ret
	C$game.c$256$2_0$117	= .
	.globl	C$game.c$256$2_0$117
;game.c:256: case 2:
00102$:
	C$game.c$257$2_0$117	= .
	.globl	C$game.c$257$2_0$117
;game.c:257: g_score += 100;
	ld	hl, #_g_score
	ld	a, (hl)
	add	a, #0x64
	ld	(hl), a
	ret	NC
	inc	hl
	inc	(hl)
	C$game.c$258$2_0$117	= .
	.globl	C$game.c$258$2_0$117
;game.c:258: break;
	ret
	C$game.c$259$2_0$117	= .
	.globl	C$game.c$259$2_0$117
;game.c:259: case 3:
00103$:
	C$game.c$260$2_0$117	= .
	.globl	C$game.c$260$2_0$117
;game.c:260: g_score += 300;
	ld	hl, #_g_score
	ld	a, (hl)
	add	a, #0x2c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0x01
	ld	(hl), a
	C$game.c$261$2_0$117	= .
	.globl	C$game.c$261$2_0$117
;game.c:261: break;
	ret
	C$game.c$262$2_0$117	= .
	.globl	C$game.c$262$2_0$117
;game.c:262: case 4:
00104$:
	C$game.c$263$2_0$117	= .
	.globl	C$game.c$263$2_0$117
;game.c:263: g_score += 1200;
	ld	hl, #_g_score
	ld	a, (hl)
	add	a, #0xb0
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0x04
	ld	(hl), a
	C$game.c$265$1_0$116	= .
	.globl	C$game.c$265$1_0$116
;game.c:265: }
	C$game.c$266$1_0$116	= .
	.globl	C$game.c$266$1_0$116
;game.c:266: }
	C$game.c$266$1_0$116	= .
	.globl	C$game.c$266$1_0$116
	XG$UpdateScore$0$0	= .
	.globl	XG$UpdateScore$0$0
	ret
	G$DrawBackground$0$0	= .
	.globl	G$DrawBackground$0$0
	C$game.c$268$1_0$118	= .
	.globl	C$game.c$268$1_0$118
;game.c:268: void DrawBackground()
;	---------------------------------
; Function DrawBackground
; ---------------------------------
_DrawBackground::
	C$game.c$270$1_0$118	= .
	.globl	C$game.c$270$1_0$118
;game.c:270: for (uint8_t index = 0; index < COLS + 1; index++)
	ld	b, #0x00
00106$:
	ld	a, b
	sub	a, #0x0b
	jr	NC,00101$
	C$game.c$271$2_0$119	= .
	.globl	C$game.c$271$2_0$119
;game.c:271: RenderTile(index, 0, YELLOW_TILE);
	push	bc
	ld	a, #0x4d
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_RenderTile
	pop	af
	inc	sp
	pop	bc
	C$game.c$270$2_0$119	= .
	.globl	C$game.c$270$2_0$119
;game.c:270: for (uint8_t index = 0; index < COLS + 1; index++)
	inc	b
	jr	00106$
00101$:
	C$game.c$273$1_0$118	= .
	.globl	C$game.c$273$1_0$118
;game.c:273: for (uint8_t index = 0; index < COLS + 2; index++)
	ld	b, #0x00
00109$:
	ld	a, b
	sub	a, #0x0c
	jr	NC,00102$
	C$game.c$274$2_0$120	= .
	.globl	C$game.c$274$2_0$120
;game.c:274: RenderTile(index, ROWS + 1, YELLOW_TILE);
	push	bc
	ld	de, #0x4d13
	push	de
	push	bc
	inc	sp
	call	_RenderTile
	pop	af
	inc	sp
	pop	bc
	C$game.c$273$2_0$120	= .
	.globl	C$game.c$273$2_0$120
;game.c:273: for (uint8_t index = 0; index < COLS + 2; index++)
	inc	b
	jr	00109$
00102$:
	C$game.c$276$1_0$118	= .
	.globl	C$game.c$276$1_0$118
;game.c:276: for (uint8_t index = 1; index < ROWS + 1; index++)
	ld	b, #0x01
00112$:
	ld	a, b
	sub	a, #0x13
	jr	NC,00103$
	C$game.c$277$2_0$121	= .
	.globl	C$game.c$277$2_0$121
;game.c:277: RenderTile(0, index, YELLOW_TILE);
	push	bc
	ld	a, #0x4d
	push	af
	inc	sp
	push	bc
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_RenderTile
	pop	af
	inc	sp
	pop	bc
	C$game.c$276$2_0$121	= .
	.globl	C$game.c$276$2_0$121
;game.c:276: for (uint8_t index = 1; index < ROWS + 1; index++)
	inc	b
	jr	00112$
00103$:
	C$game.c$279$1_0$118	= .
	.globl	C$game.c$279$1_0$118
;game.c:279: for (uint8_t index = 0; index < ROWS + 1; index++)
	ld	b, #0x00
00115$:
	ld	a, b
	sub	a, #0x13
	jp	NC,_DrawNextPiece
	C$game.c$280$2_0$122	= .
	.globl	C$game.c$280$2_0$122
;game.c:280: RenderTile(COLS + 1, index, YELLOW_TILE);
	push	bc
	ld	a, #0x4d
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, #0x0b
	push	af
	inc	sp
	call	_RenderTile
	pop	af
	inc	sp
	pop	bc
	C$game.c$279$2_0$122	= .
	.globl	C$game.c$279$2_0$122
;game.c:279: for (uint8_t index = 0; index < ROWS + 1; index++)
	inc	b
	jr	00115$
	C$game.c$282$1_0$118	= .
	.globl	C$game.c$282$1_0$118
;game.c:282: DrawNextPiece();
	C$game.c$283$1_0$118	= .
	.globl	C$game.c$283$1_0$118
;game.c:283: }
	C$game.c$283$1_0$118	= .
	.globl	C$game.c$283$1_0$118
	XG$DrawBackground$0$0	= .
	.globl	XG$DrawBackground$0$0
	jp	_DrawNextPiece
	G$run_game$0$0	= .
	.globl	G$run_game$0$0
	C$game.c$285$1_0$123	= .
	.globl	C$game.c$285$1_0$123
;game.c:285: void run_game()
;	---------------------------------
; Function run_game
; ---------------------------------
_run_game::
	C$game.c$287$1_0$123	= .
	.globl	C$game.c$287$1_0$123
;game.c:287: g_gamestate = STATE_IN_GAME;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x01
	C$game.c$289$1_0$123	= .
	.globl	C$game.c$289$1_0$123
;game.c:289: InitGame();
	call	_InitGame
	C$game.c$291$1_0$123	= .
	.globl	C$game.c$291$1_0$123
;game.c:291: ubox_disable_screen();
	call	_ubox_disable_screen
	C$game.c$292$1_0$123	= .
	.globl	C$game.c$292$1_0$123
;game.c:292: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$game.c$293$1_0$123	= .
	.globl	C$game.c$293$1_0$123
;game.c:293: DrawBackground();
	call	_DrawBackground
	C$game.c$295$1_0$123	= .
	.globl	C$game.c$295$1_0$123
;game.c:295: ubox_enable_screen();
	call	_ubox_enable_screen
	C$game.c$297$1_0$123	= .
	.globl	C$game.c$297$1_0$123
;game.c:297: while (1)
00106$:
	C$game.c$299$2_0$124	= .
	.globl	C$game.c$299$2_0$124
;game.c:299: if (ubox_read_keys(7) == UBOX_MSX_KEY_ESC)
	ld	l, #0x07
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x04
	ret	Z
	C$game.c$302$2_0$124	= .
	.globl	C$game.c$302$2_0$124
;game.c:302: ProcessGame();
	call	_ProcessGame
	C$game.c$304$2_0$124	= .
	.globl	C$game.c$304$2_0$124
;game.c:304: ubox_wait();
	call	_ubox_wait
	C$game.c$306$2_0$124	= .
	.globl	C$game.c$306$2_0$124
;game.c:306: if (g_gamestate == STATE_GAME_OVER)
	ld	a,(#_g_gamestate + 0)
	sub	a, #0x02
	jr	NZ,00106$
	C$game.c$307$1_0$123	= .
	.globl	C$game.c$307$1_0$123
;game.c:307: break;
	C$game.c$309$1_0$123	= .
	.globl	C$game.c$309$1_0$123
;game.c:309: }
	C$game.c$309$1_0$123	= .
	.globl	C$game.c$309$1_0$123
	XG$run_game$0$0	= .
	.globl	XG$run_game$0$0
	ret
	G$InitGame$0$0	= .
	.globl	G$InitGame$0$0
	C$game.c$311$1_0$125	= .
	.globl	C$game.c$311$1_0$125
;game.c:311: void InitGame()
;	---------------------------------
; Function InitGame
; ---------------------------------
_InitGame::
	C$game.c$314$1_0$125	= .
	.globl	C$game.c$314$1_0$125
;game.c:314: memset(g_map, 0, ROWS * COLS * sizeof(uint8_t));
	ld	hl, #_g_map
	ld	b, #0x5a
00103$:
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	inc	hl
	djnz	00103$
	C$game.c$316$1_0$125	= .
	.globl	C$game.c$316$1_0$125
;game.c:316: srand(now());
	call	_now
	push	hl
	call	_srand
	pop	af
	C$game.c$318$1_0$125	= .
	.globl	C$game.c$318$1_0$125
;game.c:318: g_next_step = now() + step_time;
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
	C$game.c$319$1_0$125	= .
	.globl	C$game.c$319$1_0$125
;game.c:319: g_next_input_step = now() + input_step_time;
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
	C$game.c$321$1_0$125	= .
	.globl	C$game.c$321$1_0$125
;game.c:321: GetPiece(&g_piece);
	ld	hl, #_g_piece
	push	hl
	call	_GetPiece
	C$game.c$323$1_0$125	= .
	.globl	C$game.c$323$1_0$125
;game.c:323: GetPiece(&g_next_piece);
	ld	hl, #_g_next_piece
	ex	(sp),hl
	call	_GetPiece
	pop	af
	C$game.c$325$1_0$125	= .
	.globl	C$game.c$325$1_0$125
;game.c:325: g_piece.x = (COLS / 2 - 2);
	ld	hl, #(_g_piece + 0x0020)
	ld	(hl), #0x03
	C$game.c$326$1_0$125	= .
	.globl	C$game.c$326$1_0$125
;game.c:326: g_piece.y = 0;
	ld	hl, #(_g_piece + 0x0021)
	ld	(hl), #0x00
	C$game.c$328$1_0$125	= .
	.globl	C$game.c$328$1_0$125
;game.c:328: }
	C$game.c$328$1_0$125	= .
	.globl	C$game.c$328$1_0$125
	XG$InitGame$0$0	= .
	.globl	XG$InitGame$0$0
	ret
	G$ProcessGame$0$0	= .
	.globl	G$ProcessGame$0$0
	C$game.c$330$1_0$126	= .
	.globl	C$game.c$330$1_0$126
;game.c:330: void ProcessGame()
;	---------------------------------
; Function ProcessGame
; ---------------------------------
_ProcessGame::
	ld	hl, #-46
	add	hl, sp
	ld	sp, hl
	C$game.c$332$1_0$126	= .
	.globl	C$game.c$332$1_0$126
;game.c:332: uint8_t prev_piece_x = g_piece.x;
	ld	a,(#(_g_piece + 0x0020) + 0)
	ld	iy, #36
	add	iy, sp
	ld	0 (iy), a
	C$game.c$333$1_0$126	= .
	.globl	C$game.c$333$1_0$126
;game.c:333: uint8_t prev_piece_y = g_piece.y;
	ld	a,(#_g_piece + 33)
	inc	iy
	ld	0 (iy), a
	C$game.c$336$1_0$126	= .
	.globl	C$game.c$336$1_0$126
;game.c:336: if (now() > g_next_input_step)
	call	_now
	ld	iy, #44
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	iy, #44
	add	iy, sp
	ld	a, 0 (iy)
	dec	iy
	dec	iy
	ld	0 (iy), a
	inc	iy
	inc	iy
	ld	a, 1 (iy)
	dec	iy
	dec	iy
	ld	1 (iy), a
	rla
	sbc	a, a
	ld	2 (iy), a
	ld	3 (iy), a
	ld	hl, #_g_next_input_step
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
	jp	PO, 00231$
	xor	a, #0x80
00231$:
	jp	P, 00117$
	C$game.c$339$2_0$127	= .
	.globl	C$game.c$339$2_0$127
;game.c:339: g_key_table.right = ubox_read_keys(8) == UBOX_MSX_KEY_RIGHT;
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x80
	ld	a, #0x01
	jr	Z,00233$
	xor	a, a
00233$:
	ld	iy, #45
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #_g_key_table
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$340$2_0$127	= .
	.globl	C$game.c$340$2_0$127
;game.c:340: g_key_table.left = ubox_read_keys(8) == UBOX_MSX_KEY_LEFT;
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x10
	ld	a, #0x01
	jr	Z,00235$
	xor	a, a
00235$:
	ld	(#(_g_key_table + 0x0001)),a
	C$game.c$341$2_0$127	= .
	.globl	C$game.c$341$2_0$127
;game.c:341: g_key_table.rot = ubox_read_keys(8) == UBOX_MSX_KEY_UP;
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x20
	ld	a, #0x01
	jr	Z,00237$
	xor	a, a
00237$:
	ld	(#(_g_key_table + 0x0002)),a
	C$game.c$342$2_0$127	= .
	.globl	C$game.c$342$2_0$127
;game.c:342: g_key_table.fast = ubox_read_keys(8) == UBOX_MSX_KEY_DOWN; //아래 방향키를 눌렀다면 조각이 떨어지는 속도를 높인다.
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x40
	ld	a, #0x01
	jr	Z,00239$
	xor	a, a
00239$:
	ld	iy, #45
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #(_g_key_table + 0x0004)
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$343$2_0$127	= .
	.globl	C$game.c$343$2_0$127
;game.c:343: g_key_table.drop = ubox_read_keys(8) == UBOX_MSX_KEY_SPACE;
	ld	l, #0x08
	call	_ubox_read_keys
	dec	l
	ld	a, #0x01
	jr	Z,00241$
	xor	a, a
00241$:
	ld	iy, #45
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #(_g_key_table + 0x0003)
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$346$2_0$127	= .
	.globl	C$game.c$346$2_0$127
;game.c:346: g_next_input_step = now() + input_step_time;
	call	_now
	ld	iy, #44
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	hl, #_input_step_time
	ld	iy, #44
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	hl,#_g_next_input_step + 0
	ld	(hl), c
	ld	a, b
	ld	(_g_next_input_step+1), a
	rla
	sbc	a, a
	ld	(_g_next_input_step+2), a
	ld	(_g_next_input_step+3), a
	C$game.c$350$2_0$127	= .
	.globl	C$game.c$350$2_0$127
;game.c:350: if (g_key_table.right)
	ld	a, (#_g_key_table + 0)
	or	a, a
	jr	Z,00104$
	C$game.c$352$3_0$128	= .
	.globl	C$game.c$352$3_0$128
;game.c:352: g_piece.x += 1;
	ld	a,(#(_g_piece + 0x0020) + 0)
	ld	iy, #45
	add	iy, sp
	ld	0 (iy), a
	ld	a, 0 (iy)
	inc	a
	ld	(#(_g_piece + 0x0020)),a
	C$game.c$353$3_0$128	= .
	.globl	C$game.c$353$3_0$128
;game.c:353: if (IsColliding(g_map, &g_piece))
	ld	hl, #_g_piece
	push	hl
	ld	hl, #_g_map
	push	hl
	call	_IsColliding
	pop	af
	pop	af
	ld	a, l
	or	a, a
	jr	Z,00104$
	C$game.c$355$4_0$129	= .
	.globl	C$game.c$355$4_0$129
;game.c:355: g_piece.x -= 1;
	ld	a, (#(_g_piece + 0x0020) + 0)
	dec	a
	ld	(#(_g_piece + 0x0020)),a
00104$:
	C$game.c$361$2_0$127	= .
	.globl	C$game.c$361$2_0$127
;game.c:361: if (g_key_table.left)
	ld	a,(#(_g_key_table + 0x0001) + 0)
	or	a, a
	jr	Z,00108$
	C$game.c$363$3_0$130	= .
	.globl	C$game.c$363$3_0$130
;game.c:363: g_piece.x -= 1;
	ld	a, (#(_g_piece + 0x0020) + 0)
	dec	a
	ld	(#(_g_piece + 0x0020)),a
	C$game.c$364$3_0$130	= .
	.globl	C$game.c$364$3_0$130
;game.c:364: if (IsColliding(g_map, &g_piece))
	ld	hl, #_g_piece
	push	hl
	ld	hl, #_g_map
	push	hl
	call	_IsColliding
	pop	af
	pop	af
	ld	a, l
	or	a, a
	jr	Z,00108$
	C$game.c$366$4_0$131	= .
	.globl	C$game.c$366$4_0$131
;game.c:366: g_piece.x += 1;
	ld	a, (#(_g_piece + 0x0020) + 0)
	inc	a
	ld	(#(_g_piece + 0x0020)),a
00108$:
	C$game.c$370$2_0$127	= .
	.globl	C$game.c$370$2_0$127
;game.c:370: if (g_key_table.rot)
	ld	a, (#(_g_key_table + 0x0002) + 0)
	or	a, a
	jp	Z, 00117$
	C$game.c$373$3_0$132	= .
	.globl	C$game.c$373$3_0$132
;game.c:373: memcpy(&tempPiece, &g_piece, sizeof(Piece));
	ld	hl, #1
	add	hl, sp
	ex	de, hl
	ld	c, e
	ld	b, d
	push	de
	ld	e, c
	ld	d, b
	ld	hl, #_g_piece
	ld	bc, #0x0023
	ldir
	ld	hl, #_g_piece
	push	hl
	call	_Rotate
	ld	hl, #_g_piece
	ex	(sp),hl
	ld	hl, #_g_map
	push	hl
	call	_IsColliding
	pop	af
	pop	af
	ld	a, l
	pop	de
	or	a, a
	jr	Z,00149$
	C$game.c$379$4_0$133	= .
	.globl	C$game.c$379$4_0$133
;game.c:379: memcpy(&g_piece, &tempPiece, sizeof(Piece));
	ld	hl, #_g_piece
	ex	de, hl
	ld	bc, #0x0023
	ldir
	C$game.c$380$4_0$133	= .
	.globl	C$game.c$380$4_0$133
;game.c:380: g_key_table.rot = 0;
	ld	hl, #(_g_key_table + 0x0002)
	ld	(hl), #0x00
	jr	00117$
	C$game.c$384$1_1$126	= .
	.globl	C$game.c$384$1_1$126
;game.c:384: for (uint8_t row = 0; row < 4; row++)
00149$:
	ld	c, #0x00
00132$:
	C$game.c$386$8_0$138	= .
	.globl	C$game.c$386$8_0$138
;game.c:386: for (uint8_t col = 0; col < 4; col++)
	ld	a,c
	cp	a,#0x04
	jr	NC,00117$
	add	a, a
	add	a, a
	ld	b, a
	ld	a, #<((_g_piece + 0x0010))
	ld	hl, #38
	add	hl, sp
	add	a, b
	ld	(hl), a
	ld	a, #>((_g_piece + 0x0010))
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	a, e
	ld	hl, #40
	add	hl, sp
	add	a, b
	ld	(hl), a
	ld	a, d
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	b, #0x00
00129$:
	ld	a, b
	sub	a, #0x04
	jr	NC,00133$
	C$game.c$388$8_0$138	= .
	.globl	C$game.c$388$8_0$138
;game.c:388: g_piece.old_shape[row][col] = tempPiece.shape[row][col];
	ld	hl, #42
	add	hl, sp
	ld	iy, #38
	add	iy, sp
	ld	a, 0 (iy)
	add	a, b
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	hl, #44
	add	hl, sp
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	add	a, b
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	iy, #44
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$386$7_0$137	= .
	.globl	C$game.c$386$7_0$137
;game.c:386: for (uint8_t col = 0; col < 4; col++)
	inc	b
	jr	00129$
00133$:
	C$game.c$384$5_0$135	= .
	.globl	C$game.c$384$5_0$135
;game.c:384: for (uint8_t row = 0; row < 4; row++)
	inc	c
	jr	00132$
00117$:
	C$game.c$397$2_0$139	= .
	.globl	C$game.c$397$2_0$139
;game.c:397: uint8_t clear_lines = 0; //없앤 라인수
	xor	a, a
	ld	iy, #35
	add	iy, sp
	ld	0 (iy), a
	C$game.c$400$2_0$139	= .
	.globl	C$game.c$400$2_0$139
;game.c:400: uint8_t result = COLLIDE_NO;
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	C$game.c$402$1_1$139	= .
	.globl	C$game.c$402$1_1$139
;game.c:402: if (g_key_table.drop) //스페이스키를 눌러 조각을 떨어뜨리면
	ld	a,(#(_g_key_table + 0x0003) + 0)
	or	a, a
	jr	Z,00124$
	C$game.c$404$2_1$140	= .
	.globl	C$game.c$404$2_1$140
;game.c:404: g_key_table.drop = 0;
	ld	hl, #(_g_key_table + 0x0003)
	ld	(hl), #0x00
	C$game.c$406$3_1$141	= .
	.globl	C$game.c$406$3_1$141
;game.c:406: while (result == COLLIDE_NO)
00118$:
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	or	a, a
	jr	NZ,00120$
	C$game.c$408$3_1$141	= .
	.globl	C$game.c$408$3_1$141
;game.c:408: result = Step(g_map, &g_piece, &clear_lines);
	ld	hl, #35
	add	hl, sp
	push	hl
	ld	hl, #_g_piece
	push	hl
	ld	hl, #_g_map
	push	hl
	call	_Step
	pop	af
	pop	af
	pop	af
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), l
	jr	00118$
00120$:
	C$game.c$411$2_1$140	= .
	.globl	C$game.c$411$2_1$140
;game.c:411: g_next_step = now() + step_time;
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
	jp	00125$
00124$:
	C$game.c$415$2_1$142	= .
	.globl	C$game.c$415$2_1$142
;game.c:415: uint8_t accel = g_key_table.fast ? (7 * step_time / 8) : 0;
	ld	a, (#_g_key_table + 4)
	or	a, a
	jr	Z,00136$
	ld	bc, (_step_time)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z,00138$
	ld	de, #0x0007
	add	hl, de
	ex	de,hl
00138$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	jr	00137$
00136$:
	ld	de, #0x0000
00137$:
	C$game.c$416$2_1$142	= .
	.globl	C$game.c$416$2_1$142
;game.c:416: if (now() > g_next_step - accel)
	push	de
	call	_now
	ld	c, l
	ld	b, h
	pop	de
	ld	d, #0x00
	ld	iy, #38
	add	iy, sp
	ld	0 (iy), e
	ld	a, d
	ld	1 (iy), a
	rla
	sbc	a, a
	ld	2 (iy), a
	ld	3 (iy), a
	ld	hl, #38
	add	hl, sp
	push	de
	ld	iy, #44
	add	iy, sp
	push	iy
	pop	de
	ld	iy, #_g_next_step
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	(de), a
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	inc	de
	ld	(de), a
	ld	a, 2 (iy)
	inc	hl
	sbc	a, (hl)
	inc	de
	ld	(de), a
	ld	a, 3 (iy)
	inc	hl
	sbc	a, (hl)
	inc	de
	ld	(de), a
	pop	de
	ld	a, b
	rla
	sbc	a, a
	ld	e, a
	ld	d, a
	ld	hl, #42
	add	hl, sp
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
	jp	PO, 00242$
	xor	a, #0x80
00242$:
	jp	P, 00125$
	C$game.c$419$3_1$143	= .
	.globl	C$game.c$419$3_1$143
;game.c:419: result = Step(g_map, &g_piece, &clear_lines);
	ld	hl, #35
	add	hl, sp
	push	hl
	ld	hl, #_g_piece
	push	hl
	ld	hl, #_g_map
	push	hl
	call	_Step
	pop	af
	pop	af
	pop	af
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), l
	C$game.c$421$3_1$143	= .
	.globl	C$game.c$421$3_1$143
;game.c:421: g_next_step = now() + step_time;
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
00125$:
	C$game.c$425$1_1$139	= .
	.globl	C$game.c$425$1_1$139
;game.c:425: if (clear_lines > 0) //없앤줄이 있으면 줄수에 따라 점수를 갱신한다.
	ld	iy, #35
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00127$
	C$game.c$426$1_1$139	= .
	.globl	C$game.c$426$1_1$139
;game.c:426: UpdateScore(clear_lines);
	ld	a, 0 (iy)
	push	af
	inc	sp
	call	_UpdateScore
	inc	sp
00127$:
	C$game.c$428$1_1$139	= .
	.globl	C$game.c$428$1_1$139
;game.c:428: DrawWorld(result, prev_piece_x, prev_piece_y);
	ld	iy, #37
	add	iy, sp
	ld	a, 0 (iy)
	push	af
	inc	sp
	dec	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	call	_DrawWorld
	pop	af
	inc	sp
	C$game.c$429$1_1$126	= .
	.globl	C$game.c$429$1_1$126
;game.c:429: }
	ld	hl, #46
	add	hl, sp
	ld	sp, hl
	C$game.c$429$1_1$126	= .
	.globl	C$game.c$429$1_1$126
	XG$ProcessGame$0$0	= .
	.globl	XG$ProcessGame$0$0
	ret
	G$DrawBoard$0$0	= .
	.globl	G$DrawBoard$0$0
	C$game.c$432$1_1$145	= .
	.globl	C$game.c$432$1_1$145
;game.c:432: void DrawBoard()
;	---------------------------------
; Function DrawBoard
; ---------------------------------
_DrawBoard::
	push	af
	C$game.c$434$5_0$148	= .
	.globl	C$game.c$434$5_0$148
;game.c:434: for (uint8_t row = 0; row < ROWS; row++)
	ld	c, #0x00
00110$:
	ld	a, c
	sub	a, #0x12
	jr	NC,00112$
	C$game.c$436$2_0$145	= .
	.globl	C$game.c$436$2_0$145
;game.c:436: for (uint8_t col = 0; col < COLS; col++)
	xor	a, a
	ld	iy, #1
	add	iy, sp
	ld	0 (iy), a
00107$:
	ld	iy, #1
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x0a
	jr	NC,00111$
	C$game.c$438$5_0$148	= .
	.globl	C$game.c$438$5_0$148
;game.c:438: uint8_t color = g_map[row * COLS + col];
	ld	e, c
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	ex	de, hl
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, de
	ld	de, #_g_map
	add	hl, de
	ld	b, (hl)
	C$game.c$442$2_0$145	= .
	.globl	C$game.c$442$2_0$145
;game.c:442: RenderTile(col + 1, row + 1, WHITE_TILE);
	ld	a, c
	ld	e, 0 (iy)
	inc	a
	dec	iy
	ld	0 (iy), a
	inc	e
	C$game.c$440$5_0$148	= .
	.globl	C$game.c$440$5_0$148
;game.c:440: if (color != 0)
	ld	a, b
	or	a, a
	jr	Z,00102$
	C$game.c$442$6_0$149	= .
	.globl	C$game.c$442$6_0$149
;game.c:442: RenderTile(col + 1, row + 1, WHITE_TILE);
	push	bc
	ld	a, #0x51
	push	af
	inc	sp
	ld	d, 0 (iy)
	push	de
	call	_RenderTile
	pop	af
	inc	sp
	pop	bc
	jr	00108$
00102$:
	C$game.c$446$6_0$150	= .
	.globl	C$game.c$446$6_0$150
;game.c:446: RenderTile(col + 1, row + 1, BLACK_TILE);
	push	bc
	ld	a, #0x55
	push	af
	inc	sp
	ld	hl, #3+0
	add	hl, sp
	ld	d, (hl)
	push	de
	call	_RenderTile
	pop	af
	inc	sp
	pop	bc
00108$:
	C$game.c$436$4_0$147	= .
	.globl	C$game.c$436$4_0$147
;game.c:436: for (uint8_t col = 0; col < COLS; col++)
	ld	iy, #1
	add	iy, sp
	inc	0 (iy)
	jr	00107$
00111$:
	C$game.c$434$2_0$145	= .
	.globl	C$game.c$434$2_0$145
;game.c:434: for (uint8_t row = 0; row < ROWS; row++)
	inc	c
	jr	00110$
00112$:
	C$game.c$450$2_0$145	= .
	.globl	C$game.c$450$2_0$145
;game.c:450: }
	pop	af
	C$game.c$450$2_0$145	= .
	.globl	C$game.c$450$2_0$145
	XG$DrawBoard$0$0	= .
	.globl	XG$DrawBoard$0$0
	ret
	G$DrawNextPiece$0$0	= .
	.globl	G$DrawNextPiece$0$0
	C$game.c$452$2_0$152	= .
	.globl	C$game.c$452$2_0$152
;game.c:452: void DrawNextPiece()
;	---------------------------------
; Function DrawNextPiece
; ---------------------------------
_DrawNextPiece::
	push	af
	push	af
	C$game.c$454$5_0$155	= .
	.globl	C$game.c$454$5_0$155
;game.c:454: for (uint8_t row = 0; row < 4; row++)
	xor	a, a
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), a
00110$:
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x04
	jp	NC, 00112$
	C$game.c$456$5_0$155	= .
	.globl	C$game.c$456$5_0$155
;game.c:456: for (uint8_t col = 0; col < 4; col++)
	ld	a, 0 (iy)
	add	a, a
	add	a, a
	add	a, #<(_g_next_piece)
	ld	e, a
	ld	a, #0x00
	adc	a, #>(_g_next_piece)
	ld	d, a
	xor	a, a
	inc	iy
	ld	0 (iy), a
00107$:
	ld	iy, #3
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x04
	jr	NC,00111$
	C$game.c$458$5_0$155	= .
	.globl	C$game.c$458$5_0$155
;game.c:458: uint8_t color = g_next_piece.shape[row][col];
	ld	l, 0 (iy)
	ld	h, #0x00
	add	hl, de
	ld	a, (hl)
	dec	iy
	dec	iy
	dec	iy
	ld	0 (iy), a
	C$game.c$461$2_0$152	= .
	.globl	C$game.c$461$2_0$152
;game.c:461: RenderTile(col + COLS + 3, row + 2, GREEN_TILE);
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	inc	iy
	ld	c, 0 (iy)
	add	a, #0x02
	dec	iy
	dec	iy
	ld	0 (iy), a
	ld	a, c
	add	a, #0x0d
	ld	c, a
	C$game.c$460$5_0$155	= .
	.globl	C$game.c$460$5_0$155
;game.c:460: if (color != 0)
	dec	iy
	ld	a, 0 (iy)
	or	a, a
	jr	Z,00102$
	C$game.c$461$5_0$155	= .
	.globl	C$game.c$461$5_0$155
;game.c:461: RenderTile(col + COLS + 3, row + 2, GREEN_TILE);
	push	de
	ld	a, #0x4a
	push	af
	inc	sp
	inc	iy
	ld	b, 0 (iy)
	push	bc
	call	_RenderTile
	pop	af
	inc	sp
	pop	de
	jr	00108$
00102$:
	C$game.c$463$5_0$155	= .
	.globl	C$game.c$463$5_0$155
;game.c:463: RenderTile(col + COLS + 3, row + 2, BLACK_TILE);
	push	de
	ld	a, #0x55
	push	af
	inc	sp
	ld	hl, #4+0
	add	hl, sp
	ld	b, (hl)
	push	bc
	call	_RenderTile
	pop	af
	inc	sp
	pop	de
00108$:
	C$game.c$456$4_0$154	= .
	.globl	C$game.c$456$4_0$154
;game.c:456: for (uint8_t col = 0; col < 4; col++)
	ld	iy, #3
	add	iy, sp
	inc	0 (iy)
	jr	00107$
00111$:
	C$game.c$454$2_0$152	= .
	.globl	C$game.c$454$2_0$152
;game.c:454: for (uint8_t row = 0; row < 4; row++)
	ld	iy, #2
	add	iy, sp
	inc	0 (iy)
	jp	00110$
00112$:
	C$game.c$466$2_0$152	= .
	.globl	C$game.c$466$2_0$152
;game.c:466: }
	pop	af
	pop	af
	C$game.c$466$2_0$152	= .
	.globl	C$game.c$466$2_0$152
	XG$DrawNextPiece$0$0	= .
	.globl	XG$DrawNextPiece$0$0
	ret
	G$RenderPiece$0$0	= .
	.globl	G$RenderPiece$0$0
	C$game.c$468$2_0$158	= .
	.globl	C$game.c$468$2_0$158
;game.c:468: void RenderPiece(uint8_t shape[][4], uint8_t xPos, uint8_t yPos, uint8_t color)
;	---------------------------------
; Function RenderPiece
; ---------------------------------
_RenderPiece::
	dec	sp
	C$game.c$470$2_0$158	= .
	.globl	C$game.c$470$2_0$158
;game.c:470: for (uint8_t row = 0; row < 4; row++)
	ld	c, #0x00
00109$:
	ld	a, c
	sub	a, #0x04
	jr	NC,00111$
	C$game.c$472$6_0$162	= .
	.globl	C$game.c$472$6_0$162
;game.c:472: for (uint8_t col = 0; col < 4; col++)
	ld	hl, #6
	add	hl, sp
	ld	a, c
	add	a, (hl)
	ld	b, a
	xor	a, a
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
00106$:
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x04
	jr	NC,00110$
	C$game.c$474$5_0$161	= .
	.globl	C$game.c$474$5_0$161
;game.c:474: if (shape[row][col])
	ld	l, c
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	a, e
	ld	hl, #3
	add	hl, sp
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	ld	a, e
	ld	hl, #0
	add	hl, sp
	add	a, (hl)
	ld	e, a
	jr	NC,00140$
	inc	d
00140$:
	ld	a, (de)
	or	a, a
	jr	Z,00107$
	C$game.c$476$6_0$162	= .
	.globl	C$game.c$476$6_0$162
;game.c:476: RenderTile(col + xPos + 1, row + yPos + 1, color);
	ld	d, b
	inc	d
	ld	hl, #5
	add	hl, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	e, a
	inc	e
	push	bc
	ld	hl, #9+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	call	_RenderTile
	pop	af
	inc	sp
	pop	bc
00107$:
	C$game.c$472$4_0$160	= .
	.globl	C$game.c$472$4_0$160
;game.c:472: for (uint8_t col = 0; col < 4; col++)
	ld	iy, #0
	add	iy, sp
	inc	0 (iy)
	jr	00106$
00110$:
	C$game.c$470$2_0$158	= .
	.globl	C$game.c$470$2_0$158
;game.c:470: for (uint8_t row = 0; row < 4; row++)
	inc	c
	jr	00109$
00111$:
	C$game.c$481$2_0$158	= .
	.globl	C$game.c$481$2_0$158
;game.c:481: }
	inc	sp
	C$game.c$481$2_0$158	= .
	.globl	C$game.c$481$2_0$158
	XG$RenderPiece$0$0	= .
	.globl	XG$RenderPiece$0$0
	ret
	G$DrawWorld$0$0	= .
	.globl	G$DrawWorld$0$0
	C$game.c$483$2_0$164	= .
	.globl	C$game.c$483$2_0$164
;game.c:483: void DrawWorld(uint8_t collision_type, uint8_t old_x, uint8_t old_y)
;	---------------------------------
; Function DrawWorld
; ---------------------------------
_DrawWorld::
	C$game.c$485$1_0$164	= .
	.globl	C$game.c$485$1_0$164
;game.c:485: if (g_key_table.rot)
	ld	a, (#(_g_key_table + 0x0002) + 0)
	or	a, a
	jr	Z,00102$
	C$game.c$487$2_0$165	= .
	.globl	C$game.c$487$2_0$165
;game.c:487: RenderPiece(g_piece.old_shape, old_x, old_y, BLACK_TILE);
	ld	a, #0x55
	push	af
	inc	sp
	ld	iy, #5
	add	iy, sp
	ld	a, 0 (iy)
	push	af
	inc	sp
	dec	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	ld	hl, #(_g_piece + 0x0010)
	push	hl
	call	_RenderPiece
	pop	af
	pop	af
	inc	sp
	C$game.c$488$2_0$165	= .
	.globl	C$game.c$488$2_0$165
;game.c:488: RenderPiece(g_piece.shape, g_piece.x, g_piece.y, GREEN_TILE);
	ld	hl, #_g_piece + 33
	ld	e, (hl)
	ld	hl, #_g_piece + 32
	ld	c, (hl)
	ld	d,#0x4a
	push	de
	ld	a, c
	push	af
	inc	sp
	ld	hl, #_g_piece
	push	hl
	call	_RenderPiece
	pop	af
	pop	af
	inc	sp
	C$game.c$489$2_0$165	= .
	.globl	C$game.c$489$2_0$165
;game.c:489: g_key_table.rot = 0;
	ld	hl, #(_g_key_table + 0x0002)
	ld	(hl), #0x00
00102$:
	C$game.c$492$1_0$164	= .
	.globl	C$game.c$492$1_0$164
;game.c:492: if (old_x != g_piece.x || old_y != g_piece.y)
	ld	hl, #(_g_piece + 0x0020) + 0
	ld	c, (hl)
	ld	iy, #3
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, c
	jr	NZ,00103$
	ld	hl, #(_g_piece + 0x0021) + 0
	ld	c, (hl)
	inc	iy
	ld	a, 0 (iy)
	sub	a, c
	jr	Z,00104$
00103$:
	C$game.c$494$2_0$166	= .
	.globl	C$game.c$494$2_0$166
;game.c:494: RenderPiece(g_piece.shape, old_x, old_y, BLACK_TILE);
	ld	a, #0x55
	push	af
	inc	sp
	ld	iy, #5
	add	iy, sp
	ld	a, 0 (iy)
	push	af
	inc	sp
	dec	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	ld	hl, #_g_piece
	push	hl
	call	_RenderPiece
	pop	af
	pop	af
	inc	sp
	C$game.c$495$2_0$166	= .
	.globl	C$game.c$495$2_0$166
;game.c:495: RenderPiece(g_piece.shape, g_piece.x, g_piece.y, GREEN_TILE);
	ld	hl, #(_g_piece + 0x0021) + 0
	ld	b, (hl)
	ld	hl, #(_g_piece + 0x0020) + 0
	ld	c, (hl)
	ld	a, #0x4a
	push	af
	inc	sp
	push	bc
	inc	sp
	ld	a, c
	push	af
	inc	sp
	ld	hl, #_g_piece
	push	hl
	call	_RenderPiece
	pop	af
	pop	af
	inc	sp
00104$:
	C$game.c$498$1_0$164	= .
	.globl	C$game.c$498$1_0$164
;game.c:498: if (collision_type == COLLIDE) //충돌이 있었다면 다음에 나올 블록을 갱신한다
	ld	hl, #2+0
	add	hl, sp
	ld	a, (hl)
	dec	a
	ret	NZ
	C$game.c$500$2_0$167	= .
	.globl	C$game.c$500$2_0$167
;game.c:500: DrawBoard();
	call	_DrawBoard
	C$game.c$502$2_0$167	= .
	.globl	C$game.c$502$2_0$167
;game.c:502: memcpy(&g_piece, &g_next_piece, sizeof(Piece));
	ld	de, #_g_piece
	ld	bc, #_g_next_piece+0
	ld	l, c
	ld	h, b
	push	bc
	ld	bc, #0x0023
	ldir
	pop	bc
	C$game.c$503$2_0$167	= .
	.globl	C$game.c$503$2_0$167
;game.c:503: g_piece.x = (COLS / 2 - 2);
	ld	hl, #(_g_piece + 0x0020)
	ld	(hl), #0x03
	C$game.c$504$2_0$167	= .
	.globl	C$game.c$504$2_0$167
;game.c:504: g_piece.y = 0;
	ld	hl, #(_g_piece + 0x0021)
	ld	(hl), #0x00
	C$game.c$506$2_0$167	= .
	.globl	C$game.c$506$2_0$167
;game.c:506: GetPiece(&g_next_piece);
	push	bc
	call	_GetPiece
	pop	af
	C$game.c$508$2_0$167	= .
	.globl	C$game.c$508$2_0$167
;game.c:508: DrawNextPiece();
	call	_DrawNextPiece
	C$game.c$511$2_0$167	= .
	.globl	C$game.c$511$2_0$167
;game.c:511: if (IsColliding(g_map, &g_piece))
	ld	hl, #_g_piece
	push	hl
	ld	hl, #_g_map
	push	hl
	call	_IsColliding
	pop	af
	pop	af
	ld	a, l
	or	a, a
	ret	Z
	C$game.c$512$2_0$167	= .
	.globl	C$game.c$512$2_0$167
;game.c:512: g_gamestate = STATE_GAME_OVER;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$514$1_0$164	= .
	.globl	C$game.c$514$1_0$164
;game.c:514: }
	C$game.c$514$1_0$164	= .
	.globl	C$game.c$514$1_0$164
	XG$DrawWorld$0$0	= .
	.globl	XG$DrawWorld$0$0
	ret
	.area _CODE
	.area _INITIALIZER
Fgame$__xinit_shapes$0_0$0 == .
__xinit__shapes:
	.dw _shape_bar
	.dw _shape_square
	.dw _shape_l
	.dw _shape_j
	.dw _shape_s
	.dw _shape_z
	.dw _shape_t
Fgame$__xinit_step_time$0_0$0 == .
__xinit__step_time:
	.dw #0x0014
Fgame$__xinit_input_step_time$0_0$0 == .
__xinit__input_step_time:
	.dw #0x0004
Fgame$__xinit_g_next_step$0_0$0 == .
__xinit__g_next_step:
	.byte #0x00, #0x00, #0x00, #0x00	;  0
Fgame$__xinit_g_next_input_step$0_0$0 == .
__xinit__g_next_input_step:
	.byte #0x00, #0x00, #0x00, #0x00	;  0
Fgame$__xinit_g_piece$0_0$0 == .
__xinit__g_piece:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
Fgame$__xinit_g_next_piece$0_0$0 == .
__xinit__g_next_piece:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
Fgame$__xinit_g_score$0_0$0 == .
__xinit__g_score:
	.dw #0x0000
Fgame$__xinit_g_map$0_0$0 == .
__xinit__g_map:
	.db #0x00	; 0
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
	.db 0x00
Fgame$__xinit_g_key_table$0_0$0 == .
__xinit__g_key_table:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.area _CABS (ABS)
