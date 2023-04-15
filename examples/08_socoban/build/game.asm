;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module game
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _DrawPlayer
	.globl _DrawObject
	.globl _UpdateGameStatus
	.globl _ProcessInput
	.globl _ProcessMove
	.globl _IsCanGo
	.globl _SetupWorld
	.globl _SetupPlayerPosition
	.globl _RenderTile
	.globl _ubox_read_keys
	.globl _ubox_wait
	.globl _ubox_fill_screen
	.globl _ubox_disable_screen
	.globl _ubox_enable_screen
	.globl _g_mapInfo
	.globl _g_stages
	.globl _g_playerInfo
	.globl _g_map5
	.globl _g_map4
	.globl _g_map3
	.globl _g_map2
	.globl _g_map1
	.globl _run_game
	.globl _DrawBoard
	.globl _InitGame
	.globl _DrawMap
	.globl _ProcessLogic
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$g_playerInfo$0_0$0==.
_g_playerInfo::
	.ds 4
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$g_stages$0_0$0==.
_g_stages::
	.ds 10
G$g_mapInfo$0_0$0==.
_g_mapInfo::
	.ds 802
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
	C$game.c$159$0_0$24	= .
	.globl	C$game.c$159$0_0$24
;game.c:159: void run_game()
;	---------------------------------
; Function run_game
; ---------------------------------
_run_game::
	C$game.c$161$1_0$24	= .
	.globl	C$game.c$161$1_0$24
;game.c:161: g_gamestate = STATE_IN_GAME;
	ld	iy, #_g_gamestate
	ld	0 (iy), #0x01
	C$game.c$163$1_0$24	= .
	.globl	C$game.c$163$1_0$24
;game.c:163: if (g_mapInfo.stageNum >= MAX_STAGE_NUM)
	ld	bc, #_g_mapInfo+0
	ld	a, (bc)
	sub	a, #0x05
	jr	C,00102$
	C$game.c$165$2_0$25	= .
	.globl	C$game.c$165$2_0$25
;game.c:165: g_gamestate = STATE_NO_MAP;
	ld	0 (iy), #0x03
	C$game.c$166$2_0$25	= .
	.globl	C$game.c$166$2_0$25
;game.c:166: g_mapInfo.stageNum = 0;
	xor	a, a
	ld	(bc), a
	C$game.c$167$2_0$25	= .
	.globl	C$game.c$167$2_0$25
;game.c:167: return;
	ret
00102$:
	C$game.c$170$1_0$24	= .
	.globl	C$game.c$170$1_0$24
;game.c:170: InitGame();
	call	_InitGame
	C$game.c$172$1_0$24	= .
	.globl	C$game.c$172$1_0$24
;game.c:172: ubox_disable_screen();
	call	_ubox_disable_screen
	C$game.c$173$1_0$24	= .
	.globl	C$game.c$173$1_0$24
;game.c:173: ubox_fill_screen(WHITESPACE_TILE);
	ld	l, #0x81
	call	_ubox_fill_screen
	C$game.c$174$1_0$24	= .
	.globl	C$game.c$174$1_0$24
;game.c:174: DrawBoard();
	call	_DrawBoard
	C$game.c$175$1_0$24	= .
	.globl	C$game.c$175$1_0$24
;game.c:175: ubox_enable_screen();
	call	_ubox_enable_screen
	C$game.c$177$1_0$24	= .
	.globl	C$game.c$177$1_0$24
;game.c:177: while (1)
00109$:
	C$game.c$179$2_0$26	= .
	.globl	C$game.c$179$2_0$26
;game.c:179: if (ubox_read_keys(7) == UBOX_MSX_KEY_ESC)
	ld	l, #0x07
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x04
	ret	Z
	C$game.c$182$2_0$26	= .
	.globl	C$game.c$182$2_0$26
;game.c:182: ProcessLogic();
	call	_ProcessLogic
	C$game.c$184$2_0$26	= .
	.globl	C$game.c$184$2_0$26
;game.c:184: DrawMap();
	call	_DrawMap
	C$game.c$186$2_0$26	= .
	.globl	C$game.c$186$2_0$26
;game.c:186: ubox_wait();
	call	_ubox_wait
	C$game.c$188$2_0$26	= .
	.globl	C$game.c$188$2_0$26
;game.c:188: if (g_gamestate == STATE_GAME_CLEAR ||
	ld	iy, #_g_gamestate
	ld	a, 0 (iy)
	sub	a, #0x04
	ret	Z
	C$game.c$189$2_0$26	= .
	.globl	C$game.c$189$2_0$26
;game.c:189: g_gamestate == STATE_GAME_RESET)
	ld	a, 0 (iy)
	sub	a, #0x02
	jr	NZ,00109$
	C$game.c$190$1_0$24	= .
	.globl	C$game.c$190$1_0$24
;game.c:190: break;
	C$game.c$192$1_0$24	= .
	.globl	C$game.c$192$1_0$24
;game.c:192: }
	C$game.c$192$1_0$24	= .
	.globl	C$game.c$192$1_0$24
	XG$run_game$0$0	= .
	.globl	XG$run_game$0$0
	ret
G$g_map1$0_0$0 == .
_g_map1:
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
G$g_map2$0_0$0 == .
_g_map2:
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
G$g_map3$0_0$0 == .
_g_map3:
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
G$g_map4$0_0$0 == .
_g_map4:
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
G$g_map5$0_0$0 == .
_g_map5:
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
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
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
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x03	; 3
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x02	; 2
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
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x01	; 1
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
	G$DrawBoard$0$0	= .
	.globl	G$DrawBoard$0$0
	C$game.c$194$1_0$27	= .
	.globl	C$game.c$194$1_0$27
;game.c:194: void DrawBoard()
;	---------------------------------
; Function DrawBoard
; ---------------------------------
_DrawBoard::
	C$game.c$196$2_0$27	= .
	.globl	C$game.c$196$2_0$27
