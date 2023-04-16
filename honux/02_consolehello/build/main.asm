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
	.globl _printf
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
	G$main$0$0	= .
	.globl	G$main$0$0
	C$main.c$5$0_0$3	= .
	.globl	C$main.c$5$0_0$3
;main.c:5: void main()
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$main.c$7$5_0$6	= .
	.globl	C$main.c$7$5_0$6
;main.c:7: for (int y = 0; y < 23; y++)
	ld	bc, #0x0000
00107$:
	ld	a, c
	sub	a, #0x17
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	ret	NC
	C$main.c$9$2_0$3	= .
	.globl	C$main.c$9$2_0$3
;main.c:9: for (int x = 0; x <= y; x++)
	ld	de, #0x0000
00104$:
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00133$
	xor	a, #0x80
00133$:
	jp	M, 00101$
	C$main.c$11$5_0$6	= .
	.globl	C$main.c$11$5_0$6
;main.c:11: printf("*");
	push	bc
	push	de
	ld	hl, #___str_0
	push	hl
	call	_printf
	pop	af
	pop	de
	pop	bc
	C$main.c$9$4_0$5	= .
	.globl	C$main.c$9$4_0$5
;main.c:9: for (int x = 0; x <= y; x++)
	inc	de
	jr	00104$
00101$:
	C$main.c$13$3_0$4	= .
	.globl	C$main.c$13$3_0$4
;main.c:13: printf("\r\n");
	push	bc
	ld	hl, #___str_1
	push	hl
	call	_printf
	pop	af
	pop	bc
	C$main.c$7$2_0$3	= .
	.globl	C$main.c$7$2_0$3
;main.c:7: for (int y = 0; y < 23; y++)
	inc	bc
	C$main.c$15$2_0$3	= .
	.globl	C$main.c$15$2_0$3
;main.c:15: }
	C$main.c$15$2_0$3	= .
	.globl	C$main.c$15$2_0$3
	XG$main$0$0	= .
	.globl	XG$main$0$0
	jr	00107$
Fmain$__str_0$0_0$0 == .
___str_0:
	.ascii "*"
	.db 0x00
Fmain$__str_1$0_0$0 == .
___str_1:
	.db 0x0d
	.db 0x0a
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
