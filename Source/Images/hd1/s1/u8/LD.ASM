;
; THIS ROUTINE IS USED BY "LOAD.FOR", ALL IT DOES IS TO
; DOUBLE THE NUMBER SENT TO IT
;
; NUMBER IS PASSED IN DE FROM FORTRAN PROGRAM AND RESULT
; IS PASSED BACK IN HL TO FORTRAN PROGRAM
;
	ORG	8000H
;
	PUSH	D	;NUMBER	FROM FORTRAN PROGRAM
	POP	H	;GET IT	TO HL
	DAD	H	;HL*2
	RET		;RETURN	IT
FORTRAN PROGRAM
;
	ORG	8000H
;
	PUSH	D	;NUMBER	FROM FORTRAN PROGRAM
	POP