;game.c:196: for (int index = 0; index < SOCOBAN_MAX_WIDTH; index++)
	ld	bc, #0x0000
00106$:
	ld	a, c
	sub	a, #0x14
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00101$
	C$game.c$197$2_0$28	= .
	.globl	C$game.c$197$2_0$28
;game.c:197: RenderTile(index, 0, GREEN_TILE);
	push	bc
	ld	hl, #0x004a
	push	hl
	ld	l, #0x00
	push	hl
	push	bc
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$196$2_0$28	= .
	.globl	C$game.c$196$2_0$28
;game.c:196: for (int index = 0; index < SOCOBAN_MAX_WIDTH; index++)
	inc	bc
	jr	00106$
00101$:
	C$game.c$199$2_0$27	= .
	.globl	C$game.c$199$2_0$27
;game.c:199: for (int index = 0; index < SOCOBAN_MAX_WIDTH; index++)
	ld	bc, #0x0000
00109$:
	ld	a, c
	sub	a, #0x14
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
	C$game.c$200$2_0$29	= .
	.globl	C$game.c$200$2_0$29
;game.c:200: RenderTile(index, SOCOBAN_MAX_HEIGHT - 1, GREEN_TILE);
	push	bc
	ld	hl, #0x004a
	push	hl
	ld	l, #0x13
	push	hl
	push	bc
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$199$2_0$29	= .
	.globl	C$game.c$199$2_0$29
;game.c:199: for (int index = 0; index < SOCOBAN_MAX_WIDTH; index++)
	inc	bc
	jr	00109$
00102$:
	C$game.c$202$2_0$27	= .
	.globl	C$game.c$202$2_0$27
;game.c:202: for (int index = 1; index < SOCOBAN_MAX_HEIGHT - 1; index++)
	ld	bc, #0x0001
00112$:
	ld	a, c
	sub	a, #0x13
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00103$
	C$game.c$203$2_0$30	= .
	.globl	C$game.c$203$2_0$30
;game.c:203: RenderTile(0, index, GREEN_TILE);
	push	bc
	ld	hl, #0x004a
	push	hl
	push	bc
	ld	l, #0x00
	push	hl
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$202$2_0$30	= .
	.globl	C$game.c$202$2_0$30
;game.c:202: for (int index = 1; index < SOCOBAN_MAX_HEIGHT - 1; index++)
	inc	bc
	jr	00112$
00103$:
	C$game.c$205$2_0$27	= .
	.globl	C$game.c$205$2_0$27
;game.c:205: for (int index = 0; index < SOCOBAN_MAX_HEIGHT - 1; index++)
	ld	bc, #0x0000
00115$:
	ld	a, c
	sub	a, #0x13
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
	C$game.c$206$2_0$31	= .
	.globl	C$game.c$206$2_0$31
;game.c:206: RenderTile(SOCOBAN_MAX_WIDTH - 1, index, GREEN_TILE);
	push	bc
	ld	hl, #0x004a
	push	hl
	push	bc
	ld	l, #0x13
	push	hl
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	pop	bc
	C$game.c$205$2_0$31	= .
	.globl	C$game.c$205$2_0$31
;game.c:205: for (int index = 0; index < SOCOBAN_MAX_HEIGHT - 1; index++)
	inc	bc
	C$game.c$207$2_0$27	= .
	.globl	C$game.c$207$2_0$27
;game.c:207: }
	C$game.c$207$2_0$27	= .
	.globl	C$game.c$207$2_0$27
	XG$DrawBoard$0$0	= .
	.globl	XG$DrawBoard$0$0
	jr	00115$
	G$SetupPlayerPosition$0$0	= .
	.globl	G$SetupPlayerPosition$0$0
	C$game.c$209$2_0$32	= .
	.globl	C$game.c$209$2_0$32
;game.c:209: void SetupPlayerPosition()
;	---------------------------------
; Function SetupPlayerPosition
; ---------------------------------
_SetupPlayerPosition::
	C$game.c$211$1_0$32	= .
	.globl	C$game.c$211$1_0$32
;game.c:211: g_playerInfo.x = 7;
	ld	hl, #_g_playerInfo
	ld	(hl), #0x07
	C$game.c$212$1_0$32	= .
	.globl	C$game.c$212$1_0$32
;game.c:212: g_playerInfo.y = 11;
	ld	bc, #_g_playerInfo + 1
	ld	a, #0x0b
	ld	(bc), a
	C$game.c$214$1_0$32	= .
	.globl	C$game.c$214$1_0$32
;game.c:214: if (g_mapInfo.stageNum == 3 || 
	ld	a, (#_g_mapInfo + 0)
	cp	a, #0x03
	jr	Z,00101$
	C$game.c$215$1_0$32	= .
	.globl	C$game.c$215$1_0$32
;game.c:215: g_mapInfo.stageNum == 4)
	sub	a, #0x04
	jr	NZ,00102$
00101$:
	C$game.c$217$2_0$33	= .
	.globl	C$game.c$217$2_0$33
;game.c:217: g_playerInfo.x = 7;
	ld	hl, #_g_playerInfo
	ld	(hl), #0x07
	C$game.c$218$2_0$33	= .
	.globl	C$game.c$218$2_0$33
;game.c:218: g_playerInfo.y = 9;
	ld	a, #0x09
	ld	(bc), a
00102$:
	C$game.c$221$1_0$32	= .
	.globl	C$game.c$221$1_0$32
;game.c:221: g_playerInfo.prev_x = 0;
	ld	hl, #(_g_playerInfo + 0x0002)
	ld	(hl), #0x00
	C$game.c$222$1_0$32	= .
	.globl	C$game.c$222$1_0$32
;game.c:222: g_playerInfo.prev_y = 0;
	ld	hl, #(_g_playerInfo + 0x0003)
	ld	(hl), #0x00
	C$game.c$223$1_0$32	= .
	.globl	C$game.c$223$1_0$32
;game.c:223: }
	C$game.c$223$1_0$32	= .
	.globl	C$game.c$223$1_0$32
	XG$SetupPlayerPosition$0$0	= .
	.globl	XG$SetupPlayerPosition$0$0
	ret
	G$SetupWorld$0$0	= .
	.globl	G$SetupWorld$0$0
	C$game.c$225$1_0$35	= .
	.globl	C$game.c$225$1_0$35
