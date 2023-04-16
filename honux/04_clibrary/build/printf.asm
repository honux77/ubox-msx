;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module printf
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl __putchar
	.globl _printf_
	.globl _sprintf_
	.globl _snprintf_
	.globl _vprintf_
	.globl _vsnprintf_
	.globl _fctprintf
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
	Fprintf$_out_buffer$0$0	= .
	.globl	Fprintf$_out_buffer$0$0
	C$printf.c$133$0_0$12	= .
	.globl	C$printf.c$133$0_0$12
;printf.c:133: static inline void _out_buffer(char character, void* buffer, size_t idx, size_t maxlen)
;	---------------------------------
; Function _out_buffer
; ---------------------------------
__out_buffer:
	C$printf.c$135$1_0$12	= .
	.globl	C$printf.c$135$1_0$12
;printf.c:135: if (idx < maxlen) {
	ld	hl, #7
	add	hl, sp
	ld	iy, #5
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	ret	NC
	C$printf.c$136$2_0$13	= .
	.globl	C$printf.c$136$2_0$13
;printf.c:136: ((char*)buffer)[idx] = character;
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	b, 1 (iy)
	ld	hl, #5
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	adc	a, (hl)
	ld	b, a
	dec	iy
	ld	a, 0 (iy)
	ld	(bc), a
	C$printf.c$138$1_0$12	= .
	.globl	C$printf.c$138$1_0$12
;printf.c:138: }
	C$printf.c$138$1_0$12	= .
	.globl	C$printf.c$138$1_0$12
	XFprintf$_out_buffer$0$0	= .
	.globl	XFprintf$_out_buffer$0$0
	ret
	Fprintf$_out_null$0$0	= .
	.globl	Fprintf$_out_null$0$0
	C$printf.c$142$1_0$15	= .
	.globl	C$printf.c$142$1_0$15
;printf.c:142: static inline void _out_null(char character, void* buffer, size_t idx, size_t maxlen)
;	---------------------------------
; Function _out_null
; ---------------------------------
__out_null:
	C$printf.c$144$1_0$15	= .
	.globl	C$printf.c$144$1_0$15
;printf.c:144: (void)character; (void)buffer; (void)idx; (void)maxlen;
	C$printf.c$145$1_0$15	= .
	.globl	C$printf.c$145$1_0$15
;printf.c:145: }
	C$printf.c$145$1_0$15	= .
	.globl	C$printf.c$145$1_0$15
	XFprintf$_out_null$0$0	= .
	.globl	XFprintf$_out_null$0$0
	ret
	Fprintf$_out_char$0$0	= .
	.globl	Fprintf$_out_char$0$0
	C$printf.c$149$1_0$17	= .
	.globl	C$printf.c$149$1_0$17
;printf.c:149: static inline void _out_char(char character, void* buffer, size_t idx, size_t maxlen)
;	---------------------------------
; Function _out_char
; ---------------------------------
__out_char:
	C$printf.c$152$1_0$17	= .
	.globl	C$printf.c$152$1_0$17
;printf.c:152: if (character) {
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	ret	Z
	C$printf.c$153$2_0$18	= .
	.globl	C$printf.c$153$2_0$18
;printf.c:153: _putchar(character);
	ld	a, 0 (iy)
	push	af
	inc	sp
	call	__putchar
	inc	sp
	C$printf.c$155$1_0$17	= .
	.globl	C$printf.c$155$1_0$17
;printf.c:155: }
	C$printf.c$155$1_0$17	= .
	.globl	C$printf.c$155$1_0$17
	XFprintf$_out_char$0$0	= .
	.globl	XFprintf$_out_char$0$0
	ret
	Fprintf$_out_fct$0$0	= .
	.globl	Fprintf$_out_fct$0$0
	C$printf.c$159$1_0$20	= .
	.globl	C$printf.c$159$1_0$20
;printf.c:159: static inline void _out_fct(char character, void* buffer, size_t idx, size_t maxlen)
;	---------------------------------
; Function _out_fct
; ---------------------------------
__out_fct:
	C$printf.c$162$1_0$20	= .
	.globl	C$printf.c$162$1_0$20
;printf.c:162: if (character) {
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	or	a, a
	ret	Z
	C$printf.c$164$1_0$20	= .
	.globl	C$printf.c$164$1_0$20
;printf.c:164: ((out_fct_wrap_type*)buffer)->fct(character, ((out_fct_wrap_type*)buffer)->arg);
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	dec	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	ld	l, c
	ld	h, b
	call	___sdcc_call_hl
	pop	af
	inc	sp
	C$printf.c$166$1_0$20	= .
	.globl	C$printf.c$166$1_0$20
;printf.c:166: }
	C$printf.c$166$1_0$20	= .
	.globl	C$printf.c$166$1_0$20
	XFprintf$_out_fct$0$0	= .
	.globl	XFprintf$_out_fct$0$0
	ret
	Fprintf$_strnlen_s$0$0	= .
	.globl	Fprintf$_strnlen_s$0$0
	C$printf.c$171$1_0$23	= .
	.globl	C$printf.c$171$1_0$23
;printf.c:171: static inline unsigned int _strnlen_s(const char* str, size_t maxsize)
;	---------------------------------
; Function _strnlen_s
; ---------------------------------
__strnlen_s:
	push	af
	C$printf.c$174$2_0$24	= .
	.globl	C$printf.c$174$2_0$24
;printf.c:174: for (s = str; *s && maxsize--; ++s);
	ld	iy, #4
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	iy
	inc	iy
	ld	e, 0 (iy)
	ld	d, 1 (iy)
00104$:
	ld	a, (bc)
	or	a, a
	jr	Z,00101$
	inc	sp
	inc	sp
	push	de
	dec	de
	ld	hl, #0+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z,00101$
	inc	bc
	jr	00104$
00101$:
	C$printf.c$175$1_0$23	= .
	.globl	C$printf.c$175$1_0$23
;printf.c:175: return (unsigned int)(s - str);
	ld	hl, #4
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	c, a
	ld	a, b
	inc	hl
	sbc	a, (hl)
	ld	h, a
	ld	l, c
	C$printf.c$176$1_0$23	= .
	.globl	C$printf.c$176$1_0$23
;printf.c:176: }
	pop	af
	C$printf.c$176$1_0$23	= .
	.globl	C$printf.c$176$1_0$23
	XFprintf$_strnlen_s$0$0	= .
	.globl	XFprintf$_strnlen_s$0$0
	ret
	Fprintf$_is_digit$0$0	= .
	.globl	Fprintf$_is_digit$0$0
	C$printf.c$181$1_0$26	= .
	.globl	C$printf.c$181$1_0$26
;printf.c:181: static inline bool _is_digit(char ch)
;	---------------------------------
; Function _is_digit
; ---------------------------------
__is_digit:
	C$printf.c$183$1_0$26	= .
	.globl	C$printf.c$183$1_0$26
;printf.c:183: return (ch >= '0') && (ch <= '9');
	ld	iy, #2
	add	iy, sp
	ld	a, 0 (iy)
	xor	a, #0x80
	sub	a, #0xb0
	jr	C,00103$
	ld	a, #0x39
	sub	a, 0 (iy)
	jp	PO, 00111$
	xor	a, #0x80
00111$:
	jp	P, 00104$
00103$:
	ld	l, #0x00
	ret
00104$:
	ld	l, #0x01
	C$printf.c$184$1_0$26	= .
	.globl	C$printf.c$184$1_0$26
;printf.c:184: }
	C$printf.c$184$1_0$26	= .
	.globl	C$printf.c$184$1_0$26
	XFprintf$_is_digit$0$0	= .
	.globl	XFprintf$_is_digit$0$0
	ret
	Fprintf$_atoi$0$0	= .
	.globl	Fprintf$_atoi$0$0
	C$printf.c$188$1_0$28	= .
	.globl	C$printf.c$188$1_0$28
;printf.c:188: static unsigned int _atoi(const char** str)
;	---------------------------------
; Function _atoi
; ---------------------------------
__atoi:
	push	af
	push	af
	C$printf.c$190$2_0$28	= .
	.globl	C$printf.c$190$2_0$28
;printf.c:190: unsigned int i = 0U;
	xor	a, a
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
	C$printf.c$191$1_0$28	= .
	.globl	C$printf.c$191$1_0$28
;printf.c:191: while (_is_digit(**str)) {
00101$:
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, (de)
	C$printf.c$183$4_0$32	= .
	.globl	C$printf.c$183$4_0$32
;printf.c:183: return (ch >= '0') && (ch <= '9');
	ld	l, a
	xor	a, #0x80
	sub	a, #0xb0
	jr	C,00103$
	ld	a, #0x39
	sub	a, l
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	M, 00103$
	C$printf.c$192$2_0$29	= .
	.globl	C$printf.c$192$2_0$29
;printf.c:192: i = i * 10U + (unsigned int)(*((*str)++) - '0');
	push	de
	ld	iy, #4
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ex	(sp), hl
	ld	hl, #0x0001
	add	hl, de
	ld	0 (iy), l
	ld	1 (iy), h
	ld	a, 0 (iy)
	ld	(bc), a
	inc	bc
	ld	a, 1 (iy)
	ld	(bc), a
	ld	a, (de)
	ld	c, a
	rla
	sbc	a, a
	ld	b, a
	ld	a, c
	add	a, #0xd0
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
	pop	hl
	push	hl
	add	hl, bc
	ld	0 (iy), l
	ld	1 (iy), h
	jr	00101$
00103$:
	C$printf.c$194$1_0$28	= .
	.globl	C$printf.c$194$1_0$28
;printf.c:194: return i;
	pop	bc
	pop	hl
	push	hl
	push	bc
	C$printf.c$195$1_0$28	= .
	.globl	C$printf.c$195$1_0$28
;printf.c:195: }
	pop	af
	pop	af
	C$printf.c$195$1_0$28	= .
	.globl	C$printf.c$195$1_0$28
	XFprintf$_atoi$0$0	= .
	.globl	XFprintf$_atoi$0$0
	ret
	Fprintf$_out_rev$0$0	= .
	.globl	Fprintf$_out_rev$0$0
	C$printf.c$199$1_0$34	= .
	.globl	C$printf.c$199$1_0$34
;printf.c:199: static size_t _out_rev(out_fct_type out, char* buffer, size_t idx, size_t maxlen, const char* buf, size_t len, unsigned int width, unsigned int flags)
;	---------------------------------
; Function _out_rev
; ---------------------------------
__out_rev:
	ld	hl, #-10
	add	hl, sp
	ld	sp, hl
	C$printf.c$201$2_0$34	= .
	.globl	C$printf.c$201$2_0$34
;printf.c:201: const size_t start_idx = idx;
	ld	hl, #16+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #16+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #0
	add	iy, sp
	ld	1 (iy), a
	C$printf.c$204$1_0$34	= .
	.globl	C$printf.c$204$1_0$34
