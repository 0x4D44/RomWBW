      SUBROUTINE KILL$(A$)
      INTEGER A,BC,DE,HL, DRV
      BYTE FCB$(35)
      BYTE A$(1), B$(32)
      EQUIVALENCE (B$(1),FCB$(2))
      CALL DEFD$(FCB$)
      CALL DEFD$(B$)
      DRV=NFORM$(B$,A$,1)
      DE=LOC$(FCB$)
      FCB$(1)=DRV
      BC=19
      CALL CPM$(A,BC,DE,HL)
      RETURN
      END
μμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμinley, William	25
Roosevelt, Theodore	26
Taft, William H.	27
Wilson, Woodrow		28
Harding, Warren G.	29
Coolidge, Calvin	30