;game.c:225: void SetupWorld()
;	---------------------------------
; Function SetupWorld
; ---------------------------------
_SetupWorld::
	ld	hl, #-9
	add	hl, sp
	ld	sp, hl
	C$game.c$227$5_0$38	= .
	.globl	C$game.c$227$5_0$38
;game.c:227: for (int y = 0; y < SOCOBAN_MAX_HEIGHT; y++)
	ld	bc, #0x0000
00110$:
	ld	a, c
	sub	a, #0x14
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00112$
	C$game.c$229$5_0$38	= .
	.globl	C$game.c$229$5_0$38
;game.c:229: for (int x = 0; x < SOCOBAN_MAX_WIDTH; x++)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	a, #<((_g_mapInfo + 0x0002))
	ld	hl, #0
	add	hl, sp
	add	a, e
	ld	(hl), a
	ld	a, #>((_g_mapInfo + 0x0002))
	adc	a, d
	inc	hl
	ld	(hl), a
	ld	a, #<((_g_mapInfo + 0x0192))
	ld	hl, #2
	add	hl, sp
	add	a, e
	ld	(hl), a
	ld	a, #>((_g_mapInfo + 0x0192))
	adc	a, d
	inc	hl
	ld	(hl), a
	ld	a, #<((_g_mapInfo + 0x0192))
	ld	hl, #4
	add	hl, sp
	add	a, e
	ld	(hl), a
	ld	a, #>((_g_mapInfo + 0x0192))
	adc	a, d
	inc	hl
	ld	(hl), a
	ld	de, #0x0000
00107$:
	ld	a, e
	sub	a, #0x14
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00111$
	C$game.c$231$5_0$38	= .
	.globl	C$game.c$231$5_0$38
;game.c:231: if (g_mapInfo.mapData[y][x] == SPACE_BOX)
	ld	hl, #7
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
	ld	iy, #7
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	dec	iy
	ld	0 (iy), a
	ld	a, 0 (iy)
	sub	a, #0x03
	jr	NZ,00102$
	C$game.c$233$6_0$39	= .
	.globl	C$game.c$233$6_0$39
;game.c:233: g_mapInfo.boxInfo[y][x] = g_mapInfo.mapData[y][x];
	ld	hl, #7
	add	hl, sp
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	add	a, e
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, d
	inc	hl
	ld	(hl), a
	inc	iy
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	dec	iy
	ld	a, 0 (iy)
	ld	(hl), a
	C$game.c$234$6_0$39	= .
	.globl	C$game.c$234$6_0$39
;game.c:234: g_mapInfo.boxCount++;
	ld	hl, #_g_mapInfo + 1
	inc	(hl)
	jr	00108$
00102$:
	C$game.c$238$6_0$40	= .
	.globl	C$game.c$238$6_0$40
;game.c:238: g_mapInfo.boxInfo[y][x] = SPACE_EMPTY;
	ld	hl, #7
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	add	a, e
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, d
	inc	hl
	ld	(hl), a
	ld	hl, #7
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	(hl), #0x00
00108$:
	C$game.c$229$4_0$37	= .
	.globl	C$game.c$229$4_0$37
;game.c:229: for (int x = 0; x < SOCOBAN_MAX_WIDTH; x++)
	inc	de
	jp	00107$
00111$:
	C$game.c$227$2_0$35	= .
	.globl	C$game.c$227$2_0$35
;game.c:227: for (int y = 0; y < SOCOBAN_MAX_HEIGHT; y++)
	inc	bc
	jp	00110$
00112$:
	C$game.c$242$2_0$35	= .
	.globl	C$game.c$242$2_0$35
;game.c:242: }
	ld	hl, #9
	add	hl, sp
	ld	sp, hl
	C$game.c$242$2_0$35	= .
	.globl	C$game.c$242$2_0$35
	XG$SetupWorld$0$0	= .
	.globl	XG$SetupWorld$0$0
	ret
	G$InitGame$0$0	= .
	.globl	G$InitGame$0$0
	C$game.c$244$2_0$41	= .
	.globl	C$game.c$244$2_0$41
;game.c:244: void InitGame()
;	---------------------------------
; Function InitGame
; ---------------------------------
_InitGame::
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	C$game.c$246$3_0$43	= .
	.globl	C$game.c$246$3_0$43
;game.c:246: for (int x = 0; x < SOCOBAN_MAX_WIDTH; x++)
	ld	bc, #0x0000
00107$:
	ld	a, c
	sub	a, #0x14
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00102$
	C$game.c$247$3_0$43	= .
	.globl	C$game.c$247$3_0$43
;game.c:247: for (int y = 0; y < SOCOBAN_MAX_HEIGHT; y++)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ex	(sp), hl
	ld	a, #<((_g_mapInfo + 0x0002))
	ld	hl, #0
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	add	a, (hl)
	ld	0 (iy), a
	ld	a, #>((_g_mapInfo + 0x0002))
	inc	hl
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
	xor	a, a
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
00104$:
	ld	iy, #6
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x14
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00108$
	C$game.c$248$3_0$43	= .
	.globl	C$game.c$248$3_0$43
