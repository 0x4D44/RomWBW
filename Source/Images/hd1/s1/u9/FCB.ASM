; This program demonstrates the user display feature of DSD80 for
; displaying the contents of an FCB.  This source can be assembled
; with LASM.

; To make a function call within your display driver, load one of the
; the following values into register C, any argument in register
; A or HL, then call or issue the appropriate restart vector.
;
f$doc	equ	0		; display one character		in A
f$dhb	equ	1		; display hex byte		in A
f$dhw	equ	2		; display hex word		in HL
f$dsa	equ	3		; display symbolic address	in HL
f$anl	equ	4		; advance to new line
f$ehv	equ	5		; enable highlighted video
f$dhv	equ	6		; disable highlighted video
f$dzi	equ	7		; disassemble z80 instruction	adr in HL
f$eel	equ	8		; erase to end of line

WARM	equ	0		; warm boot address
BDOS	equ	5		; bdos entry

closef	equ	16		; close file
openf	equ	15		; open file
reads	equ	20		; read sequential
setdma	equ	26		; set dma address

dfcb	equ	5Ch		; default file control block
dmaadr	equ	80h		; default disk buffer

	org	100h

START	jmp	READ		;				[0100h]

; The following absolute entry points, 103h, 106h & 109h, are patched
; into DSD's overlay file as the entry points for the User Display
; Driver, Meta B Command and Meta F Command respectively.

DSD	jmp	0		; DSD function processor	[0103h]
	jmp	UDD		; User Display Driver		[0106h]
	jmp	RETX		; Meta B command (disabled)	[0109h]
	jmp	RETX		; Meta F command (disabled)	[010Ch]

FCB	dw	DFCB


;;	ANL - Advance New Line
;
ANL	mvi	c,f$anl
	call	ISF
	ret


;;	DAB - Display A Byte
;
;	entry	DE	mem adr
;	exit	DE	DE+1
;	uses	BC,PSW
;
DAB	ldax	d
	inx	d
	call	DHB
	ret


;;	DAW - Display A Word
;
DAW	ldax	d
	inx	d
	mov	l,a
	ldax	d
	inx	d
	mov	h,a
	call	DHW
	ret


;;	DHB - Display Hex Byte
;
DHB	mvi	c,f$dhb
	call	ISF
	ret


;;	DHW - Display Hex Word
;
DHW	mvi	c,f$dhw
	call	ISF
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


;;	DYN - Display Yes or No
;
DYN	ldax	d
	inx	d
	ana	a
	jm	DYN1		; if attribute bit set
	call	DIM
	db	' NO   ',0
	ret
DYN1	call	DIM
	db	' YES  ',0
	ret


;;	EEL - Erase to End of Line
;
EEL	mvi	c,f$eel
	call	ISF
	call	ANL		; and while you're at it, advance to next line
	ret


;;	ISF - Issue Screen Function
;
ISF	push	d
	push	h
	call	DSD
	pop	h
	pop	d
	ret


;;	READ
;
READ	lhld	BDOS+1		; set our stack up in high memory
	sphl
	mvi	c,SetDMA	; Set DMA adr
	lxi	d,DMAadr
	call	BDOS
	mvi	c,openf		; open file
	lhld	FCB
	xchg
	call	BDOS
	inr	a
	jz	WARM		;  if file not found
	lhld	FCB		; clear current record
	lxi	d,32
	dad	d
	mvi	m,0
READ1	mvi	c,reads		; read sequential
	lhld	FCB
	xchg
	call	BDOS
	ana	a
	jz	READ1		;  if successful then continue reading
	mvi	c,closef
	lhld	FCB
	xchg
	call	BDOS
	jmp	WARM


;;	RETX
;
RETX	ret


;;	UDD - User Display Driver
;
; This is the routine which actually drives the user display within
; DSD.  DSD calls this routine during its display refresh cycle
; which occurs after executing any command.  You must refresh the
; entire display including blanks at the end of the line.  DSD's
; display optimizer will only display the characters which have
; changed.  The user display area is the same size as the memory
; display, 9 full lines.  There are no provisions for random
; cursor positioning within the user display; you begin on the first
; line and display characters in sequence to the last line.  ALL
; CHARACTER OUTPUT MUST USE THE AVAILABLE DSD FUNCTIONS.  ANY
; BDOS OR BIOS CALLS ATTEMPTED FOR CHARACTER OUTPUT WILL CONFUSE
; THE DISPLAY.
;
UDD	call	DIM		; Current element
	db	'Drive:             ',0
	lhld	FCB
	xchg
	ldax	d
	inx	d
	ana	a
	jnz	UDD1		; if not current
	call	DIM
	db	'[current]',0
	jmp	UDD3
UDD1	cpi	16+1
	jc	UDD2		; if legal drive spec
	call	DHB
	jmp	UDD3
UDD2	adi	'A'-1
	call	DOC
	mvi	a,':'
	call	DOC
UDD3	call	EEL
	call	DIM
	db	'File name:         ',0
	mvi	a,8+3
UDD4	push	psw
	ldax	d
	inx	d
	call	DOC
	pop	psw
	dcr	a
	jnz	UDD4
	call	EEL
	call	DIM
	db	'Current extent:    ',0
	call	DAB
	call	EEL
	call	DIM
	db	'Reserved:          ',0
	call	DAB
	mvi	a,','
	call	DAB
	call	EEL
	call	DIM
	db	'Records used:      ',0
	call	DAB
	call	EEL
	call	DIM
	db	'Allocation blocks: ',0
	mvi	a,8
UDD6	push	psw
	call	DAW
	mvi	a,' '
	call	DOC
	pop	psw
	dcr	a
	jnz	UDD6
	call	EEL
	call	DIM
	db	'Sequential record: ',0
	call	DAB
	call	EEL
	call	DIM
	db	'Random record:     ',0
	inx	d
	inx	d
	call	DAB
	dcx	d
	dcx	d
	dcx	d
	call	DAW
	call	EEL
	call	DIM
	db	'Read Only:',0
	lhld	FCB
	lxi	d,9
	dad	d
	xchg
	call	DYN
	call	DIM
	db	'System:',0
	call	DYN
	call	DIM
	db	'Modified:',0
	call	DYN
	call	EEL
	ret


	end	START