;printf.c:204: if (!(flags & FLAGS_LEFT) && !(flags & FLAGS_ZEROPAD)) {
	ld	hl, #26+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x02
	ld	iy, #2
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), #0x00
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00123$
	ld	hl, #26+0
	add	hl, sp
	ld	a, (hl)
	rrca
	jp	C,00123$
	C$printf.c$205$4_0$36	= .
	.globl	C$printf.c$205$4_0$36
;printf.c:205: for (size_t i = len; i < width; i++) {
	ld	hl, #22
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	pop	de
	push	de
00114$:
	ld	hl, #24
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jr	NC,00126$
	C$printf.c$206$4_0$37	= .
	.globl	C$printf.c$206$4_0$37
;printf.c:206: out(' ', buffer, idx++, maxlen);
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
	inc	de
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #14+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #8
	add	iy, sp
	ld	1 (iy), a
	push	bc
	push	de
	ld	hl, #22
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	iy, #12
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #23
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
	C$printf.c$205$3_0$36	= .
	.globl	C$printf.c$205$3_0$36
;printf.c:205: for (size_t i = len; i < width; i++) {
	inc	bc
	jr	00114$
	C$printf.c$211$1_0$34	= .
	.globl	C$printf.c$211$1_0$34
;printf.c:211: while (len) {
00126$:
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
00123$:
	ld	hl, #16
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #22
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
00105$:
	ld	a, d
	or	a, e
	jp	Z, 00127$
	C$printf.c$212$2_0$38	= .
	.globl	C$printf.c$212$2_0$38
;printf.c:212: out(buf[--len], buffer, idx++, maxlen);
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	inc	bc
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #14+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	1 (iy), a
	dec	de
	ld	hl, #8
	add	hl, sp
	ld	iy, #20
	add	iy, sp
	ld	a, 0 (iy)
	add	a, e
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, d
	inc	hl
	ld	(hl), a
	ld	iy, #8
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	inc	iy
	ld	0 (iy), a
	push	bc
	push	de
	ld	hl, #22
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
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
	inc	iy
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	push	af
	inc	sp
	inc	iy
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
	jp	00105$
00127$:
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	C$printf.c$216$1_0$34	= .
	.globl	C$printf.c$216$1_0$34
;printf.c:216: if (flags & FLAGS_LEFT) {
	ld	hl, #2+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jp	Z, 00112$
	C$printf.c$217$1_0$34	= .
	.globl	C$printf.c$217$1_0$34
;printf.c:217: while (idx - start_idx < width) {
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
00108$:
	ld	hl, #0
	add	hl, sp
	ld	iy, #8
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	c, a
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	ld	b, a
	ld	hl, #24
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jr	NC,00128$
	C$printf.c$218$3_0$40	= .
	.globl	C$printf.c$218$3_0$40
;printf.c:218: out(' ', buffer, idx++, maxlen);
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	0 (iy)
	jr	NZ,00167$
	inc	1 (iy)
00167$:
	ld	a, 0 (iy)
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #8+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #16
	add	iy, sp
	ld	1 (iy), a
	dec	iy
	dec	iy
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	hl, #18
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	push	bc
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #19
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	jr	00108$
00128$:
	ld	hl, #8+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #8+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #16
	add	iy, sp
	ld	1 (iy), a
00112$:
	C$printf.c$222$1_0$34	= .
	.globl	C$printf.c$222$1_0$34
;printf.c:222: return idx;
	ld	hl, #16
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	C$printf.c$223$1_0$34	= .
	.globl	C$printf.c$223$1_0$34
;printf.c:223: }
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	C$printf.c$223$1_0$34	= .
	.globl	C$printf.c$223$1_0$34
	XFprintf$_out_rev$0$0	= .
	.globl	XFprintf$_out_rev$0$0
	ret
	Fprintf$_ntoa_format$0$0	= .
	.globl	Fprintf$_ntoa_format$0$0
	C$printf.c$227$1_0$42	= .
	.globl	C$printf.c$227$1_0$42
;printf.c:227: static size_t _ntoa_format(out_fct_type out, char* buffer, size_t idx, size_t maxlen, char* buf, size_t len, bool negative, unsigned int base, unsigned int prec, unsigned int width, unsigned int flags)
;	---------------------------------
; Function _ntoa_format
; ---------------------------------
__ntoa_format:
	push	af
	C$printf.c$230$1_0$42	= .
	.globl	C$printf.c$230$1_0$42
;printf.c:230: if (!(flags & FLAGS_LEFT)) {
	ld	hl, #23+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x02
	jp	NZ,00116$
	C$printf.c$231$2_0$43	= .
	.globl	C$printf.c$231$2_0$43
;printf.c:231: if (width && (flags & FLAGS_ZEROPAD) && (negative || (flags & (FLAGS_PLUS | FLAGS_SPACE)))) {
	ld	iy, #21
	add	iy, sp
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00160$
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	rrca
	jr	NC,00160$
	ld	hl, #16+0
	add	hl, sp
	bit	0, (hl)
	jr	NZ,00101$
	ld	hl, #23+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x0c
	jr	Z,00160$
00101$:
	C$printf.c$232$3_0$44	= .
	.globl	C$printf.c$232$3_0$44
;printf.c:232: width--;
	ld	hl, #21
	add	hl, sp
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	C$printf.c$234$1_0$42	= .
	.globl	C$printf.c$234$1_0$42
;printf.c:234: while ((len < prec) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
00160$:
	ld	hl, #14
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
00107$:
	ld	hl, #19
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jr	NC,00164$
	ld	a, c
	sub	a, #0x20
	ld	a, b
	sbc	a, #0x00
	jr	NC,00164$
	C$printf.c$235$3_0$45	= .
	.globl	C$printf.c$235$3_0$45
;printf.c:235: buf[len++] = '0';
	ld	hl, #12
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	bc
	ld	(hl), #0x30
	jr	00107$
	C$printf.c$237$1_0$42	= .
	.globl	C$printf.c$237$1_0$42
;printf.c:237: while ((flags & FLAGS_ZEROPAD) && (len < width) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
00164$:
	ld	hl, #23+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x01
	ld	iy, #0
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), #0x00
00112$:
	ld	hl, #0+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z,00185$
	ld	hl, #21
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jr	NC,00185$
	ld	a, c
	sub	a, #0x20
	ld	a, b
	sbc	a, #0x00
	jr	NC,00185$
	C$printf.c$238$3_0$46	= .
	.globl	C$printf.c$238$3_0$46
;printf.c:238: buf[len++] = '0';
	ld	hl, #12
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	inc	bc
	ld	(hl), #0x30
	jr	00112$
00185$:
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
00116$:
	C$printf.c$243$1_0$42	= .
	.globl	C$printf.c$243$1_0$42
;printf.c:243: if (flags & FLAGS_HASH) {
	ld	hl, #23+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x10
	jp	Z,00141$
	C$printf.c$246$1_0$42	= .
	.globl	C$printf.c$246$1_0$42
;printf.c:246: if (len && (base == 16U)) {
	ld	iy, #17
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x10
	or	a, 1 (iy)
	ld	a, #0x01
	jr	Z,00312$
	xor	a, a
00312$:
	ld	c, a
	C$printf.c$244$2_0$47	= .
	.globl	C$printf.c$244$2_0$47
;printf.c:244: if (!(flags & FLAGS_PRECISION) && len && ((len == prec) || (len == width))) {
	ld	hl, #23+1
	add	hl, sp
	ld	a, (hl)
	and	a, #0x04
	jr	NZ,00121$
	ld	iy, #14
	add	iy, sp
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00121$
	ld	a, 0 (iy)
	ld	iy, #19
	add	iy, sp
	sub	a, 0 (iy)
	jr	NZ,00315$
	ld	hl, #14+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #19
	add	iy, sp
	sub	a, 1 (iy)
	jr	Z,00120$
00315$:
	ld	hl, #14+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #21
	add	iy, sp
	sub	a, 0 (iy)
	jr	NZ,00121$
	ld	hl, #14+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #21
	add	iy, sp
	sub	a, 1 (iy)
	jr	NZ,00121$
00120$:
	C$printf.c$245$3_0$48	= .
	.globl	C$printf.c$245$3_0$48
;printf.c:245: len--;
	ld	hl, #14
	add	hl, sp
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	C$printf.c$246$3_0$48	= .
	.globl	C$printf.c$246$3_0$48
;printf.c:246: if (len && (base == 16U)) {
	ld	hl, #14+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z,00121$
	ld	a, c
	or	a, a
	jr	Z,00121$
	C$printf.c$247$4_0$49	= .
	.globl	C$printf.c$247$4_0$49
;printf.c:247: len--;
	ld	hl, #14
	add	hl, sp
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
00121$:
	C$printf.c$250$1_0$42	= .
	.globl	C$printf.c$250$1_0$42
;printf.c:250: if ((base == 16U) && !(flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
	ld	iy, #14
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x20
	ld	a, 1 (iy)
	sbc	a, #0x00
	ld	a, #0x00
	rla
	ld	b, a
	ld	a, c
	or	a, a
	jr	Z,00134$
	ld	hl, #23+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x20
	jr	NZ,00134$
	ld	a, b
	or	a, a
	jr	Z,00134$
	C$printf.c$251$3_0$50	= .
	.globl	C$printf.c$251$3_0$50
;printf.c:251: buf[len++] = 'x';
	ld	iy, #14
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	hl, #0x0001
	add	hl, bc
	ld	0 (iy), l
	ld	1 (iy), h
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	add	hl, bc
	ld	(hl), #0x78
	jr	00135$
00134$:
	C$printf.c$253$2_0$47	= .
	.globl	C$printf.c$253$2_0$47
;printf.c:253: else if ((base == 16U) && (flags & FLAGS_UPPERCASE) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
	ld	a, c
	or	a, a
	jr	Z,00129$
	ld	hl, #23+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x20
	jr	Z,00129$
	ld	a, b
	or	a, a
	jr	Z,00129$
	C$printf.c$254$3_0$51	= .
	.globl	C$printf.c$254$3_0$51
;printf.c:254: buf[len++] = 'X';
	ld	iy, #14
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	hl, #0x0001
	add	hl, bc
	ld	0 (iy), l
	ld	1 (iy), h
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	add	hl, bc
	ld	(hl), #0x58
	jr	00135$
00129$:
	C$printf.c$256$2_0$47	= .
	.globl	C$printf.c$256$2_0$47
;printf.c:256: else if ((base == 2U) && (len < PRINTF_NTOA_BUFFER_SIZE)) {
	ld	iy, #17
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x02
	or	a, 1 (iy)
	jr	NZ,00135$
	ld	a, b
	or	a, a
	jr	Z,00135$
	C$printf.c$257$3_0$52	= .
	.globl	C$printf.c$257$3_0$52
;printf.c:257: buf[len++] = 'b';
	dec	iy
	dec	iy
	dec	iy
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	hl, #0x0001
	add	hl, bc
	ld	0 (iy), l
	ld	1 (iy), h
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	add	hl, bc
	ld	(hl), #0x62
00135$:
	C$printf.c$259$2_0$47	= .
	.globl	C$printf.c$259$2_0$47
;printf.c:259: if (len < PRINTF_NTOA_BUFFER_SIZE) {
	ld	iy, #14
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x20
	ld	a, 1 (iy)
	sbc	a, #0x00
	jr	NC,00141$
	C$printf.c$260$3_0$53	= .
	.globl	C$printf.c$260$3_0$53
;printf.c:260: buf[len++] = '0';
	ld	c, 0 (iy)
	ld	e, 1 (iy)
	ld	a, c
	ld	hl, #14
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, e
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	a, c
	ld	hl, #12
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, e
	inc	hl
	adc	a, (hl)
	ld	l, c
	ld	h, a
	ld	(hl), #0x30
00141$:
	C$printf.c$264$1_0$42	= .
	.globl	C$printf.c$264$1_0$42
;printf.c:264: if (len < PRINTF_NTOA_BUFFER_SIZE) {
	ld	iy, #14
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x20
	ld	a, 1 (iy)
	sbc	a, #0x00
	jp	NC, 00151$
	C$printf.c$265$2_0$54	= .
	.globl	C$printf.c$265$2_0$54
;printf.c:265: if (negative) {
	inc	iy
	inc	iy
	bit	0, 0 (iy)
	jr	Z,00148$
	C$printf.c$266$3_0$55	= .
	.globl	C$printf.c$266$3_0$55
;printf.c:266: buf[len++] = '-';
	dec	iy
	dec	iy
	ld	c, 0 (iy)
	ld	e, 1 (iy)
	ld	a, c
	ld	hl, #14
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, e
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	a, c
	ld	hl, #12
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, e
	inc	hl
	adc	a, (hl)
	ld	l, c
	ld	h, a
	ld	(hl), #0x2d
	jr	00151$
00148$:
	C$printf.c$268$2_0$54	= .
	.globl	C$printf.c$268$2_0$54
;printf.c:268: else if (flags & FLAGS_PLUS) {
	ld	hl, #23+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x04
	jr	Z,00145$
	C$printf.c$269$3_0$56	= .
	.globl	C$printf.c$269$3_0$56
;printf.c:269: buf[len++] = '+';  // ignore the space if the '+' exists
	ld	hl, #14
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	e, (hl)
	ld	a, c
	ld	hl, #14
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, e
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	a, c
	ld	hl, #12
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, e
	inc	hl
	adc	a, (hl)
	ld	l, c
	ld	h, a
	ld	(hl), #0x2b
	jr	00151$
00145$:
	C$printf.c$271$2_0$54	= .
	.globl	C$printf.c$271$2_0$54
;printf.c:271: else if (flags & FLAGS_SPACE) {
	ld	hl, #23+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x08
	jr	Z,00151$
	C$printf.c$272$3_0$57	= .
	.globl	C$printf.c$272$3_0$57
;printf.c:272: buf[len++] = ' ';
	ld	hl, #14
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	e, (hl)
	ld	a, c
	ld	hl, #14
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, e
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	a, c
	ld	hl, #12
	add	hl, sp
	add	a, (hl)
	ld	c, a
	ld	a, e
	inc	hl
	adc	a, (hl)
	ld	l, c
	ld	h, a
	ld	(hl), #0x20
00151$:
	C$printf.c$276$1_0$42	= .
	.globl	C$printf.c$276$1_0$42
;printf.c:276: return _out_rev(out, buffer, idx, maxlen, buf, len, width, flags);
	ld	iy, #23
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	iy, #18
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__out_rev
	ld	iy, #16
	add	iy, sp
	ld	sp, iy
	C$printf.c$277$1_0$42	= .
	.globl	C$printf.c$277$1_0$42
;printf.c:277: }
	pop	af
	C$printf.c$277$1_0$42	= .
	.globl	C$printf.c$277$1_0$42
	XFprintf$_ntoa_format$0$0	= .
	.globl	XFprintf$_ntoa_format$0$0
	ret
	Fprintf$_ntoa_long$0$0	= .
	.globl	Fprintf$_ntoa_long$0$0
	C$printf.c$281$1_0$59	= .
	.globl	C$printf.c$281$1_0$59
;printf.c:281: static size_t _ntoa_long(out_fct_type out, char* buffer, size_t idx, size_t maxlen, unsigned long value, bool negative, unsigned long base, unsigned int prec, unsigned int width, unsigned int flags)
;	---------------------------------
; Function _ntoa_long
; ---------------------------------
__ntoa_long:
	ld	hl, #-38
	add	hl, sp
	ld	sp, hl
	C$printf.c$284$2_0$59	= .
	.globl	C$printf.c$284$2_0$59
;printf.c:284: size_t len = 0U;
	ld	bc, #0x0000
	C$printf.c$287$1_0$59	= .
	.globl	C$printf.c$287$1_0$59
;printf.c:287: if (!value) {
	ld	iy, #48
	add	iy, sp
	ld	a, 3 (iy)
	or	a, 2 (iy)
	or	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00102$
	C$printf.c$288$2_0$60	= .
	.globl	C$printf.c$288$2_0$60
;printf.c:288: flags &= ~FLAGS_HASH;
	ld	iy, #61
	add	iy, sp
	ld	a, 0 (iy)
	and	a, #0xef
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
00102$:
	C$printf.c$292$1_0$59	= .
	.globl	C$printf.c$292$1_0$59
;printf.c:292: if (!(flags & FLAGS_PRECISION) || value) {
	ld	hl, #61+1
	add	hl, sp
	ld	a, (hl)
	and	a, #0x04
	jr	Z,00121$
	ld	iy, #48
	add	iy, sp
	ld	a, 3 (iy)
	or	a, 2 (iy)
	or	a, 1 (iy)
	or	a, 0 (iy)
	jp	Z, 00108$
	C$printf.c$293$1_0$59	= .
	.globl	C$printf.c$293$1_0$59
;printf.c:293: do {
00121$:
	ld	hl, #61+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x20
	ld	iy, #32
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), #0x00
	ld	hl, #0
	add	hl, sp
	inc	iy
	inc	iy
	ld	0 (iy), l
	ld	1 (iy), h
	ld	bc, #0x0000
00104$:
	C$printf.c$294$1_0$59	= .
	.globl	C$printf.c$294$1_0$59
;printf.c:294: const char digit = (char)(value % base);
	push	bc
	ld	iy, #55
	add	iy, sp
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	iy, #54
	add	iy, sp
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__modulong
	pop	af
	pop	af
	pop	af
	pop	af
	ex	de, hl
	pop	bc
	C$printf.c$295$3_0$62	= .
	.globl	C$printf.c$295$3_0$62
;printf.c:295: buf[len++] = digit < 10 ? '0' + digit : (flags & FLAGS_UPPERCASE ? 'A' : 'a') + digit - 10;
	ld	hl, #36
	add	hl, sp
	ld	iy, #34
	add	iy, sp
	ld	a, 0 (iy)
	add	a, c
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, b
	inc	hl
	ld	(hl), a
	inc	bc
	ld	a, e
	xor	a, #0x80
	sub	a, #0x8a
	jr	NC,00112$
	ld	a, e
	add	a, #0x30
	jr	00113$
00112$:
	ld	hl, #32+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z,00114$
	ld	hl, #0x0041
	jr	00115$
00114$:
	ld	hl, #0x0061
00115$:
	ld	a, l
	add	a, e
	add	a, #0xf6
00113$:
	ld	iy, #36
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	(hl), a
	C$printf.c$296$1_0$59	= .
	.globl	C$printf.c$296$1_0$59
;printf.c:296: value /= base;
	push	bc
	ld	iy, #55
	add	iy, sp
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	iy, #54
	add	iy, sp
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__divulong
	pop	af
	pop	af
	pop	af
	pop	af
	pop	bc
	ld	iy, #48
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	2 (iy), e
	ld	3 (iy), d
	C$printf.c$297$2_0$61	= .
	.globl	C$printf.c$297$2_0$61
;printf.c:297: } while (value && (len < PRINTF_NTOA_BUFFER_SIZE));
	ld	a, 3 (iy)
	or	a, 2 (iy)
	or	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00122$
	ld	a, c
	sub	a, #0x20
	ld	a, b
	sbc	a, #0x00
	jp	C, 00104$
00122$:
00108$:
	C$printf.c$300$1_0$59	= .
	.globl	C$printf.c$300$1_0$59
;printf.c:300: return _ntoa_format(out, buffer, idx, maxlen, buf, len, negative, (unsigned int)base, prec, width, flags);
	ld	hl, #53
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	hl, #0
	add	hl, sp
	ld	iy, #36
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	iy, #61
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	push	de
	ld	hl, #60+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	ld	hl, #47
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	iy, #59
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__ntoa_format
	ld	iy, #21
	add	iy, sp
	ld	sp, iy
	C$printf.c$301$1_0$59	= .
	.globl	C$printf.c$301$1_0$59
;printf.c:301: }
	ld	iy, #38
	add	iy, sp
	ld	sp, iy
	C$printf.c$301$1_0$59	= .
	.globl	C$printf.c$301$1_0$59
	XFprintf$_ntoa_long$0$0	= .
	.globl	XFprintf$_ntoa_long$0$0
	ret
	Fprintf$_vsnprintf$0$0	= .
	.globl	Fprintf$_vsnprintf$0$0
	C$printf.c$577$1_0$64	= .
	.globl	C$printf.c$577$1_0$64
;printf.c:577: static int _vsnprintf(out_fct_type out, char* buffer, const size_t maxlen, const char* format, va_list va)
;	---------------------------------
; Function _vsnprintf
; ---------------------------------
__vsnprintf:
	ld	hl, #-20
	add	hl, sp
	ld	sp, hl
	C$printf.c$580$2_0$64	= .
	.globl	C$printf.c$580$2_0$64
;printf.c:580: size_t idx = 0U;
	xor	a, a
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
	C$printf.c$582$1_0$64	= .
	.globl	C$printf.c$582$1_0$64
;printf.c:582: if (!buffer) {
	ld	iy, #24
	add	iy, sp
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00215$
	C$printf.c$584$2_0$65	= .
	.globl	C$printf.c$584$2_0$65
;printf.c:584: out = _out_null;
	dec	iy
	dec	iy
	ld	0 (iy), #<(__out_null)
	ld	1 (iy), #>(__out_null)
	C$printf.c$587$1_0$64	= .
	.globl	C$printf.c$587$1_0$64
;printf.c:587: while (*format)
00215$:
	ld	hl, #28+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #28+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #14
	add	iy, sp
	ld	1 (iy), a
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	ld	iy, #19
	add	iy, sp
	ld	0 (iy), a
	ld	a, 0 (iy)
	or	a, a
	jp	Z, 00217$
	C$printf.c$590$2_0$66	= .
	.globl	C$printf.c$590$2_0$66
;printf.c:590: if (*format != '%') {
	ld	a, 0 (iy)
	sub	a, #0x25
	jr	Z,00104$
	C$printf.c$592$3_0$67	= .
	.globl	C$printf.c$592$3_0$67
;printf.c:592: out(*format, buffer, idx++, maxlen);
	dec	iy
	dec	iy
	dec	iy
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	0 (iy)
	jr	NZ,00638$
	inc	1 (iy)
00638$:
	ld	iy, #24
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	push	de
	push	bc
	ld	iy, #25
	add	iy, sp
	ld	a, 0 (iy)
	push	af
	inc	sp
	inc	iy
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	C$printf.c$593$3_0$67	= .
	.globl	C$printf.c$593$3_0$67
;printf.c:593: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00215$
	inc	1 (iy)
	C$printf.c$594$3_0$67	= .
	.globl	C$printf.c$594$3_0$67
;printf.c:594: continue;
	jp	00215$
00104$:
	C$printf.c$598$3_0$68	= .
	.globl	C$printf.c$598$3_0$68
;printf.c:598: format++;
	ld	hl, #28
	add	hl, sp
	ld	iy, #14
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$602$2_0$66	= .
	.globl	C$printf.c$602$2_0$66
;printf.c:602: flags = 0U;
	xor	a, a
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
	C$printf.c$603$2_0$66	= .
	.globl	C$printf.c$603$2_0$66
;printf.c:603: do {
00113$:
	C$printf.c$604$3_0$69	= .
	.globl	C$printf.c$604$3_0$69
;printf.c:604: switch (*format) {
	ld	hl, #28+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #28+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	1 (iy), a
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	cp	a,#0x20
	jp	Z,00109$
	cp	a,#0x23
	jp	Z,00110$
	cp	a,#0x2b
	jr	Z,00108$
	cp	a,#0x2d
	jr	Z,00107$
	sub	a, #0x30
	jp	NZ,00111$
	C$printf.c$605$4_0$70	= .
	.globl	C$printf.c$605$4_0$70
;printf.c:605: case '0': flags |= FLAGS_ZEROPAD; format++; n = 1U; break;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x01
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	ld	hl, #28
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
	jp	00114$
	C$printf.c$606$4_0$70	= .
	.globl	C$printf.c$606$4_0$70
;printf.c:606: case '-': flags |= FLAGS_LEFT;    format++; n = 1U; break;
00107$:
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x02
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	ld	hl, #28
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
	jp	00114$
	C$printf.c$607$4_0$70	= .
	.globl	C$printf.c$607$4_0$70
;printf.c:607: case '+': flags |= FLAGS_PLUS;    format++; n = 1U; break;
00108$:
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x04
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	ld	hl, #28
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
	jr	00114$
	C$printf.c$608$4_0$70	= .
	.globl	C$printf.c$608$4_0$70
;printf.c:608: case ' ': flags |= FLAGS_SPACE;   format++; n = 1U; break;
00109$:
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x08
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	ld	hl, #28
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
	jr	00114$
	C$printf.c$609$4_0$70	= .
	.globl	C$printf.c$609$4_0$70
;printf.c:609: case '#': flags |= FLAGS_HASH;    format++; n = 1U; break;
00110$:
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x10
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	ld	hl, #28
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
	jr	00114$
	C$printf.c$610$4_0$70	= .
	.globl	C$printf.c$610$4_0$70
;printf.c:610: default :                                   n = 0U; break;
00111$:
	xor	a, a
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
	C$printf.c$611$2_0$66	= .
	.globl	C$printf.c$611$2_0$66
;printf.c:611: }
00114$:
	C$printf.c$612$2_0$66	= .
	.globl	C$printf.c$612$2_0$66
;printf.c:612: } while (n);
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jp	NZ, 00113$
	C$printf.c$615$2_0$66	= .
	.globl	C$printf.c$615$2_0$66
;printf.c:615: width = 0U;
	xor	a, a
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
	C$printf.c$587$1_0$64	= .
	.globl	C$printf.c$587$1_0$64
;printf.c:587: while (*format)
	ld	hl, #28+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #28+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #14
	add	iy, sp
	ld	1 (iy), a
	C$printf.c$616$1_0$64	= .
	.globl	C$printf.c$616$1_0$64
;printf.c:616: if (_is_digit(*format)) {
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	ld	a, 0 (iy)
	inc	iy
	ld	0 (iy), a
	C$printf.c$183$5_0$113	= .
	.globl	C$printf.c$183$5_0$113
;printf.c:183: return (ch >= '0') && (ch <= '9');
	ld	a, 0 (iy)
	xor	a, #0x80
	sub	a, #0xb0
	jr	C,00122$
	ld	a, #0x39
	sub	a, 0 (iy)
	jp	PO, 00646$
	xor	a, #0x80
00646$:
	jp	M, 00122$
	C$printf.c$617$3_0$71	= .
	.globl	C$printf.c$617$3_0$71
;printf.c:617: width = _atoi(&format);
	ld	hl, #28
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__atoi
	pop	af
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	1 (iy), a
	jp	00123$
00122$:
	C$printf.c$619$2_0$66	= .
	.globl	C$printf.c$619$2_0$66
;printf.c:619: else if (*format == '*') {
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x2a
	jp	NZ,00123$
	C$printf.c$620$3_0$72	= .
	.globl	C$printf.c$620$3_0$72
;printf.c:620: const int w = va_arg(va, int);
	ld	hl, #14
	add	hl, sp
	ld	iy, #30
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x02
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	ld	hl, #14+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #14+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	1 (iy), a
	ld	hl, #18
	add	hl, sp
	ld	iy, #14
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0xfe
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0xff
	inc	hl
	ld	(hl), a
	ld	hl, #18
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	C$printf.c$621$3_0$72	= .
	.globl	C$printf.c$621$3_0$72
;printf.c:621: if (w < 0) {
	bit	7,1 (iy)
	jr	Z,00117$
	C$printf.c$622$4_0$73	= .
	.globl	C$printf.c$622$4_0$73
;printf.c:622: flags |= FLAGS_LEFT;    // reverse padding
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x02
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	C$printf.c$623$4_0$73	= .
	.globl	C$printf.c$623$4_0$73
;printf.c:623: width = (unsigned int)-w;
	ld	hl, #14
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	xor	a, a
	sub	a, (hl)
	ld	0 (iy), a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	inc	iy
	ld	0 (iy), a
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	1 (iy), a
	jr	00118$
00117$:
	C$printf.c$626$4_0$74	= .
	.globl	C$printf.c$626$4_0$74
;printf.c:626: width = (unsigned int)w;
	ld	hl, #14+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #14+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #6
	add	iy, sp
	ld	1 (iy), a
00118$:
	C$printf.c$628$3_0$72	= .
	.globl	C$printf.c$628$3_0$72
;printf.c:628: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00649$
	inc	1 (iy)
00649$:
00123$:
	C$printf.c$632$2_0$66	= .
	.globl	C$printf.c$632$2_0$66
;printf.c:632: precision = 0U;
	xor	a, a
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
	C$printf.c$633$2_0$66	= .
	.globl	C$printf.c$633$2_0$66
;printf.c:633: if (*format == '.') {
	ld	hl, #28+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #28+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	1 (iy), a
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	sub	a, #0x2e
	jp	NZ,00130$
	C$printf.c$634$3_0$75	= .
	.globl	C$printf.c$634$3_0$75
;printf.c:634: flags |= FLAGS_PRECISION;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	0 (iy), a
	ld	a, 1 (iy)
	or	a, #0x04
	ld	1 (iy), a
	C$printf.c$635$3_0$75	= .
	.globl	C$printf.c$635$3_0$75
;printf.c:635: format++;
	ld	hl, #28
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x01
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$587$1_0$64	= .
	.globl	C$printf.c$587$1_0$64
;printf.c:587: while (*format)
	ld	hl, #28+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #28+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	1 (iy), a
	C$printf.c$616$1_0$64	= .
	.globl	C$printf.c$616$1_0$64
;printf.c:616: if (_is_digit(*format)) {
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	inc	iy
	ld	0 (iy), a
	C$printf.c$636$4_0$114	= .
	.globl	C$printf.c$636$4_0$114
;printf.c:636: if (_is_digit(*format)) {
	ld	c, 0 (iy)
	C$printf.c$183$6_0$116	= .
	.globl	C$printf.c$183$6_0$116
;printf.c:183: return (ch >= '0') && (ch <= '9');
	ld	a, c
	xor	a, #0x80
	sub	a, #0xb0
	jr	C,00127$
	ld	a, #0x39
	sub	a, c
	jp	PO, 00652$
	xor	a, #0x80
00652$:
	jp	M, 00127$
	C$printf.c$637$4_0$76	= .
	.globl	C$printf.c$637$4_0$76
;printf.c:637: precision = _atoi(&format);
	ld	hl, #28
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__atoi
	pop	af
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #8
	add	iy, sp
	ld	1 (iy), a
	jp	00130$
00127$:
	C$printf.c$639$3_0$75	= .
	.globl	C$printf.c$639$3_0$75
;printf.c:639: else if (*format == '*') {
	ld	hl, #19+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x2a
	jp	NZ,00130$
	C$printf.c$640$4_0$77	= .
	.globl	C$printf.c$640$4_0$77
;printf.c:640: const int prec = (int)va_arg(va, int);
	ld	iy, #30
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	bc
	inc	bc
	ld	0 (iy), c
	ld	1 (iy), b
	ld	hl, #18
	add	hl, sp
	ld	a, c
	add	a, #0xfe
	ld	(hl), a
	ld	a, b
	adc	a, #0xff
	inc	hl
	ld	(hl), a
	ld	iy, #18
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	ld	a, (hl)
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	C$printf.c$641$4_0$77	= .
	.globl	C$printf.c$641$4_0$77
;printf.c:641: precision = prec > 0 ? (unsigned int)prec : 0U;
	xor	a, a
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00655$
	xor	a, #0x80
00655$:
	jp	P, 00234$
	jr	00235$
00234$:
	xor	a, a
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), a
00235$:
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #8
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #8
	add	iy, sp
	ld	1 (iy), a
	C$printf.c$642$4_0$77	= .
	.globl	C$printf.c$642$4_0$77
;printf.c:642: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00656$
	inc	1 (iy)
00656$:
00130$:
	C$printf.c$647$2_0$66	= .
	.globl	C$printf.c$647$2_0$66
;printf.c:647: switch (*format) {
	ld	hl, #28
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, c
	ld	h, d
	ld	a, (hl)
	cp	a,#0x68
	jr	Z,00134$
	cp	a,#0x6a
	jp	Z,00138$
	cp	a,#0x6c
	jr	Z,00131$
	cp	a,#0x74
	jp	Z,00137$
	sub	a, #0x7a
	jp	Z,00139$
	jp	00141$
	C$printf.c$648$3_0$78	= .
	.globl	C$printf.c$648$3_0$78
;printf.c:648: case 'l' :
00131$:
	C$printf.c$649$3_0$78	= .
	.globl	C$printf.c$649$3_0$78
;printf.c:649: flags |= FLAGS_LONG;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	0 (iy), a
	ld	a, 1 (iy)
	or	a, #0x01
	ld	1 (iy), a
	C$printf.c$650$3_0$78	= .
	.globl	C$printf.c$650$3_0$78
;printf.c:650: format++;
	ld	a, c
	ld	hl, #28
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, d
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$651$3_0$78	= .
	.globl	C$printf.c$651$3_0$78
;printf.c:651: if (*format == 'l') {
	ld	hl, #28
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	e, (hl)
	ld	l, c
	ld	h, e
	ld	a, (hl)
	sub	a, #0x6c
	jp	NZ,00141$
	C$printf.c$652$4_0$79	= .
	.globl	C$printf.c$652$4_0$79
;printf.c:652: flags |= FLAGS_LONG_LONG;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	0 (iy), a
	ld	a, 1 (iy)
	or	a, #0x02
	ld	1 (iy), a
	C$printf.c$653$4_0$79	= .
	.globl	C$printf.c$653$4_0$79
;printf.c:653: format++;
	ld	a, c
	ld	hl, #28
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, e
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$655$3_0$78	= .
	.globl	C$printf.c$655$3_0$78
;printf.c:655: break;
	jp	00141$
	C$printf.c$656$3_0$78	= .
	.globl	C$printf.c$656$3_0$78
;printf.c:656: case 'h' :
00134$:
	C$printf.c$657$3_0$78	= .
	.globl	C$printf.c$657$3_0$78
;printf.c:657: flags |= FLAGS_SHORT;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x80
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	C$printf.c$658$3_0$78	= .
	.globl	C$printf.c$658$3_0$78
;printf.c:658: format++;
	ld	a, c
	ld	hl, #28
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, d
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$659$3_0$78	= .
	.globl	C$printf.c$659$3_0$78
;printf.c:659: if (*format == 'h') {
	ld	hl, #28
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, (bc)
	sub	a, #0x68
	jp	NZ,00141$
	C$printf.c$660$4_0$80	= .
	.globl	C$printf.c$660$4_0$80
;printf.c:660: flags |= FLAGS_CHAR;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x40
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
	C$printf.c$661$4_0$80	= .
	.globl	C$printf.c$661$4_0$80
;printf.c:661: format++;
	inc	bc
	ld	iy, #28
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	C$printf.c$663$3_0$78	= .
	.globl	C$printf.c$663$3_0$78
;printf.c:663: break;
	jr	00141$
	C$printf.c$665$3_0$78	= .
	.globl	C$printf.c$665$3_0$78
;printf.c:665: case 't' :
00137$:
	C$printf.c$666$3_0$78	= .
	.globl	C$printf.c$666$3_0$78
;printf.c:666: flags |= (sizeof(ptrdiff_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	0 (iy), a
	ld	a, 1 (iy)
	or	a, #0x02
	ld	1 (iy), a
	C$printf.c$667$3_0$78	= .
	.globl	C$printf.c$667$3_0$78
;printf.c:667: format++;
	ld	a, c
	ld	hl, #28
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, d
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$668$3_0$78	= .
	.globl	C$printf.c$668$3_0$78
;printf.c:668: break;
	jr	00141$
	C$printf.c$670$3_0$78	= .
	.globl	C$printf.c$670$3_0$78
;printf.c:670: case 'j' :
00138$:
	C$printf.c$671$3_0$78	= .
	.globl	C$printf.c$671$3_0$78
;printf.c:671: flags |= (sizeof(intmax_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	0 (iy), a
	ld	a, 1 (iy)
	or	a, #0x02
	ld	1 (iy), a
	C$printf.c$672$3_0$78	= .
	.globl	C$printf.c$672$3_0$78
;printf.c:672: format++;
	ld	a, c
	ld	hl, #28
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, d
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$673$3_0$78	= .
	.globl	C$printf.c$673$3_0$78
;printf.c:673: break;
	jr	00141$
	C$printf.c$674$3_0$78	= .
	.globl	C$printf.c$674$3_0$78
;printf.c:674: case 'z' :
00139$:
	C$printf.c$675$3_0$78	= .
	.globl	C$printf.c$675$3_0$78
;printf.c:675: flags |= (sizeof(size_t) == sizeof(long) ? FLAGS_LONG : FLAGS_LONG_LONG);
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	ld	0 (iy), a
	ld	a, 1 (iy)
	or	a, #0x02
	ld	1 (iy), a
	C$printf.c$676$3_0$78	= .
	.globl	C$printf.c$676$3_0$78
;printf.c:676: format++;
	ld	a, c
	ld	hl, #28
	add	hl, sp
	add	a, #0x01
	ld	(hl), a
	ld	a, d
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$680$2_0$66	= .
	.globl	C$printf.c$680$2_0$66
;printf.c:680: }
00141$:
	C$printf.c$587$1_0$64	= .
	.globl	C$printf.c$587$1_0$64
;printf.c:587: while (*format)
	ld	hl, #28
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	C$printf.c$616$1_0$64	= .
	.globl	C$printf.c$616$1_0$64
;printf.c:616: if (_is_digit(*format)) {
	ld	a, (hl)
	ld	iy, #15
	add	iy, sp
	ld	0 (iy), a
	C$printf.c$683$2_0$66	= .
	.globl	C$printf.c$683$2_0$66
;printf.c:683: switch (*format) {
	ld	a, 0 (iy)
	sub	a, #0x25
	jp	Z,00212$
	ld	a, 0 (iy)
	sub	a, #0x58
	ld	a, #0x01
	jr	Z,00668$
	xor	a, a
00668$:
	ld	c, a
	or	a, a
	jr	NZ,00148$
	ld	iy, #15
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x62
	jr	Z,00148$
	ld	a, 0 (iy)
	sub	a, #0x63
	jp	Z,00182$
	ld	a, 0 (iy)
	sub	a, #0x64
	jr	Z,00148$
	ld	a, 0 (iy)
	sub	a, #0x69
	jr	Z,00148$
	ld	a, 0 (iy)
	sub	a, #0x6f
	jr	Z,00148$
	ld	a, 0 (iy)
	sub	a, #0x70
	jp	Z,00211$
	ld	a, 0 (iy)
	sub	a, #0x73
	jp	Z,00193$
	ld	a, 0 (iy)
	sub	a, #0x75
	jr	Z,00148$
	ld	a, 0 (iy)
	sub	a, #0x78
	jp	NZ,00213$
	C$printf.c$690$3_0$81	= .
	.globl	C$printf.c$690$3_0$81
;printf.c:690: case 'b' : {
00148$:
	C$printf.c$693$4_0$82	= .
	.globl	C$printf.c$693$4_0$82
;printf.c:693: if (*format == 'x' || *format == 'X') {
	ld	hl, #15+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x78
	jr	Z,00155$
	ld	a, c
	or	a, a
	jr	Z,00156$
00155$:
	C$printf.c$694$5_0$83	= .
	.globl	C$printf.c$694$5_0$83
;printf.c:694: base = 16U;
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), #0x10
	xor	a, a
	ld	1 (iy), a
	jr	00157$
00156$:
	C$printf.c$696$4_0$82	= .
	.globl	C$printf.c$696$4_0$82
;printf.c:696: else if (*format == 'o') {
	ld	iy, #15
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x6f
	jr	NZ,00153$
	C$printf.c$697$5_0$84	= .
	.globl	C$printf.c$697$5_0$84
;printf.c:697: base =  8U;
	inc	iy
	inc	iy
	inc	iy
	ld	0 (iy), #0x08
	xor	a, a
	ld	1 (iy), a
	jr	00157$
00153$:
	C$printf.c$699$4_0$82	= .
	.globl	C$printf.c$699$4_0$82
;printf.c:699: else if (*format == 'b') {
	ld	iy, #15
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, #0x62
	jr	NZ,00150$
	C$printf.c$700$5_0$85	= .
	.globl	C$printf.c$700$5_0$85
;printf.c:700: base =  2U;
	inc	iy
	inc	iy
	inc	iy
	ld	0 (iy), #0x02
	xor	a, a
	ld	1 (iy), a
	jr	00157$
00150$:
	C$printf.c$703$5_0$86	= .
	.globl	C$printf.c$703$5_0$86
;printf.c:703: base = 10U;
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), #0x0a
	xor	a, a
	ld	1 (iy), a
	C$printf.c$704$5_0$86	= .
	.globl	C$printf.c$704$5_0$86
;printf.c:704: flags &= ~FLAGS_HASH;   // no hash for dec format
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	and	a, #0xef
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
00157$:
	C$printf.c$707$4_0$82	= .
	.globl	C$printf.c$707$4_0$82
;printf.c:707: if (*format == 'X') {
	ld	a, c
	or	a, a
	jr	Z,00160$
	C$printf.c$708$5_0$87	= .
	.globl	C$printf.c$708$5_0$87
;printf.c:708: flags |= FLAGS_UPPERCASE;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	or	a, #0x20
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
00160$:
	C$printf.c$683$1_0$64	= .
	.globl	C$printf.c$683$1_0$64
;printf.c:683: switch (*format) {
	ld	hl, #15+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x69
	ld	a, #0x01
	jr	Z,00685$
	xor	a, a
00685$:
	ld	c, a
	C$printf.c$712$4_0$82	= .
	.globl	C$printf.c$712$4_0$82
;printf.c:712: if ((*format != 'i') && (*format != 'd')) {
	bit	0,c
	jr	NZ,00162$
	ld	hl, #15+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x64
	jr	Z,00162$
	C$printf.c$713$5_0$88	= .
	.globl	C$printf.c$713$5_0$88
;printf.c:713: flags &= ~(FLAGS_PLUS | FLAGS_SPACE);
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	and	a, #0xf3
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
00162$:
	C$printf.c$717$4_0$82	= .
	.globl	C$printf.c$717$4_0$82
;printf.c:717: if (flags & FLAGS_PRECISION) {
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	and	a, #0x04
	jr	Z,00165$
	C$printf.c$718$5_0$89	= .
	.globl	C$printf.c$718$5_0$89
;printf.c:718: flags &= ~FLAGS_ZEROPAD;
	ld	iy, #4
	add	iy, sp
	ld	a, 0 (iy)
	and	a, #0xfe
	ld	0 (iy), a
	ld	a, 1 (iy)
	ld	1 (iy), a
00165$:
	C$printf.c$724$1_0$64	= .
	.globl	C$printf.c$724$1_0$64
;printf.c:724: if (flags & FLAGS_LONG_LONG) {
	ld	e, #0x00
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	and	a, #0x02
	ld	d, a
	C$printf.c$722$4_0$82	= .
	.globl	C$printf.c$722$4_0$82
;printf.c:722: if ((*format == 'i') || (*format == 'd')) {
	ld	a, c
	or	a, a
	jr	NZ,00178$
	ld	hl, #15+0
	add	hl, sp
	ld	a, (hl)
	sub	a, #0x64
	jp	NZ,00179$
00178$:
	C$printf.c$724$5_0$90	= .
	.globl	C$printf.c$724$5_0$90
;printf.c:724: if (flags & FLAGS_LONG_LONG) {
	ld	a, d
	or	a, e
	jp	NZ, 00180$
	C$printf.c$732$1_0$64	= .
	.globl	C$printf.c$732$1_0$64
;printf.c:732: idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #10
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #10
	add	iy, sp
	ld	1 (iy), a
	xor	a, a
	ld	2 (iy), a
	ld	3 (iy), a
	C$printf.c$730$5_0$90	= .
	.globl	C$printf.c$730$5_0$90
;printf.c:730: else if (flags & FLAGS_LONG) {
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	rrca
	jp	NC,00167$
	C$printf.c$731$6_0$92	= .
	.globl	C$printf.c$731$6_0$92
;printf.c:731: const long value = va_arg(va, long);
	ld	iy, #30
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x04
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	ld	0 (iy), c
	ld	1 (iy), b
	ld	a, c
	add	a, #0xfc
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	ld	hl, #0x0000
	add	hl, sp
	ex	de, hl
	ld	bc, #0x0004
	ldir
	C$printf.c$732$6_0$92	= .
	.globl	C$printf.c$732$6_0$92
;printf.c:732: idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
	ld	hl, #19
	add	hl, sp
	ld	iy, #0
	add	iy, sp
	ld	a, 3 (iy)
	rlca
	and	a,#0x01
	ld	(hl), a
	xor	a, a
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	ld	a, #0x00
	sbc	a, 2 (iy)
	ld	a, #0x00
	sbc	a, 3 (iy)
	jp	PO, 00691$
	xor	a, #0x80
00691$:
	jp	P, 00236$
	ld	iy, #0
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	ld	e, 2 (iy)
	ld	d, 3 (iy)
	jr	00237$
00236$:
	ld	hl, #0
	add	hl, sp
	xor	a, a
	sub	a, (hl)
	ld	c, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	b, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	e, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	d, a
00237$:
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
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
	inc	iy
	inc	iy
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #29+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	push	bc
	ld	hl, #41
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #33
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	iy, #43
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__ntoa_long
	ld	iy, #23
	add	iy, sp
	ld	sp, iy
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	jp	00180$
00167$:
	C$printf.c$620$1_0$64	= .
	.globl	C$printf.c$620$1_0$64
;printf.c:620: const int w = va_arg(va, int);
	ld	hl, #18
	add	hl, sp
	ld	iy, #30
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x02
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$735$1_0$64	= .
	.globl	C$printf.c$735$1_0$64
;printf.c:735: const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
	ld	hl, #18
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	dec	bc
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x40
	jr	Z,00238$
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	1 (iy), a
	ld	a, c
	rla
	sbc	a, a
	ld	b, a
	jr	00239$
00238$:
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	rlca
	jr	NC,00240$
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	1 (iy), a
	jr	00241$
00240$:
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	1 (iy), a
00241$:
00239$:
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	C$printf.c$736$6_0$93	= .
	.globl	C$printf.c$736$6_0$93
;printf.c:736: idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned int)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
	ld	hl, #19
	add	hl, sp
	ld	a, 1 (iy)
	rlca
	and	a,#0x01
	ld	(hl), a
	xor	a, a
	cp	a, 0 (iy)
	sbc	a, 1 (iy)
	jp	PO, 00694$
	xor	a, #0x80
00694$:
	jp	P, 00242$
	ld	hl, #14
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	jr	00243$
00242$:
	ld	hl, #14
	add	hl, sp
	xor	a, a
	sub	a, (hl)
	ld	c, a
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	ld	b, a
00243$:
	ld	de, #0x0000
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
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
	inc	iy
	inc	iy
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #29+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	push	de
	push	bc
	ld	hl, #41
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #33
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	iy, #43
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__ntoa_long
	ld	iy, #23
	add	iy, sp
	ld	sp, iy
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	jp	00180$
00179$:
	C$printf.c$741$5_0$94	= .
	.globl	C$printf.c$741$5_0$94
;printf.c:741: if (flags & FLAGS_LONG_LONG) {
	ld	a, d
	or	a, e
	jp	NZ, 00180$
	C$printf.c$732$1_0$64	= .
	.globl	C$printf.c$732$1_0$64
;printf.c:732: idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)(value > 0 ? value : 0 - value), value < 0, base, precision, width, flags);
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #12
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #12
	add	iy, sp
	ld	1 (iy), a
	xor	a, a
	ld	2 (iy), a
	ld	3 (iy), a
	C$printf.c$746$5_0$94	= .
	.globl	C$printf.c$746$5_0$94
;printf.c:746: else if (flags & FLAGS_LONG) {
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	rrca
	jp	NC,00173$
	C$printf.c$747$6_0$96	= .
	.globl	C$printf.c$747$6_0$96
;printf.c:747: idx = _ntoa_long(out, buffer, idx, maxlen, va_arg(va, unsigned long), false, base, precision, width, flags);
	ld	iy, #30
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x04
	ld	c, a
	ld	a, 1 (iy)
	adc	a, #0x00
	ld	b, a
	ld	0 (iy), c
	ld	1 (iy), b
	ld	a, c
	add	a, #0xfc
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	l, c
	ld	h, a
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	inc	hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
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
	ld	iy, #18
	add	iy, sp
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	push	bc
	ld	hl, #41
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #33
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	iy, #43
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__ntoa_long
	ld	iy, #23
	add	iy, sp
	ld	sp, iy
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	jp	00180$
00173$:
	C$printf.c$620$1_0$64	= .
	.globl	C$printf.c$620$1_0$64
;printf.c:620: const int w = va_arg(va, int);
	ld	hl, #18
	add	hl, sp
	ld	iy, #30
	add	iy, sp
	ld	a, 0 (iy)
	add	a, #0x02
	ld	(hl), a
	ld	a, 1 (iy)
	adc	a, #0x00
	inc	hl
	ld	(hl), a
	C$printf.c$735$1_0$64	= .
	.globl	C$printf.c$735$1_0$64
;printf.c:735: const int value = (flags & FLAGS_CHAR) ? (char)va_arg(va, int) : (flags & FLAGS_SHORT) ? (short int)va_arg(va, int) : va_arg(va, int);
	ld	hl, #18
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
	dec	bc
	C$printf.c$750$1_0$64	= .
	.globl	C$printf.c$750$1_0$64
;printf.c:750: const unsigned int value = (flags & FLAGS_CHAR) ? (unsigned char)va_arg(va, unsigned int) : (flags & FLAGS_SHORT) ? (unsigned short int)va_arg(va, unsigned int) : va_arg(va, unsigned int);
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x40
	jr	Z,00244$
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	1 (iy), a
	ld	b, #0x00
	jr	00245$
00244$:
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	rlca
	jr	NC,00246$
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	1 (iy), a
	jr	00247$
00246$:
	ld	hl, #18+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #18+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #30
	add	iy, sp
	ld	1 (iy), a
00247$:
00245$:
	C$printf.c$751$6_0$97	= .
	.globl	C$printf.c$751$6_0$97
;printf.c:751: idx = _ntoa_long(out, buffer, idx, maxlen, value, false, base, precision, width, flags);
	ld	de, #0x0000
	ld	iy, #4
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
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
	ld	iy, #18
	add	iy, sp
	ld	l, 2 (iy)
	ld	h, 3 (iy)
	push	hl
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	push	bc
	ld	hl, #41
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #33
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	iy, #43
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__ntoa_long
	ld	iy, #23
	add	iy, sp
	ld	sp, iy
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
00180$:
	C$printf.c$754$4_0$82	= .
	.globl	C$printf.c$754$4_0$82
;printf.c:754: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00215$
	inc	1 (iy)
	C$printf.c$755$4_0$82	= .
	.globl	C$printf.c$755$4_0$82
;printf.c:755: break;
	jp	00215$
	C$printf.c$776$3_0$81	= .
	.globl	C$printf.c$776$3_0$81
;printf.c:776: case 'c' : {
00182$:
	C$printf.c$777$5_0$98	= .
	.globl	C$printf.c$777$5_0$98
;printf.c:777: unsigned int l = 1U;
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
	C$printf.c$779$4_0$98	= .
	.globl	C$printf.c$779$4_0$98
;printf.c:779: if (!(flags & FLAGS_LEFT)) {
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x02
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), #0x00
	C$printf.c$592$1_0$64	= .
	.globl	C$printf.c$592$1_0$64
;printf.c:592: out(*format, buffer, idx++, maxlen);
	ld	hl, #24+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #12
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #24+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #12
	add	iy, sp
	ld	1 (iy), a
	C$printf.c$779$4_0$98	= .
	.globl	C$printf.c$779$4_0$98
;printf.c:779: if (!(flags & FLAGS_LEFT)) {
	inc	iy
	inc	iy
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	NZ,00187$
	C$printf.c$780$1_0$64	= .
	.globl	C$printf.c$780$1_0$64
;printf.c:780: while (l++ < width) {
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), #0x01
	xor	a, a
	ld	1 (iy), a
00183$:
	ld	iy, #18
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	0 (iy)
	jr	NZ,00699$
	inc	1 (iy)
00699$:
	ld	hl, #6
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jr	NC,00327$
	C$printf.c$781$6_0$100	= .
	.globl	C$printf.c$781$6_0$100
;printf.c:781: out(' ', buffer, idx++, maxlen);
	dec	iy
	dec	iy
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	0 (iy)
	jr	NZ,00700$
	inc	1 (iy)
00700$:
	ld	hl, #26
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	hl, #16
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #29
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	jr	00183$
00327$:
00187$:
	C$printf.c$785$4_0$98	= .
	.globl	C$printf.c$785$4_0$98
;printf.c:785: out((char)va_arg(va, int), buffer, idx++, maxlen);
	ld	iy, #16
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	0 (iy)
	jr	NZ,00701$
	inc	1 (iy)
00701$:
	ld	iy, #30
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	de
	inc	de
	ld	0 (iy), e
	ld	1 (iy), d
	dec	de
	dec	de
	ld	a, (de)
	ld	d, a
	ld	hl, #26
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	hl, #16
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	push	de
	inc	sp
	ld	hl, #29
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	C$printf.c$787$4_0$98	= .
	.globl	C$printf.c$787$4_0$98
;printf.c:787: if (flags & FLAGS_LEFT) {
	ld	iy, #14
	add	iy, sp
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00192$
	C$printf.c$788$1_0$64	= .
	.globl	C$printf.c$788$1_0$64
;printf.c:788: while (l++ < width) {
	inc	iy
	inc	iy
	ld	c, 0 (iy)
	ld	b, 1 (iy)
00188$:
	ld	hl, #6
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	jr	NC,00328$
	inc	0 (iy)
	jr	NZ,00702$
	inc	1 (iy)
00702$:
	C$printf.c$789$6_0$102	= .
	.globl	C$printf.c$789$6_0$102
;printf.c:789: out(' ', buffer, idx++, maxlen);
	ld	e, c
	ld	d, b
	inc	bc
	push	bc
	ld	hl, #28
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	push	de
	ld	hl, #18
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #31
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	bc
	jr	00188$
00328$:
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
00192$:
	C$printf.c$792$4_0$98	= .
	.globl	C$printf.c$792$4_0$98
;printf.c:792: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00215$
	inc	1 (iy)
	C$printf.c$793$4_0$98	= .
	.globl	C$printf.c$793$4_0$98
;printf.c:793: break;
	jp	00215$
	C$printf.c$796$3_0$81	= .
	.globl	C$printf.c$796$3_0$81
;printf.c:796: case 's' : {
00193$:
	C$printf.c$797$4_0$103	= .
	.globl	C$printf.c$797$4_0$103
;printf.c:797: const char* p = va_arg(va, char*);
	ld	iy, #30
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	bc
	inc	bc
	ld	0 (iy), c
	ld	1 (iy), b
	dec	bc
	dec	bc
	ld	l, c
	ld	h, b
	ld	a, (hl)
	ld	iy, #10
	add	iy, sp
	ld	0 (iy), a
	inc	hl
	ld	a, (hl)
	ld	1 (iy), a
	C$printf.c$798$5_0$117	= .
	.globl	C$printf.c$798$5_0$117
;printf.c:798: unsigned int l = _strnlen_s(p, precision ? precision : (size_t)-1);
	dec	iy
	dec	iy
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00248$
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	jr	00249$
00248$:
	ld	bc, #0xffff
00249$:
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
	ld	hl, #10+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #10+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #14
	add	iy, sp
	ld	1 (iy), a
	ld	hl, #10
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
00224$:
	ld	a, (de)
	or	a, a
	jr	Z,00220$
	ld	hl, #18
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	hl, #18
	add	hl, sp
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	ld	a, b
	or	a, c
	jr	Z,00220$
	inc	de
	jr	00224$
00220$:
	ld	hl, #14
	add	hl, sp
	ld	a, e
	sub	a, (hl)
	ld	e, a
	ld	a, d
	inc	hl
	sbc	a, (hl)
	ld	d, a
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
	C$printf.c$800$4_0$103	= .
	.globl	C$printf.c$800$4_0$103
;printf.c:800: if (flags & FLAGS_PRECISION) {
	ld	iy, #12
	add	iy, sp
	ld	0 (iy), #0x00
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	and	a, #0x04
	ld	iy, #12
	add	iy, sp
	ld	1 (iy), a
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00195$
	C$printf.c$801$5_0$104	= .
	.globl	C$printf.c$801$5_0$104
;printf.c:801: l = (l < precision ? l : precision);
	ld	hl, #8
	add	hl, sp
	ld	a, e
	sub	a, (hl)
	ld	a, d
	inc	hl
	sbc	a, (hl)
	jr	C,00251$
	ld	hl, #8
	add	hl, sp
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
00251$:
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), e
	ld	1 (iy), d
00195$:
	C$printf.c$803$4_0$103	= .
	.globl	C$printf.c$803$4_0$103
;printf.c:803: if (!(flags & FLAGS_LEFT)) {
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	and	a, #0x02
	ld	iy, #14
	add	iy, sp
	ld	0 (iy), a
	ld	1 (iy), #0x00
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jp	NZ, 00323$
	C$printf.c$804$1_0$64	= .
	.globl	C$printf.c$804$1_0$64
;printf.c:804: while (l++ < width) {
00196$:
	ld	iy, #18
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	0 (iy)
	jr	NZ,00704$
	inc	1 (iy)
00704$:
	ld	hl, #6
	add	hl, sp
	ld	a, c
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jr	NC,00330$
	C$printf.c$805$6_0$106	= .
	.globl	C$printf.c$805$6_0$106
;printf.c:805: out(' ', buffer, idx++, maxlen);
	dec	iy
	dec	iy
	ld	a, 0 (iy)
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #16+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	ld	1 (iy), a
	ld	iy, #16
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00705$
	inc	1 (iy)
00705$:
	ld	iy, #24
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #6
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	push	bc
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #29
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	jp	00196$
	C$printf.c$809$1_0$64	= .
	.globl	C$printf.c$809$1_0$64
;printf.c:809: while ((*p != 0) && (!(flags & FLAGS_PRECISION) || precision--)) {
00330$:
00323$:
	ld	hl, #16+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #16+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #4
	add	iy, sp
	ld	1 (iy), a
	ld	hl, #10+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #10+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #16
	add	iy, sp
	ld	1 (iy), a
00203$:
	ld	hl, #16
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ld	a, (hl)
	ld	iy, #3
	add	iy, sp
	ld	0 (iy), a
	ld	a, 0 (iy)
	or	a, a
	jp	Z, 00331$
	ld	hl, #12+1
	add	hl, sp
	ld	a, (hl)
	dec	hl
	or	a, (hl)
	jr	Z,00204$
	ld	iy, #8
	add	iy, sp
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
	ld	hl, #8
	add	hl, sp
	ld	a, (hl)
	add	a, #0xff
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00331$
00204$:
	C$printf.c$810$5_0$107	= .
	.globl	C$printf.c$810$5_0$107
;printf.c:810: out(*(p++), buffer, idx++, maxlen);
	ld	iy, #4
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	0 (iy)
	jr	NZ,00706$
	inc	1 (iy)
00706$:
	ld	hl, #24
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	iy, #16
	add	iy, sp
	inc	0 (iy)
	jr	NZ,00707$
	inc	1 (iy)
00707$:
	ld	hl, #26
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	push	de
	push	bc
	ld	hl, #9+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #29
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	jp	00203$
00331$:
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #16
	add	iy, sp
	ld	1 (iy), a
	C$printf.c$813$4_0$103	= .
	.globl	C$printf.c$813$4_0$103
;printf.c:813: if (flags & FLAGS_LEFT) {
	dec	iy
	dec	iy
	ld	a, 1 (iy)
	or	a, 0 (iy)
	jr	Z,00210$
	C$printf.c$814$1_0$64	= .
	.globl	C$printf.c$814$1_0$64
;printf.c:814: while (l++ < width) {
	ld	hl, #4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
00206$:
	ld	hl, #6
	add	hl, sp
	ld	iy, #18
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	jr	NC,00332$
	inc	0 (iy)
	jr	NZ,00708$
	inc	1 (iy)
00708$:
	C$printf.c$815$6_0$109	= .
	.globl	C$printf.c$815$6_0$109
;printf.c:815: out(' ', buffer, idx++, maxlen);
	dec	iy
	dec	iy
	ld	0 (iy), c
	ld	1 (iy), b
	inc	bc
	ld	iy, #24
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	push	bc
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #20
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	push	de
	ld	a, #0x20
	push	af
	inc	sp
	ld	hl, #31
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	pop	bc
	jr	00206$
00332$:
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), c
	ld	1 (iy), b
00210$:
	C$printf.c$818$4_0$103	= .
	.globl	C$printf.c$818$4_0$103
;printf.c:818: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00215$
	inc	1 (iy)
	C$printf.c$819$4_0$103	= .
	.globl	C$printf.c$819$4_0$103
;printf.c:819: break;
	jp	00215$
	C$printf.c$822$3_0$81	= .
	.globl	C$printf.c$822$3_0$81
;printf.c:822: case 'p' : {
00211$:
	C$printf.c$824$4_0$110	= .
	.globl	C$printf.c$824$4_0$110
;printf.c:824: flags |= FLAGS_ZEROPAD | FLAGS_UPPERCASE;
	ld	hl, #4+0
	add	hl, sp
	ld	a, (hl)
	or	a, #0x21
	ld	iy, #18
	add	iy, sp
	ld	0 (iy), a
	ld	hl, #4+1
	add	hl, sp
	ld	a, (hl)
	ld	iy, #18
	add	iy, sp
	ld	1 (iy), a
	C$printf.c$832$4_0$110	= .
	.globl	C$printf.c$832$4_0$110
;printf.c:832: idx = _ntoa_long(out, buffer, idx, maxlen, (unsigned long)((uintptr_t)va_arg(va, void*)), false, 16U, precision, width, flags);
	ld	iy, #30
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	bc
	inc	bc
	ld	0 (iy), c
	ld	1 (iy), b
	dec	bc
	dec	bc
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	de, #0x0000
	ld	hl, #18
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #0x0004
	push	hl
	ld	hl, #12
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x0010
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	push	bc
	ld	hl, #41
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	hl, #33
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	ld	iy, #43
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	call	__ntoa_long
	ld	iy, #23
	add	iy, sp
	ld	sp, iy
	ld	iy, #16
	add	iy, sp
	ld	0 (iy), l
	ld	1 (iy), h
	C$printf.c$836$4_0$110	= .
	.globl	C$printf.c$836$4_0$110
;printf.c:836: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00215$
	inc	1 (iy)
	C$printf.c$837$4_0$110	= .
	.globl	C$printf.c$837$4_0$110
;printf.c:837: break;
	jp	00215$
	C$printf.c$840$3_0$81	= .
	.globl	C$printf.c$840$3_0$81
;printf.c:840: case '%' :
00212$:
	C$printf.c$841$3_0$81	= .
	.globl	C$printf.c$841$3_0$81
;printf.c:841: out('%', buffer, idx++, maxlen);
	ld	iy, #16
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	0 (iy)
	jr	NZ,00711$
	inc	1 (iy)
00711$:
	ld	iy, #24
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	push	de
	push	bc
	ld	a, #0x25
	push	af
	inc	sp
	ld	hl, #29
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	C$printf.c$842$3_0$81	= .
	.globl	C$printf.c$842$3_0$81
;printf.c:842: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00215$
	inc	1 (iy)
	C$printf.c$843$3_0$81	= .
	.globl	C$printf.c$843$3_0$81
;printf.c:843: break;
	jp	00215$
	C$printf.c$845$3_0$81	= .
	.globl	C$printf.c$845$3_0$81
;printf.c:845: default :
00213$:
	C$printf.c$846$3_0$81	= .
	.globl	C$printf.c$846$3_0$81
;printf.c:846: out(*format, buffer, idx++, maxlen);
	ld	iy, #16
	add	iy, sp
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	inc	0 (iy)
	jr	NZ,00713$
	inc	1 (iy)
00713$:
	ld	iy, #24
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	push	bc
	push	de
	ld	hl, #21+0
	add	hl, sp
	ld	a, (hl)
	push	af
	inc	sp
	ld	hl, #29
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	C$printf.c$847$3_0$81	= .
	.globl	C$printf.c$847$3_0$81
;printf.c:847: format++;
	ld	iy, #28
	add	iy, sp
	inc	0 (iy)
	jp	NZ,00215$
	inc	1 (iy)
	C$printf.c$849$1_0$64	= .
	.globl	C$printf.c$849$1_0$64
;printf.c:849: }
	jp	00215$
00217$:
	C$printf.c$853$1_0$64	= .
	.globl	C$printf.c$853$1_0$64
;printf.c:853: out((char)0, buffer, idx < maxlen ? idx : maxlen - 1U, maxlen);
	ld	hl, #26
	add	hl, sp
	ld	iy, #16
	add	iy, sp
	ld	a, 0 (iy)
	sub	a, (hl)
	ld	a, 1 (iy)
	inc	hl
	sbc	a, (hl)
	jr	NC,00252$
	ld	c, 0 (iy)
	ld	b, 1 (iy)
	jr	00253$
00252$:
	ld	hl, #26
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	bc
00253$:
	ld	iy, #24
	add	iy, sp
	ld	e, 0 (iy)
	ld	d, 1 (iy)
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	ld	hl, #29
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	call	___sdcc_call_hl
	ld	hl, #7
	add	hl, sp
	ld	sp, hl
	C$printf.c$856$1_0$64	= .
	.globl	C$printf.c$856$1_0$64
;printf.c:856: return (int)idx;
	ld	hl, #16
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	C$printf.c$857$1_0$64	= .
	.globl	C$printf.c$857$1_0$64
;printf.c:857: }
	ld	iy, #20
	add	iy, sp
	ld	sp, iy
	C$printf.c$857$1_0$64	= .
	.globl	C$printf.c$857$1_0$64
	XFprintf$_vsnprintf$0$0	= .
	.globl	XFprintf$_vsnprintf$0$0
	ret
	G$printf_$0$0	= .
	.globl	G$printf_$0$0
	C$printf.c$862$1_0$121	= .
	.globl	C$printf.c$862$1_0$121
;printf.c:862: int printf_(const char* format, ...)
;	---------------------------------
; Function printf_
; ---------------------------------
_printf_::
	dec	sp
	C$printf.c$865$2_0$122	= .
	.globl	C$printf.c$865$2_0$122
;printf.c:865: va_start(va, format);
	ld	hl, #3+1+1
	add	hl, sp
	ex	de, hl
	C$printf.c$867$1_1$123	= .
	.globl	C$printf.c$867$1_1$123
;printf.c:867: const int ret = _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
	ld	hl, #0
	add	hl, sp
	ld	c, l
	ld	b, h
	push	de
	ld	hl, #5
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	push	hl
	ld	hl, #0xffff
	push	hl
	push	bc
	ld	hl, #__out_char
	push	hl
	call	__vsnprintf
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	C$printf.c$869$1_1$123	= .
	.globl	C$printf.c$869$1_1$123
;printf.c:869: return ret;
	C$printf.c$870$1_1$121	= .
	.globl	C$printf.c$870$1_1$121
;printf.c:870: }
	inc	sp
	C$printf.c$870$1_1$121	= .
	.globl	C$printf.c$870$1_1$121
	XG$printf_$0$0	= .
	.globl	XG$printf_$0$0
	ret
	G$sprintf_$0$0	= .
	.globl	G$sprintf_$0$0
	C$printf.c$873$1_1$126	= .
	.globl	C$printf.c$873$1_1$126
;printf.c:873: int sprintf_(char* buffer, const char* format, ...)
;	---------------------------------
; Function sprintf_
; ---------------------------------
_sprintf_::
	C$printf.c$876$2_0$127	= .
	.globl	C$printf.c$876$2_0$127
;printf.c:876: va_start(va, format);
	ld	hl,#4+1+1
	add	hl,sp
	C$printf.c$877$1_1$128	= .
	.globl	C$printf.c$877$1_1$128
;printf.c:877: const int ret = _vsnprintf(_out_buffer, buffer, (size_t)-1, format, va);
	push	hl
	ld	iy, #6
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #0xffff
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #__out_buffer
	push	hl
	call	__vsnprintf
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	C$printf.c$879$1_1$128	= .
	.globl	C$printf.c$879$1_1$128
;printf.c:879: return ret;
	C$printf.c$880$1_1$126	= .
	.globl	C$printf.c$880$1_1$126
;printf.c:880: }
	C$printf.c$880$1_1$126	= .
	.globl	C$printf.c$880$1_1$126
	XG$sprintf_$0$0	= .
	.globl	XG$sprintf_$0$0
	ret
	G$snprintf_$0$0	= .
	.globl	G$snprintf_$0$0
	C$printf.c$883$1_1$131	= .
	.globl	C$printf.c$883$1_1$131
;printf.c:883: int snprintf_(char* buffer, size_t count, const char* format, ...)
;	---------------------------------
; Function snprintf_
; ---------------------------------
_snprintf_::
	C$printf.c$886$2_0$132	= .
	.globl	C$printf.c$886$2_0$132
;printf.c:886: va_start(va, format);
	ld	hl,#6+1+1
	add	hl,sp
	C$printf.c$887$1_1$133	= .
	.globl	C$printf.c$887$1_1$133
;printf.c:887: const int ret = _vsnprintf(_out_buffer, buffer, count, format, va);
	push	hl
	ld	iy, #8
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #__out_buffer
	push	hl
	call	__vsnprintf
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	C$printf.c$889$1_1$133	= .
	.globl	C$printf.c$889$1_1$133
;printf.c:889: return ret;
	C$printf.c$890$1_1$131	= .
	.globl	C$printf.c$890$1_1$131
;printf.c:890: }
	C$printf.c$890$1_1$131	= .
	.globl	C$printf.c$890$1_1$131
	XG$snprintf_$0$0	= .
	.globl	XG$snprintf_$0$0
	ret
	G$vprintf_$0$0	= .
	.globl	G$vprintf_$0$0
	C$printf.c$893$1_1$136	= .
	.globl	C$printf.c$893$1_1$136
;printf.c:893: int vprintf_(const char* format, va_list va)
;	---------------------------------
; Function vprintf_
; ---------------------------------
_vprintf_::
	dec	sp
	C$printf.c$896$1_0$136	= .
	.globl	C$printf.c$896$1_0$136
;printf.c:896: return _vsnprintf(_out_char, buffer, (size_t)-1, format, va);
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	iy, #5
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #0xffff
	push	hl
	push	de
	ld	hl, #__out_char
	push	hl
	call	__vsnprintf
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	C$printf.c$897$1_0$136	= .
	.globl	C$printf.c$897$1_0$136
;printf.c:897: }
	inc	sp
	C$printf.c$897$1_0$136	= .
	.globl	C$printf.c$897$1_0$136
	XG$vprintf_$0$0	= .
	.globl	XG$vprintf_$0$0
	ret
	G$vsnprintf_$0$0	= .
	.globl	G$vsnprintf_$0$0
	C$printf.c$900$1_0$138	= .
	.globl	C$printf.c$900$1_0$138
;printf.c:900: int vsnprintf_(char* buffer, size_t count, const char* format, va_list va)
;	---------------------------------
; Function vsnprintf_
; ---------------------------------
_vsnprintf_::
	C$printf.c$902$1_0$138	= .
	.globl	C$printf.c$902$1_0$138
;printf.c:902: return _vsnprintf(_out_buffer, buffer, count, format, va);
	ld	iy, #8
	add	iy, sp
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	dec	iy
	dec	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #__out_buffer
	push	hl
	call	__vsnprintf
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	C$printf.c$903$1_0$138	= .
	.globl	C$printf.c$903$1_0$138
;printf.c:903: }
	C$printf.c$903$1_0$138	= .
	.globl	C$printf.c$903$1_0$138
	XG$vsnprintf_$0$0	= .
	.globl	XG$vsnprintf_$0$0
	ret
	G$fctprintf$0$0	= .
	.globl	G$fctprintf$0$0
	C$printf.c$906$1_0$141	= .
	.globl	C$printf.c$906$1_0$141
;printf.c:906: int fctprintf(void (*out)(char character, void* arg), void* arg, const char* format, ...)
;	---------------------------------
; Function fctprintf
; ---------------------------------
_fctprintf::
	push	af
	push	af
	C$printf.c$909$2_0$142	= .
	.globl	C$printf.c$909$2_0$142
;printf.c:909: va_start(va, format);
	ld	hl,#10+1+1
	add	hl,sp
	ld	c,l
	ld	b,h
	C$printf.c$910$2_0$143	= .
	.globl	C$printf.c$910$2_0$143
;printf.c:910: const out_fct_wrap_type out_fct_wrap = { out, arg };
	ld	hl, #0
	add	hl, sp
	ld	iy, #6
	add	iy, sp
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	iy
	inc	iy
	ld	a, 0 (iy)
	ld	(hl), a
	inc	hl
	ld	a, 1 (iy)
	ld	(hl), a
	C$printf.c$911$1_1$143	= .
	.globl	C$printf.c$911$1_1$143
;printf.c:911: const int ret = _vsnprintf(_out_fct, (char*)(uintptr_t)&out_fct_wrap, (size_t)-1, format, va);
	push	bc
	inc	iy
	inc	iy
	ld	l, 0 (iy)
	ld	h, 1 (iy)
	push	hl
	ld	hl, #0xffff
	push	hl
	push	de
	ld	hl, #__out_fct
	push	hl
	call	__vsnprintf
	ld	iy, #10
	add	iy, sp
	ld	sp, iy
	C$printf.c$913$1_1$143	= .
	.globl	C$printf.c$913$1_1$143
;printf.c:913: return ret;
	C$printf.c$914$1_1$141	= .
	.globl	C$printf.c$914$1_1$141
;printf.c:914: }
	pop	af
	pop	af
	C$printf.c$914$1_1$141	= .
	.globl	C$printf.c$914$1_1$141
	XG$fctprintf$0$0	= .
	.globl	XG$fctprintf$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