;game.c:248: g_mapInfo.mapData[x][y] = (*g_stages[g_mapInfo.stageNum])[x][y];
	ld	hl, #6
	add	hl, sp
	push	de
	dec	iy
	dec	iy
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
	ld	a, (#_g_mapInfo + 0)
	ld	l, a
	ld	h, #0x00
	add	hl, hl
	ld	de, #_g_stages
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0
	add	hl, sp
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	ld	a, e
	ld	hl, #6
	add	hl, sp
	add	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	d, a
	ld	a, (de)
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$game.c$247$3_0$43	= .
	.globl	C$game.c$247$3_0$43
;game.c:247: for (int y = 0; y < SOCOBAN_MAX_HEIGHT; y++)
	inc	iy
	inc	iy
	inc	0 (iy)
	jr	NZ,00104$
	inc	1 (iy)
	jr	00104$
00108$:
	C$game.c$246$2_0$42	= .
	.globl	C$game.c$246$2_0$42
;game.c:246: for (int x = 0; x < SOCOBAN_MAX_WIDTH; x++)
	inc	bc
	jp	00107$
00102$:
	C$game.c$250$1_0$41	= .
	.globl	C$game.c$250$1_0$41
;game.c:250: SetupPlayerPosition();
	call	_SetupPlayerPosition
	C$game.c$252$1_0$41	= .
	.globl	C$game.c$252$1_0$41
;game.c:252: SetupWorld();
	call	_SetupWorld
	C$game.c$253$1_0$41	= .
	.globl	C$game.c$253$1_0$41
;game.c:253: }
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	C$game.c$253$1_0$41	= .
	.globl	C$game.c$253$1_0$41
	XG$InitGame$0$0	= .
	.globl	XG$InitGame$0$0
	ret
	G$IsCanGo$0$0	= .
	.globl	G$IsCanGo$0$0
	C$game.c$255$1_0$45	= .
	.globl	C$game.c$255$1_0$45
;game.c:255: char IsCanGo(const char xdir, const char ydir)
;	---------------------------------
; Function IsCanGo
; ---------------------------------
_IsCanGo::
	push	af
	C$game.c$257$1_0$45	= .
	.globl	C$game.c$257$1_0$45
;game.c:257: uint8_t xPos = g_playerInfo.x;
	ld	hl, #_g_playerInfo+0
	ld	c, (hl)
	C$game.c$258$1_0$45	= .
	.globl	C$game.c$258$1_0$45
;game.c:258: uint8_t yPos = g_playerInfo.y;
	ld	a, (#_g_playerInfo+1)
	ld	iy, #1
	add	iy, sp
	ld	0 (iy), a
	C$game.c$260$1_0$45	= .
	.globl	C$game.c$260$1_0$45
;game.c:260: if (g_mapInfo.mapData[yPos][xPos] == SPACE_BLOCK)
	ld	e, 0 (iy)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, #(_g_mapInfo + 0x0002)
	add	hl, de
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	C$game.c$261$1_0$45	= .
	.globl	C$game.c$261$1_0$45
;game.c:261: return 0;
	dec	a
	jr	NZ,00102$
	ld	l,a
	jr	00108$
00102$:
	C$game.c$263$1_0$45	= .
	.globl	C$game.c$263$1_0$45
;game.c:263: if (g_mapInfo.boxInfo[yPos][xPos] == SPACE_BOX)
	ld	hl, #(_g_mapInfo + 0x0192)
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ,00107$
	C$game.c$265$2_0$46	= .
	.globl	C$game.c$265$2_0$46
;game.c:265: if (g_mapInfo.mapData[yPos + ydir][xPos + xdir] == SPACE_BLOCK ||
	ld	hl, #1+0
	add	hl, sp
	ld	e, (hl)
	ld	d, #0x00
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	a, #<((_g_mapInfo + 0x0002))
	ld	hl, #0
	add	hl, sp
	add	a, e
	ld	(hl), a
	ld	a, #>((_g_mapInfo + 0x0002))
	adc	a, d
	inc	hl
	ld	(hl), a
	ld	a, c
	ld	hl, #4
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	iy, #0
	add	iy, sp
	ld	a, 0 (iy)
	add	a, c
	ld	b, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	l, b
	ld	h, a
	ld	a, (hl)
	dec	a
	jr	Z,00103$
	C$game.c$266$2_0$46	= .
	.globl	C$game.c$266$2_0$46
;game.c:266: g_mapInfo.boxInfo[yPos + ydir][xPos + xdir] == SPACE_BOX)
	ld	hl, #(_g_mapInfo + 0x0192)
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ,00107$
00103$:
	C$game.c$267$2_0$46	= .
	.globl	C$game.c$267$2_0$46
;game.c:267: return 0;
	ld	l, #0x00
	jr	00108$
00107$:
	C$game.c$270$1_0$45	= .
	.globl	C$game.c$270$1_0$45
;game.c:270: return 1;
	ld	l, #0x01
00108$:
	C$game.c$271$1_0$45	= .
	.globl	C$game.c$271$1_0$45
;game.c:271: }
	pop	af
	C$game.c$271$1_0$45	= .
	.globl	C$game.c$271$1_0$45
	XG$IsCanGo$0$0	= .
	.globl	XG$IsCanGo$0$0
	ret
	G$ProcessMove$0$0	= .
	.globl	G$ProcessMove$0$0
	C$game.c$273$1_0$48	= .
	.globl	C$game.c$273$1_0$48
;game.c:273: char ProcessMove(char xdir, char ydir)
;	---------------------------------
; Function ProcessMove
; ---------------------------------
_ProcessMove::
	push	af
	C$game.c$275$1_0$48	= .
	.globl	C$game.c$275$1_0$48
;game.c:275: if (xdir == 0 && ydir == 0)
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	jr	NZ,00102$
	inc	iy
	ld	a, 0 (iy)
	C$game.c$276$1_0$48	= .
	.globl	C$game.c$276$1_0$48
;game.c:276: return 0;
	or	a,a
	jr	NZ,00102$
	ld	l,a
	jp	00108$
00102$:
	C$game.c$278$1_0$48	= .
	.globl	C$game.c$278$1_0$48
