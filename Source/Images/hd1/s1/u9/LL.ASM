; This program doesn't actually do anything but exit however, it
; can demonstrate how to use the user display facility of DSD80.
; This source can be assembler with LASM.

f$doc	equ	0		; display one character
f$dhb	equ	1		; display hex byte
f$dhw	equ	2		; display hex word
f$dsa	equ	3		; display symbolic address
f$anl	equ	4		; advance to new line
f$ehv	equ	5		; enable highlighted video
f$dhv	equ	6		; disable highlighted video
f$dzi	equ	7		; disassemble z80 instruction
f$eel	equ	8		; erase to end of line

WARM	equ	0		; warm boot address


	org	100h

START	jmp	WARM		;				0100h
DSD	jmp	0		; DSD's function processor	0103h
	jmp	UDD		; User Display Driver		0106h
	jmp	BLL		; Backward Link List - Meta B	0109h
	jmp	FLL		; Forward Link List - Meta F	010Ch


current	dw	header

header	dw	first
	dw	last
	db	'Header element',0

first	dw	second
	dw	header
	db	'First element',0

second	dw	last
	dw	first
	db	'Second element',0

last	dw	header
	dw	second
	db	'Last element',0


;;	ANL - Advance New Line
;
ANL	mvi	c,f$anl
	call	ISF
	ret


;;	BLL - Backward Link List
;
BLL	lhld	current
	inx	h
	inx	h
	mov	a,m		; link operation
	inx	h
	mov	h,m
	mov	l,a
	shld	current
	ret


;;	DDE - Display (DE)
;
;	entry	DE	word address
;	exit	DE+1
;	uses	HL
;
DDE	ldax	d		; HL = (DE)
	mov	l,a
	inx	d
	ldax	d
	mov	h,a
	inx	d
	call	DSA		; Display Symbolic Address
	ret


;;	DIM - Display Inline Message
;
DIM	pop	h
DIM1	mov	a,m
	inx	h
	ana	a
	jz	DIM2		;  if end of string
	call	DOC		; Display One Character
	jmp	DIM1
DIM2	pchl			; Return to right after message


;;	DOC - Display One Character
;
;	entry	A	character
;
DOC	mvi	c,f$doc
	call	ISF
	ret


;;	DSA - Display Symbolic Address
;
;	entry	HL	address
;	uses	BC,PSW
;
DSA	mvi	c,f$dsa
	call	ISF
	ret


;;	EEL - Erase to End of Line
;
EEL	mvi	c,f$eel
	call	ISF
	ret


;;	FLL - Forward Link List
;
FLL	lhld	current
	mov	a,m		; link operation
	inx	h
	mov	h,m
	mov	l,a
	shld	current
	ret


;;	ISF - Issue Screen Function
;
ISF	push	d
	push	h
	call	DSD
	pop	h
	pop	d
	ret


;;	UDD - User Display Driver
;
UDD	call	DIM		; Current element
	db	'Current:       ',0
	lhld	current
	call	DSA
	xchg
	call	EEL
	call	ANL
	call	DIM		; Forward link
	db	'Forward Link:  ',0
	call	DDE
	call	EEL
	call	ANL
	call	DIM		; Backward link
	db	'Backward Link: ',0
	call	DDE
	call	EEL
	call	ANL
	call	ANL
	mvi	a,'"'
	call	DOC

UDD1	ldax	d		; Display text from current list element
	inx	d
	ana	a
	jz	UDD2		;  if end of text
	call	DOC
	jmp	UDD1

UDD2	mvi	a,'"'
	call	DOC
	call	EEL
	ret

	end	START
