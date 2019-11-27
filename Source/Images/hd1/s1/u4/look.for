      FUNCTION LOOK$(A$)
      INTEGER A,BC,DE,HL, DRV
      BYTE FCB$(35)
      BYTE A$(1), B$(32)
      EQUIVALENCE (B$(1),FCB$(2))
      CALL DEFD$(B$)
      CALL DEFD$(FCB$)
      A=0
      BC=26
      DE=128
      HL=0
      CALL CPM$(A,BC,DE,HL)
      DRV=NFORM$(B$,A$,1)
      DE=LOC$(FCB$)
      FCB$(1)=DRV
      BC=17
      CALL CPM$(A,BC,DE,HL)
      LOOK$=A
      RETURN
      END
μμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμ follows:

STR80.DOC	The STRING/80 Bit documentation file.  This file, the one
		you are now viewing, lists each of the file