;game.c:278: g_playerInfo.prev_x = g_playerInfo.x;
	ld	de, #_g_playerInfo+0
	ld	a, (de)
	ld	(#(_g_playerInfo + 0x0002)),a
	C$game.c$279$1_0$48	= .
	.globl	C$game.c$279$1_0$48
;game.c:279: g_playerInfo.prev_y = g_playerInfo.y;
	ld	c, e
	ld	b, d
	inc	bc
	ld	a, (bc)
	ld	(#(_g_playerInfo + 0x0003)),a
	C$game.c$281$1_0$48	= .
	.globl	C$game.c$281$1_0$48
;game.c:281: g_playerInfo.x += xdir;
	ld	a, (de)
	ld	hl, #4
	add	hl, sp
	add	a, (hl)
	ld	(de), a
	C$game.c$282$1_0$48	= .
	.globl	C$game.c$282$1_0$48
;game.c:282: g_playerInfo.y += ydir;
	ld	a, (bc)
	ld	hl, #5
	add	hl, sp
	add	a, (hl)
	ld	(bc), a
	C$game.c$284$1_0$48	= .
	.globl	C$game.c$284$1_0$48
;game.c:284: if (!IsCanGo(xdir, ydir))
	push	bc
	push	de
	ld	iy, #9
	add	iy, sp
	ld	a, 0 (iy)
	push	af
	inc	sp
	dec	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	call	_IsCanGo
	pop	af
	ld	a, l
	pop	de
	pop	bc
	C$game.c$278$1_1$48	= .
	.globl	C$game.c$278$1_1$48
;game.c:278: g_playerInfo.prev_x = g_playerInfo.x;
	push	af
	ld	a, (de)
	ld	l, a
	pop	af
	C$game.c$284$1_0$48	= .
	.globl	C$game.c$284$1_0$48
;game.c:284: if (!IsCanGo(xdir, ydir))
	or	a, a
	jr	NZ,00105$
	C$game.c$286$2_0$49	= .
	.globl	C$game.c$286$2_0$49
;game.c:286: g_playerInfo.x -= xdir;
	ld	a, l
	ld	hl, #4
	add	hl, sp
	sub	a, (hl)
	ld	(de), a
	C$game.c$287$2_0$49	= .
	.globl	C$game.c$287$2_0$49
;game.c:287: g_playerInfo.y -= ydir;
	ld	a, (bc)
	ld	hl, #5
	add	hl, sp
	sub	a, (hl)
	ld	(bc), a
	C$game.c$288$2_0$49	= .
	.globl	C$game.c$288$2_0$49
;game.c:288: return 0;
	ld	l, #0x00
	jr	00108$
00105$:
	C$game.c$291$1_1$50	= .
	.globl	C$game.c$291$1_1$50
;game.c:291: uint8_t xPos = g_playerInfo.x;
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), l
	C$game.c$292$1_1$50	= .
	.globl	C$game.c$292$1_1$50
;game.c:292: uint8_t yPos = g_playerInfo.y;
	ld	a, (bc)
	inc	iy
	ld	0 (iy), a
	C$game.c$294$1_1$50	= .
	.globl	C$game.c$294$1_1$50
;game.c:294: if (g_mapInfo.boxInfo[yPos][xPos] == SPACE_BOX) 
	ld	de, #_g_mapInfo+402
	ld	c, 0 (iy)
	ld	b, #0x00
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #0
	add	hl, sp
	add	a, (hl)
	ld	c, a
	jr	NC,00130$
	inc	b
00130$:
	ld	a, (bc)
	sub	a, #0x03
	jr	NZ,00107$
	C$game.c$296$2_1$51	= .
	.globl	C$game.c$296$2_1$51
;game.c:296: g_mapInfo.boxInfo[yPos][xPos] = SPACE_EMPTY;
	xor	a, a
	ld	(bc), a
	C$game.c$297$2_1$51	= .
	.globl	C$game.c$297$2_1$51
;game.c:297: g_mapInfo.boxInfo[yPos + ydir][xPos + xdir] = SPACE_BOX;
	ld	c, 0 (iy)
	ld	b, #0x00
	ld	hl, #5+0
	add	hl, sp
	ld	a, (hl)
	ld	l, a
	rla
	sbc	a, a
	ld	h, a
	add	hl, bc
	ld	c, l
	ld	b, h
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, de
	ex	de, hl
	ld	hl, #0+0
	add	hl, sp
	ld	a, (hl)
	ld	hl, #4
	add	hl, sp
	add	a, (hl)
	ld	l, a
	ld	h, #0x00
	add	hl, de
	ld	(hl), #0x03
00107$:
	C$game.c$300$1_1$50	= .
	.globl	C$game.c$300$1_1$50
;game.c:300: return 1;
	ld	l, #0x01
00108$:
	C$game.c$301$1_1$48	= .
	.globl	C$game.c$301$1_1$48
;game.c:301: }
	pop	af
	C$game.c$301$1_1$48	= .
	.globl	C$game.c$301$1_1$48
	XG$ProcessMove$0$0	= .
	.globl	XG$ProcessMove$0$0
	ret
	G$ProcessInput$0$0	= .
	.globl	G$ProcessInput$0$0
	C$game.c$303$1_1$52	= .
	.globl	C$game.c$303$1_1$52
;game.c:303: void ProcessInput()
;	---------------------------------
; Function ProcessInput
; ---------------------------------
_ProcessInput::
	C$game.c$305$1_0$52	= .
	.globl	C$game.c$305$1_0$52
;game.c:305: if (ubox_read_keys(8) == UBOX_MSX_KEY_LEFT)
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x10
	jr	NZ,00102$
	C$game.c$306$1_0$52	= .
	.globl	C$game.c$306$1_0$52
;game.c:306: ProcessMove(-1, 0);
	xor	a, a
	ld	d,a
	ld	e,#0xff
	push	de
	call	_ProcessMove
	pop	af
00102$:
	C$game.c$308$1_0$52	= .
	.globl	C$game.c$308$1_0$52
;game.c:308: if (ubox_read_keys(8) == UBOX_MSX_KEY_RIGHT)
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x80
	jr	NZ,00104$
	C$game.c$309$1_0$52	= .
	.globl	C$game.c$309$1_0$52
;game.c:309: ProcessMove(1, 0);
	xor	a, a
	ld	d,a
	ld	e,#0x01
	push	de
	call	_ProcessMove
	pop	af
00104$:
	C$game.c$311$1_0$52	= .
	.globl	C$game.c$311$1_0$52
;game.c:311: if (ubox_read_keys(8) == UBOX_MSX_KEY_UP)
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x20
	jr	NZ,00106$
	C$game.c$312$1_0$52	= .
	.globl	C$game.c$312$1_0$52
;game.c:312: ProcessMove(0, -1);
	ld	a, #0xff
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_ProcessMove
	pop	af
00106$:
	C$game.c$314$1_0$52	= .
	.globl	C$game.c$314$1_0$52
;game.c:314: if (ubox_read_keys(8) == UBOX_MSX_KEY_DOWN)
	ld	l, #0x08
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x40
	jr	NZ,00108$
	C$game.c$315$1_0$52	= .
	.globl	C$game.c$315$1_0$52
;game.c:315: ProcessMove(0, 1);
	ld	a, #0x01
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_ProcessMove
	pop	af
00108$:
	C$game.c$317$1_0$52	= .
	.globl	C$game.c$317$1_0$52
;game.c:317: if (ubox_read_keys(4) == UBOX_MSX_KEY_P)
	ld	l, #0x04
	call	_ubox_read_keys
	ld	a, l
	sub	a, #0x20
	ret	NZ
	C$game.c$319$2_0$53	= .
	.globl	C$game.c$319$2_0$53
;game.c:319: g_gamestate = STATE_GAME_RESET;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x02
	C$game.c$321$1_0$52	= .
	.globl	C$game.c$321$1_0$52
;game.c:321: }
	C$game.c$321$1_0$52	= .
	.globl	C$game.c$321$1_0$52
	XG$ProcessInput$0$0	= .
	.globl	XG$ProcessInput$0$0
	ret
	G$UpdateGameStatus$0$0	= .
	.globl	G$UpdateGameStatus$0$0
	C$game.c$323$1_0$54	= .
	.globl	C$game.c$323$1_0$54
;game.c:323: void UpdateGameStatus()
;	---------------------------------
; Function UpdateGameStatus
; ---------------------------------
_UpdateGameStatus::
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
	C$game.c$325$2_0$54	= .
	.globl	C$game.c$325$2_0$54
;game.c:325: int iCurrentExactBoxCount = 0;
	ld	bc, #0x0000
	C$game.c$327$4_0$57	= .
	.globl	C$game.c$327$4_0$57
;game.c:327: for (int y = 0; y < SOCOBAN_MAX_HEIGHT; y++)
	ld	de, #0x0000
00112$:
	ld	a, e
	sub	a, #0x14
	ld	a, d
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00105$
	C$game.c$328$4_0$57	= .
	.globl	C$game.c$328$4_0$57
;game.c:328: for (int x = 0; x < SOCOBAN_MAX_WIDTH; x++)
	push	de
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ex	(sp), hl
	ld	a, #<((_g_mapInfo + 0x0192))
	ld	hl, #0
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	add	a, (hl)
	ld	0 (iy), a
	ld	a, #>((_g_mapInfo + 0x0192))
	inc	hl
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	xor	a, a
	inc	iy
	inc	iy
	ld	0 (iy), a
	ld	1 (iy), a
00109$:
	ld	iy, #6
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x14
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00123$
	C$game.c$330$4_0$57	= .
	.globl	C$game.c$330$4_0$57
;game.c:330: if (g_mapInfo.boxInfo[y][x] == SPACE_BOX && g_mapInfo.mapData[y][x] == SPACE_BOX_POINT)
	ld	hl, #6
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	sub	a, #0x03
	jr	NZ,00110$
	ld	a, #<((_g_mapInfo + 0x0002))
	ld	hl, #0
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, #>((_g_mapInfo + 0x0002))
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, c
	ld	hl, #6
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	sub	a, #0x02
	jr	NZ,00110$
	C$game.c$331$4_0$57	= .
	.globl	C$game.c$331$4_0$57
;game.c:331: iCurrentExactBoxCount++;
	inc	iy
	inc	iy
	inc	0 (iy)
	jr	NZ,00157$
	inc	1 (iy)
00157$:
00110$:
	C$game.c$328$3_0$56	= .
	.globl	C$game.c$328$3_0$56
;game.c:328: for (int x = 0; x < SOCOBAN_MAX_WIDTH; x++)
	ld	iy, #6
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00109$
	inc	1 (iy)
	jr	00109$
00123$:
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	C$game.c$327$2_0$55	= .
	.globl	C$game.c$327$2_0$55
;game.c:327: for (int y = 0; y < SOCOBAN_MAX_HEIGHT; y++)
	inc	de
	jp	00112$
00105$:
	C$game.c$334$1_0$54	= .
	.globl	C$game.c$334$1_0$54
;game.c:334: if (iCurrentExactBoxCount == g_mapInfo.boxCount)
	ld	a, (#(_g_mapInfo + 0x0001) + 0)
	ld	e, a
	ld	d, #0x00
	ld	l, c
	ld	h, b
	cp	a, a
	sbc	hl, de
	jr	NZ,00114$
	C$game.c$336$2_0$58	= .
	.globl	C$game.c$336$2_0$58
;game.c:336: g_mapInfo.stageNum++;
	ld	a, (#_g_mapInfo + 0)
	inc	a
	ld	(#_g_mapInfo),a
	C$game.c$337$2_0$58	= .
	.globl	C$game.c$337$2_0$58
;game.c:337: g_mapInfo.boxCount = 0;
	ld	hl, #(_g_mapInfo + 0x0001)
	ld	(hl), #0x00
	C$game.c$338$2_0$58	= .
	.globl	C$game.c$338$2_0$58
;game.c:338: g_gamestate = STATE_GAME_CLEAR;
	ld	hl,#_g_gamestate + 0
	ld	(hl), #0x04
00114$:
	C$game.c$340$1_0$54	= .
	.globl	C$game.c$340$1_0$54
;game.c:340: }
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	C$game.c$340$1_0$54	= .
	.globl	C$game.c$340$1_0$54
	XG$UpdateGameStatus$0$0	= .
	.globl	XG$UpdateGameStatus$0$0
	ret
	G$DrawObject$0$0	= .
	.globl	G$DrawObject$0$0
	C$game.c$342$1_0$60	= .
	.globl	C$game.c$342$1_0$60
;game.c:342: void DrawObject()
;	---------------------------------
; Function DrawObject
; ---------------------------------
_DrawObject::
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
	C$game.c$344$5_0$63	= .
	.globl	C$game.c$344$5_0$63
;game.c:344: for (int y = 1; y < SOCOBAN_MAX_HEIGHT - 1; y++)
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
00115$:
	ld	iy, #8
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x13
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00117$
	C$game.c$346$5_0$63	= .
	.globl	C$game.c$346$5_0$63
;game.c:346: for (int x = 1; x < SOCOBAN_MAX_WIDTH - 1; x++)
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	inc	iy
	inc	iy
	ld	0 (iy), l
	ld	1 (iy), h
	ld	a, #<((_g_mapInfo + 0x0002))
	ld	hl, #10
	add	hl, sp
	ld	iy, #0
	add	iy, sp
	add	a, (hl)
	ld	0 (iy), a
	ld	a, #>((_g_mapInfo + 0x0002))
	inc	hl
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
	ld	a, #<((_g_mapInfo + 0x0192))
	ld	hl, #10
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	add	a, (hl)
	ld	0 (iy), a
	ld	a, #>((_g_mapInfo + 0x0192))
	inc	hl
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
	ld	a, #<((_g_mapInfo + 0x0192))
	ld	hl, #10
	add	hl, sp
	ld	iy, #4
	add	iy, sp
	add	a, (hl)
	ld	0 (iy), a
	ld	a, #>((_g_mapInfo + 0x0192))
	inc	hl
	adc	a, (hl)
	inc	iy
	ld	0 (iy), a
	ld	iy, #10
	add	iy, sp
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
00112$:
	ld	iy, #10
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x13
	ld	a, 1 (iy)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00116$
	C$game.c$348$2_0$60	= .
	.globl	C$game.c$348$2_0$60
;game.c:348: if (g_mapInfo.mapData[y][x] == SPACE_BLOCK)
	ld	hl, #10
	add	hl, sp
	push	de
	ld	iy, #8
	add	iy, sp
	push	iy
	pop	de
	ld	iy, #2
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
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	dec	a
	jr	NZ,00102$
	C$game.c$349$5_0$63	= .
	.globl	C$game.c$349$5_0$63
;game.c:349: RenderTile(x, y, YELLOW_TILE);
	ld	hl, #0x004d
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
00102$:
	C$game.c$351$5_0$63	= .
	.globl	C$game.c$351$5_0$63
;game.c:351: if (g_mapInfo.mapData[y][x] == SPACE_BOX_POINT)
	ld	hl, #6
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	c, (hl)
	ld	a, c
	sub	a, #0x02
	jr	NZ,00106$
	C$game.c$352$5_0$63	= .
	.globl	C$game.c$352$5_0$63
;game.c:352: if(g_mapInfo.boxInfo[y][x] != g_mapInfo.mapData[y][x])
	ld	hl, #10
	add	hl, sp
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	b, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	l, b
	ld	h, a
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	Z,00106$
	C$game.c$353$5_0$63	= .
	.globl	C$game.c$353$5_0$63
;game.c:353: RenderTile(x, y, WHITE_TILE);	
	ld	hl, #0x0051
	push	hl
	ld	iy, #10
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
00106$:
	C$game.c$355$5_0$63	= .
	.globl	C$game.c$355$5_0$63
;game.c:355: if (g_mapInfo.boxInfo[y][x] == SPACE_BOX)
	ld	hl, #10
	add	hl, sp
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	add	a, (hl)
	ld	c, a
	ld	a, 1 (iy)
	inc	hl
	adc	a, (hl)
	ld	b, a
	ld	a, (bc)
	sub	a, #0x03
	jr	NZ,00113$
	C$game.c$356$5_0$63	= .
	.globl	C$game.c$356$5_0$63
;game.c:356: RenderTile(x, y, GREEN_TILE);
	ld	hl, #0x004a
	push	hl
	ld	iy, #10
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
00113$:
	C$game.c$346$4_0$62	= .
	.globl	C$game.c$346$4_0$62
;game.c:346: for (int x = 1; x < SOCOBAN_MAX_WIDTH - 1; x++)
	ld	iy, #10
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00112$
	inc	1 (iy)
	jp	00112$
00116$:
	C$game.c$344$2_0$60	= .
	.globl	C$game.c$344$2_0$60
;game.c:344: for (int y = 1; y < SOCOBAN_MAX_HEIGHT - 1; y++)
	ld	iy, #8
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00115$
	inc	1 (iy)
	jp	00115$
00117$:
	C$game.c$359$2_0$60	= .
	.globl	C$game.c$359$2_0$60
;game.c:359: }
	ld	hl, #12
	add	hl, sp
	ld	sp, hl
	C$game.c$359$2_0$60	= .
	.globl	C$game.c$359$2_0$60
	XG$DrawObject$0$0	= .
	.globl	XG$DrawObject$0$0
	ret
	G$DrawPlayer$0$0	= .
	.globl	G$DrawPlayer$0$0
	C$game.c$361$2_0$64	= .
	.globl	C$game.c$361$2_0$64
;game.c:361: void DrawPlayer()
;	---------------------------------
; Function DrawPlayer
; ---------------------------------
_DrawPlayer::
	C$game.c$363$1_0$64	= .
	.globl	C$game.c$363$1_0$64
;game.c:363: RenderTile(g_playerInfo.x, g_playerInfo.y, RED_TILE);
	ld	a, (#_g_playerInfo + 1)
	ld	e, a
	ld	d, #0x00
	ld	a, (#_g_playerInfo + 0)
	ld	c, a
	ld	b, #0x00
	ld	hl, #0x0050
	push	hl
	push	de
	push	bc
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	C$game.c$365$1_0$64	= .
	.globl	C$game.c$365$1_0$64
;game.c:365: if (g_playerInfo.prev_x == 0 && g_playerInfo.prev_y == 0)
	ld	hl, #_g_playerInfo + 2
	ld	c, (hl)
	ld	hl, #_g_playerInfo + 3
	ld	b, (hl)
	ld	a, c
	or	a,a
	jr	NZ,00102$
	or	a,b
	C$game.c$366$1_0$64	= .
	.globl	C$game.c$366$1_0$64
;game.c:366: return;
	ret	Z
00102$:
	C$game.c$368$1_0$64	= .
	.globl	C$game.c$368$1_0$64
;game.c:368: if (g_mapInfo.mapData[g_playerInfo.prev_y][g_playerInfo.prev_x] != SPACE_BOX_POINT)
	ld	e, b
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ld	de, #(_g_mapInfo + 0x0002)
	add	hl, de
	ld	e, c
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	sub	a, #0x02
	ret	Z
	C$game.c$369$1_0$64	= .
	.globl	C$game.c$369$1_0$64
;game.c:369: RenderTile(g_playerInfo.prev_x, g_playerInfo.prev_y, BLACK_TILE);
	ld	e, b
	ld	d, #0x00
	ld	b, #0x00
	ld	hl, #0x0055
	push	hl
	push	de
	push	bc
	call	_RenderTile
	ld	hl, #6
	add	hl, sp
	ld	sp, hl
	C$game.c$370$1_0$64	= .
	.globl	C$game.c$370$1_0$64
;game.c:370: }
	C$game.c$370$1_0$64	= .
	.globl	C$game.c$370$1_0$64
	XG$DrawPlayer$0$0	= .
	.globl	XG$DrawPlayer$0$0
	ret
	G$DrawMap$0$0	= .
	.globl	G$DrawMap$0$0
	C$game.c$372$1_0$65	= .
	.globl	C$game.c$372$1_0$65
;game.c:372: void DrawMap()
;	---------------------------------
; Function DrawMap
; ---------------------------------
_DrawMap::
	C$game.c$374$1_0$65	= .
	.globl	C$game.c$374$1_0$65
;game.c:374: if (g_playerInfo.prev_x != g_playerInfo.x || g_playerInfo.prev_y != g_playerInfo.y)
	ld	hl, #(_g_playerInfo + 0x0002) + 0
	ld	c, (hl)
	ld	hl, #_g_playerInfo + 0
	ld	b, (hl)
	ld	a, c
	sub	a, b
	jr	NZ,00101$
	ld	a, (#(_g_playerInfo + 0x0003) + 0)
	ld	hl, #(_g_playerInfo + 0x0001) + 0
	ld	c, (hl)
	sub	a, c
	ret	Z
00101$:
	C$game.c$376$2_0$66	= .
	.globl	C$game.c$376$2_0$66
;game.c:376: DrawObject();
	call	_DrawObject
	C$game.c$377$2_0$66	= .
	.globl	C$game.c$377$2_0$66
;game.c:377: DrawPlayer();
	call	_DrawPlayer
	C$game.c$379$2_0$66	= .
	.globl	C$game.c$379$2_0$66
;game.c:379: g_playerInfo.prev_x = g_playerInfo.x;
	ld	a, (#_g_playerInfo + 0)
	ld	(#(_g_playerInfo + 0x0002)),a
	C$game.c$380$2_0$66	= .
	.globl	C$game.c$380$2_0$66
;game.c:380: g_playerInfo.prev_y = g_playerInfo.y;
	ld	a, (#(_g_playerInfo + 0x0001) + 0)
	ld	(#(_g_playerInfo + 0x0003)),a
	C$game.c$382$1_0$65	= .
	.globl	C$game.c$382$1_0$65
;game.c:382: }
	C$game.c$382$1_0$65	= .
	.globl	C$game.c$382$1_0$65
	XG$DrawMap$0$0	= .
	.globl	XG$DrawMap$0$0
	ret
	G$ProcessLogic$0$0	= .
	.globl	G$ProcessLogic$0$0
	C$game.c$384$1_0$67	= .
	.globl	C$game.c$384$1_0$67
;game.c:384: void ProcessLogic()
;	---------------------------------
; Function ProcessLogic
; ---------------------------------
_ProcessLogic::
	C$game.c$386$1_0$67	= .
	.globl	C$game.c$386$1_0$67
;game.c:386: ProcessInput();
	call	_ProcessInput
	C$game.c$387$1_0$67	= .
	.globl	C$game.c$387$1_0$67
;game.c:387: UpdateGameStatus();
	call	_UpdateGameStatus
	C$game.c$388$1_0$67	= .
	.globl	C$game.c$388$1_0$67
;game.c:388: DrawMap();
	C$game.c$389$1_0$67	= .
	.globl	C$game.c$389$1_0$67
;game.c:389: }
	C$game.c$389$1_0$67	= .
	.globl	C$game.c$389$1_0$67
	XG$ProcessLogic$0$0	= .
	.globl	XG$ProcessLogic$0$0
	jp	_DrawMap
	.area _CODE
	.area _INITIALIZER
Fgame$__xinit_g_stages$0_0$0 == .
__xinit__g_stages:
	.dw _g_map1
	.dw _g_map2
	.dw _g_map3
	.dw _g_map4
	.dw _g_map5
Fgame$__xinit_g_mapInfo$0_0$0 == .
__xinit__g_mapInfo:
	.db #0x00	; 0
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
	.area _CABS (ABS)
