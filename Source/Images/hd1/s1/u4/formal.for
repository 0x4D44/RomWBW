      PROGRAM FORMAL

      BYTE WORK$(80),FILEN$(80),FILEO$(80),MESS$(80)
      BYTE NEWF$(80), BAKF$(80), KILF$(80), SHIFT$(80)
      BYTE LABEL$(80), CONT$(80), STATE$(80), IDEND$(80)
      BYTE NAMX$(8), NAMX(40,50,1)
      BYTE BLANK,TAB,NEOS,DEOS
      BYTE LPARAN,RPARAN,EQUALS
      INTEGER DLY,LABELS(2,500)
      INTEGER LXS(50), SX(50)
      INTEGER RSTAT, TYPE

C  Initialization Routines

      CALL DEFD$(WORK$)
      CALL DEFD$(FILEN$)
      CALL DEFD$(FILEO$)
      CALL DEFD$(MESS$)
      CALL DEFD$(NEWF$)
      CALL DEFD$(BAKF$)
      CALL DEFD$(KILF$)
      CALL DEFD$(SHIFT$)
      CALL DEFD$(LABEL$)
      CALL DEFD$(CONT$)
      CALL DEFD$(STATE$)
      CALL DEFD$(IDEND$)
      CALL DEFT$(NAMX$,NAMX,40,50,1)
      CALL MAKE$(NAMX$,2,1,'MAIN@')
      LFLAG=0
      DLY=0
      LX=0
      LXX=0
      LEOS=0
      NEOS=0
      DEOS=64
      BLANK=32
      TAB=9
      LPARAN=40
      RPARAN=41
      EQUALS=61

      NX=1
      LXS(NX)=0
      NX=2

C  Print program Identification Message

      WRITE(5,990)
      WRITE(5,970)
      WRITE(5,980)
      WRITE(5,1010)
      WRITE(5,990)

C  Print the STRING/80 Version number

      WRITE(5,10)
10    FORMAT(1X,25X,'using')
      WRITE(5,990)
      CALL VER$(WORK$)
      J=LEN$(WORK$)
      WRITE(5,20)(WORK$(I),I=1,J)
20    FORMAT(1X,80A1)
      WRITE(5,990)
      WRITE(5,990)

C  Retrieve file name parameter

      CALL CMD$(WORK$)

C  Save code to return to DEMO if applicable

      RSTAT=MATCH$(WORK$,'#@',1)

C  Strip leading blanks off name, if present

30    CONTINUE
      CALL ADJUST(WORK$)

C  Force extension to be .FOR, no others are valid

40    CONTINUE
      I=MATCH$(WORK$,'.@',1)
      IF(I.GT.0)GO TO 50
      CALL MAKE$(LABEL$,WORK$)
      GO TO 60

50    CONTINUE
      I=I-1
      CALL LEFT$(LABEL$,WORK$,I)

60    CONTINUE
      CALL MAKE$(CONT$,LABEL$)
      CALL MAKE$(STATE$,LABEL$)
      CALL MERGE$(LABEL$,'.FOR@')
      CALL MERGE$(CONT$,'.$$$@')
      CALL MERGE$(STATE$,'.BAK@')
      CALL MAKE$(WORK$,LABEL$)

C  Check to see if file is present

      J=LEN$(WORK$)
      IF(J.LT.2)GO TO 100
70    CONTINUE
      I=LOOK$(WORK$)
      IF(I.GE.0)GO TO 130

C  Since file name not found, must be invalid

      WRITE(5,80)
80    FORMAT(1X,'*** FILE NOT FOUND ***')
      I=LEN$(WORK$)
      WRITE(5,90)(WORK$(J),J=1,I)
90    FORMAT(1X,80A1)

C  Prompt operator for valid file name paraameter

100   CONTINUE
      WRITE(5,110)
110   FORMAT(1X,'Enter file name to be listed - ')
      READ(5,120)WORK$
120   FORMAT(80A1)
      CALL STRIP$(WORK$)
      CALL UPPER$(WORK$)
      CALL ADJUST(WORK$)
      CALL CLASSF(WORK$,TYPE)
      IF(TYPE.EQ.14)GO TO 960
      GO TO 40

C  Set up backup and work file names

130   CONTINUE
      CALL MAKE$(NEWF$,LABEL$)
      CALL MERGE$(NEWF$,'=@')
      CALL MERGE$(NEWF$,CONT$)
      CALL MAKE$(BAKF$,STATE$)
      CALL MERGE$(BAKF$,'=@')
      CALL MERGE$(BAKF$,LABEL$)
      CALL MAKE$(KILF$,STATE$)

C  Format valid file name for opening file

      K=NFORM$(FILEN$,WORK$,1)
      CALL OPEN(7,FILEN$,K)
      K=NFORM$(FILEO$,CONT$,1)
      CALL OPEN(8,FILEO$,K)

      LEOS=IEOS$(NEOS)

C------------------------------------------
C  PASS I - Build valid Label Table
C------------------------------------------

C  Read records from disk

140   CONTINUE
      READ(7,150,END=330)WORK$
150   FORMAT(80A1)
      CALL STRIP$(WORK$)

C  Replace all TAB's with blanks

      CALL TABOUT(WORK$)

C  Separate the input string into its manageable pieces

      CALL PIECES(WORK$,LABEL$,CONT$,STATE$,IDEND$)

C  Remove all leading blanks found in the statement area

      CALL ADJUST(STATE$)

C  Classify the statement into the various types

      CALL CLASSF(STATE$,TYPE)

C  Is first character a 'C' ?

      IF(WORK$(1).EQ.67)GO TO 160

C  No, then is this a labeled statement

      N=1
      CALL LFIND(LABEL$,N,LABEL)
      IF(LABEL.EQ.0)GO TO 160

C  Yes, set label flag, save

      LX=LX+1
      LXX=LXX+1
      LABELS(1,LXX)=LABEL
      LABELS(2,LXX)=LX*10
      LFLAG=1

C  Write out copy of first pass items for debug purposes

160   CONTINUE
C       CALL PUT$(WORK$)

C  If comment, no special checks

      IF(WORK$(1).EQ.67)GO TO 140

C  Check for END of Program or Subroutine

      IF(TYPE.NE.14)GO TO 170
      LEOS=IEOS$(DEOS)
      I=MATCH$(WORK$,'END@',1)
      LEOS=IEOS$(NEOS)
      GO TO 180

C  Save program and subroutine names as they are encountered

170   CONTINUE
      IF(TYPE.EQ.11)GO TO 210
      IF(TYPE.EQ.12)GO TO 220
      IF(TYPE.EQ.17)GO TO 230

C  Not special condition, read next line

      GO TO 140

C  Reset labels if end of subroutine or program

180   CONTINUE
      LXS(NX)=LX
      IF(NX.EQ.2)GO TO 190
      SX(NX)=SX(NX-1)+LXS(NX-1)
      GO TO 200

190   CONTINUE
      SX(NX)=1
200   CONTINUE
      NX=NX+1
      LX=0
      GO TO 140

C  Position I for location of key word

210   CONTINUE
      LEOS=IEOS$(DEOS)
      I=MATCH$(WORK$,'PROGRAM@',1)
      LEOS=IEOS$(NEOS)
      GO TO 240

220   CONTINUE
      LEOS=IEOS$(DEOS)
      I=MATCH$(WORK$,'SUBROUTINE@',1)
      LEOS=IEOS$(NEOS)
      GO TO 240

230   CONTINUE
      LEOS=IEOS$(DEOS)
      I=MATCH$(WORK$,'FUNCTION@',1)
      LEOS=IEOS$(NEOS)
      GO TO 240

C  Save program/subroutine names in stack


240   CONTINUE
      LENS=LEN$(WORK$)

250   CONTINUE
      IF(I.GT.LENS)GO TO 320
      IF(WORK$(I).EQ.BLANK)GO TO 260
      I=I+1
      GO TO 250

260   CONTINUE
      IF(I.GT.LENS)GO TO 320
      IF(WORK$(I).EQ.BLANK)GO TO 270
      GO TO 280

270   CONTINUE
      I=I+1
      GO TO 260

280   CONTINUE
      ILFT=I

290   CONTINUE
      IF(I.EQ.LENS)GO TO 300
      IF(WORK$(I).EQ.BLANK)GO TO 310
      I=I+1
      GO TO 290

300   CONTINUE
      I=I+1

310   CONTINUE
      IRTE=I
      INBR=IRTE-ILFT
      CALL MID$(SHIFT$,WORK$,ILFT,INBR)
      CALL MAKE$(NAMX$,NX,1,SHIFT$)
      GO TO 140

320   CONTINUE
      LEOS=IEOS$(DEOS)
      CALL MAKE$(NAMX$,NX,1,'UNKNOWN@')
      LEOS=IEOS$(NEOS)
      GO TO 140

C  End of PASS I - Print a table of lablels found

330   CONTINUE
      LEOS=IEOS$(DEOS)
      IF(LX.LE.0)GO TO 360
      LXS(NX)=LX
      IF(NX.EQ.2)GO TO 340
      SX(NX)=SX(NX-1)+LXS(NX-1)
      GO TO 350
340   CONTINUE
      SX(NX)=1
350   CONTINUE
      LXS(1)=NX
      GO TO 370

360   CONTINUE
      LXS(1)=NX-1

370   CONTINUE
      NX=LXS(1)
      WRITE(5,990)
      N=NX-1
      WRITE(5,380)N
380   FORMAT(1X,'ROUTINES ',I6)
      WRITE(5,990)
      WRITE(5,390)
390   FORMAT(1X,'LABELS IDENTIFIED')
      WRITE(5,990)

      DO 430 K=2,NX
      CALL MAKE$(SHIFT$,NAMX$,K,1)
      LY=SX(K)
      LX=LXS(K)
      LXX=SX(K)+LXS(K)-1

      WRITE(5,990)
      CALL PUT$(SHIFT$)
      WRITE(5,990)


      IF (LXX.LE.LY) GO TO 410

      WRITE(5,400)((LABELS(I,J),I=1,2),J=LY,LXX)
400   FORMAT(1X,I5,2X,I5,10X,I5,2X,I5,10X,I5,2X,I5,10X,I5,2X,I5)
410   WRITE(5,990)
      WRITE(5,420)LX
420   FORMAT(1X,'TOTAL ',I6)

430   CONTINUE
      WRITE(5,990)

C-----------------------------------------------------
C  PASS II - Replace old labels with new labels
C-----------------------------------------------------

      WRITE(5,440)
440   FORMAT(1X,'PHASE II')
      WRITE(5,990)
      WRITE(5,990)

      REWIND 7

C  Set up to process the proper number of programs and subroutines

      NX=2

C  Read records from disk for PASS II processing

      LEOS=IEOS$(NEOS)
450   CONTINUE
      READ(7,150,END=950)WORK$
      CALL STRIP$(WORK$)
      IFIRST=0

C  Replace all TAB's with blanks

      CALL TABOUT(WORK$)

C  Is current line a comment line?

      IF(WORK$(1).EQ.67)GO TO 890

C  Is current line a blank line?

      LENS=LEN$(WORK$)
      IF(LENS.EQ.0)GO TO 910
      DO 460 I=1,LENS
      IF(WORK$(I).NE.BLANK)GO TO 470
460   CONTINUE
      GO TO 910

C  Break into manageable pieces

470   CONTINUE
      CALL PIECES(WORK$,LABEL$,CONT$,STATE$,IDEND$)

C  Remove all leading statement blanks

      CALL ADJUST(STATE$)

C  Is there a label in the margin

      N=1
      CALL LFIND(LABEL$,N,LABEL)
      IF(LABEL.EQ.0)GO TO 540

C  Lookup old label value for reassignment

480   CONTINUE
      IS=SX(NX)
      LX=SX(NX)+LXS(NX)-1
      DO 490 I=IS,LX
      IF(LABEL.EQ.LABELS(1,I))GO TO 520
490   CONTINUE

500   CONTINUE
      LEOS=IEOS$(DEOS)
510   CONTINUE
      CALL PUT$('PASS II FATAL ERROR - Untabulated label@')
      STOP 101

C  Label found, replace with new

520   CONTINUE
      LABPOS=I
      ENCODE(LABEL$,530)LABELS(2,LABPOS)
530   FORMAT(I5)
      LABEL$(6)=0
      CALL LABLEF(LABEL$)

C  Margin label processing completed
C  Check for Continuation line

540   CONTINUE
      LEOS=IEOS$(DEOS)
      I=IDEN$(CONT$,' @')
      LEOS=IEOS$(NEOS)
      IF(I.EQ.0)GO TO 550
      LEOS=IEOS$(DEOS)
      I=IDEN$(CONT$,'0@')
      LEOS=IEOS$(NEOS)
      IF(I.EQ.0)GO TO 550
      IF(TYPE.EQ.0)GO TO 800
      GO TO 570

C  Reset type code before search

550   CONTINUE
      TYPE=0

C  Look for statements that can possible contain labels

      CALL CLASSF(STATE$,TYPE)

C  If not a candidate, write it out

      IF(TYPE.EQ.0)GO TO 800
      IF(TYPE.EQ.2)GO TO 640
      IF(TYPE.GE.11)GO TO 800

C  Check candidate for presents of a label
C  If no possible label go direct to write out

      N=1
560   CONTINUE
      CALL LFIND(STATE$,N,LABEL)
      IF(LABEL.EQ.0)GO TO 800

C  Potential label present, go to statement-type routines
C  to validate if really a valid label..not just number.

570   CONTINUE
      GO TO (590,640,690,720,760,770,780,790),TYPE
      GO TO 800

C  GO TO statements

580   CONTINUE
      IF(LABEL.EQ.0)GO TO 800
590   CONTINUE
      IS=SX(NX)
      LX=SX(NX)+LXS(NX)-1
      DO 600 I=IS,LX
      IF(LABEL.EQ.LABELS(1,I))GO TO 610
600   CONTINUE
C       Note:Error
      GO TO 510

610   CONTINUE
      NEWL=LABELS(2,I)
620   CONTINUE
      CALL EXCHG(STATE$,N,NEWL)
630   CONTINUE
      CALL LFIND(STATE$,N,LABEL)
      GO TO 580

C  IF statements

640   CONTINUE
      I3=0
      I4=0
      I5=0
      LENS=LEN$(STATE$)

C  Find right most parameter

      DO 670 I=1,LENS
      IF(STATE$(I).EQ.LPARAN)GO TO 650
      IF(STATE$(I).EQ.RPARAN)GO TO 660
      GO TO 670
650   CONTINUE
      IF(I4.EQ.0)I5=I
      IF(I4.EQ.0)I4=1
      I3=I3+1
      GO TO 670
660   CONTINUE
      I3=I3-1
      IF(I3.EQ.0)GO TO 680
670   CONTINUE

C  Cannot find matching parameter, fatal syntax error

      CALL PUT$('FATAL ERROR - Cannot find matching parameter@')
      STOP 102

C  Check to see if residual statement can contain a label

680   CONTINUE
      N=I
      I5=LENS-N
      CALL RIGHT$(MESS$,STATE$,I5)
      CALL CLASSF(MESS$,TYPE)
      GO TO 560



C  DO statements

690   CONTINUE
      IS=SX(NX)
      LX=SX(NX)+LXS(NX)-1
      DO 700 I=IS,LX
      IF(LABEL.EQ.LABELS(1,I))GO TO 710
700   CONTINUE
      GO TO 800

710   CONTINUE
      NEWL=LABELS(2,I)
      CALL EXCHG(STATE$,N,NEWL)
      GO TO 800

C  READ statements

720   CONTINUE
      LEOS=IEOS$(DEOS)
      N=MATCH$(STATE$,',@',1)
      LEOS=IEOS$(NEOS)
730   CONTINUE
      IF(N.EQ.0)GO TO 800
      CALL LFIND(STATE$,N,LABEL)
      IF(LABEL.EQ.0)GO TO 800
      IS=SX(NX)
      LX=SX(NX)+LXS(NX)-1
      DO 740 I=IS,LX
      IF(LABEL.EQ.LABELS(1,I))GO TO 750
740   CONTINUE
      GO TO 800
750   CONTINUE
      NEWL=LABELS(2,I)
      CALL EXCHG(STATE$,N,NEWL)
      GO TO 730


C  WRITE statements

760   CONTINUE
      GO TO 720

C  ENCODE statements

770   CONTINUE
      GO TO 720

C  DECODE statements

780   CONTINUE
      GO TO 720

C  ASSIGN statements

790   CONTINUE
      GO TO 690

C  Reassemble pieces before writing out

800   CONTINUE
      LENS=LEN$(LABEL$)
      IF(LENS.GE.6)GO TO 870
      IF(LENS.LE.0)GO TO 810
      GO TO (820,830,840,850,860),LENS
810   CONTINUE
      LEOS=IEOS$(DEOS)
      CALL MAKE$(WORK$,'     @')
      LEOS=IEOS$(NEOS)
      GO TO 880
820   CONTINUE
      CALL MAKE$(WORK$,LABEL$)
      LEOS=IEOS$(DEOS)
      CALL MERGE$(WORK$,'    @')
      LEOS=IEOS$(NEOS)
      GO TO 880
830   CONTINUE
      CALL MAKE$(WORK$,LABEL$)
      LEOS=IEOS$(DEOS)
      CALL MERGE$(WORK$,'   @')
      LEOS=IEOS$(NEOS)
      GO TO 880
840   CONTINUE
      CALL MAKE$(WORK$,LABEL$)
      LEOS=IEOS$(DEOS)
      CALL MERGE$(WORK$,'  @')
      LEOS=IEOS$(NEOS)
      GO TO 880
850   CONTINUE
      CALL MAKE$(WORK$,LABEL$)
      LEOS=IEOS$(DEOS)
      CALL MERGE$(WORK$,' @')
      LEOS=IEOS$(NEOS)
      GO TO 880
860   CONTINUE
      CALL MAKE$(WORK$,LABEL$)
      GO TO 880
870   CONTINUE
      LEOS=IEOS$(DEOS)
      CALL MAKE$(WORK$,'*****@')
      LEOS=IEOS$(NEOS)
880   CONTINUE
      CALL MERGE$(WORK$,CONT$)
      CALL MERGE$(WORK$,STATE$)

C  Write out record

890   CONTINUE
      IFIRST=0
      LENS=LEN$(WORK$)
      IF(LENS.EQ.0)GO TO 910

C  Write out line of one or more characters

      WRITE(8,900)(WORK$(I),I=1,LENS)
900   FORMAT(1X,80A1)
      GO TO 930

C  Put out an empty line

910   CONTINUE
      WRITE(8,920)
920   FORMAT(1X)
      GO TO 930

C  Test for END of Program or Subroutine

930   CONTINUE
      CALL PUT$(WORK$)
      IF(TYPE.NE.14)GO TO 450

C  Reset table for next routine

940   CONTINUE
      TYPE=0
      NX=NX+1
      IF(NX.GT.LXS(1))GO TO 950
      GO TO 450

C  End of PASS II Routine

950   CONTINUE
      LEOS=IEOS$(DEOS)
      ENDFILE 7
      ENDFILE 8
      CALL KILL$(KILF$)
      CALL REN$(BAKF$)
      CALL REN$(NEWF$)

C  Write closing message

960   CONTINUE
      WRITE(5,990)
      WRITE(5,990)
970   FORMAT(1X,12X,'The FORMAL Bit (tm) - Version 1.15')
980   FORMAT(1X,12X,'Copyright (C) 1980    Key Bits Inc.')
990   FORMAT(1X,1X)
1000  FORMAT(1X,12X, '        Goodbye . . .')
1010  FORMAT(1X,14X,'May, 1980    -    Miami, FL, USA')

      WRITE(5,1000)
      WRITE(5,990)
      WRITE(5,990)
      WRITE(5,990)
      WRITE(5,990)

C  Check for return to calling program

      IF(RSTAT.GT.0)GO TO 1020
      GO TO 1040

C  Chain to calling program if applicable

1020  CONTINUE
      CALL CHAIN$('DEMO.COM@')
      WRITE(5,1030)
1030  FORMAT(1X,'*** DEMO.COM NOT FOUND - RETURNED TO SYSTEM ***')

C  Otherwise, return to operating system

1040  CONTINUE      END

C----------------------------------------------------
C  SUPPORT - Support routines for FORMAL program
C----------------------------------------------------

C  EXCHG - Exchange old label with new label.  The position
C  immediately following the old label to be replaced is
C  passed in N.  The new label (integer) is passed in NEWL.
C  The string containing the label is STATE$.

      SUBROUTINE EXCHG(STATE$,N,NEWL)
      BYTE STATE$(80), NLAB$(80)
      BYTE LEF$(80),RIG$(80)
      LENS=LEN$(STATE$)
      K=LENS-N+1
      CALL RIGHT$(RIG$,STATE$,K)
      DO 10 I=1,6
      J=N-I
      K=STATE$(J)
      IF((K.LE.57).AND.(K.GE.48))GO TO 10
      GO TO 20
10    CONTINUE
      CALL PUT$('PASS II FATAL ERROR - Front of label not found@')
      STOP 102

20    CONTINUE
      CALL LEFT$(LEF$,STATE$,J)
      ENCODE(NLAB$,30)NEWL
30    FORMAT(I5)
      NLAB$(6)=0
      CALL LABLEF(NLAB$)
      CALL MAKE$(STATE$,LEF$)
      CALL MERGE$(STATE$,NLAB$)
      CALL MERGE$(STATE$,RIG$)
      RETURN
      END

C  LFIND - Label find, locate a statement label.  The string WORK$
C  is searched starting in position N1.  If a label candidate is
C  found it is returned in N2.  N2 contains a zero if no candidate
C  is found (so does N1).  If a candidate is found, the position
C  following the label is returned in N1.

      SUBROUTINE LFIND(WORK$,N1,N2)
      BYTE WORK$(80),H$(80)
      BYTE TAB, BLANK
      H$(1)=0
      N0=N1
      N1=0
      N2=0
      L=0
      TAB=9
      BLANK=32
      IF(N0.NE.1)GO TO 40
      IF(WORK$(1).EQ.67)GO TO 60
      DO 20 I=1,5
      IF(WORK$(I).EQ.BLANK)GO TO 10
      IF(WORK$(I).EQ.TAB)GO TO 30
      L=1
10    CONTINUE
20    CONTINUE
30    CONTINUE
      IF(L.EQ.0)GO TO 60
40    CONTINUE
      IF(N0.LT.1)GO TO 60
      IF(N0.GT.80)GO TO 60
      NUM=NVAL$(H$,WORK$,N0)
      DECODE(H$,50)ANUM
50    FORMAT(10X,F14.5)
      N2=ANUM
      N1=NUM
60    CONTINUE
      RETURN
      END

C  LABLEF - Label left, moves any text found in the string WORK$
C  to the left, left justifing the text in position one.

      SUBROUTINE LABLEF(WORK$)
      BYTE WORK$(80),FILEN$(80),BLANK
      BLANK=32
      FILEN$(1)=0
      DO 10 I=1,5
      IF(WORK$(I).NE.BLANK)GO TO 20
10    CONTINUE
20    CONTINUE
      J=6-I
      CALL RIGHT$(FILEN$,WORK$,J)
      CALL MAKE$(WORK$,FILEN$)
      RETURN
      END

C  TABOUT - Removes all TAB's from an input line and replaces them with the
C  appropriate number of blanks necessary to produce the same results as if
C  TAB's were located at screen positions 9,17,25,33,41,49,65 and 73.  Also
C  truncates all data beyond 80 characters found AFTER the expansion has
C  taken place.

      SUBROUTINE TABOUT(WORK$)
      BYTE WORK$(80),E$(80)
      K=1
      DO 130 I=1,80
      IF(WORK$(I).NE.9)GO TO 120
      IF(K.GE.9)GO TO 10
      L=9-K
      GO TO 100
10    CONTINUE
      IF(K.GE.17)GO TO 20
      L=17-K
      GO TO 100
20    CONTINUE
      IF(K.GE.25)GO TO 30
      L=25-K
      GO TO 100
30    CONTINUE
      IF(K.GE.33)GO TO 40
      L=33-K
      GO TO 100
40    CONTINUE
      IF(K.GE.41)GO TO 50
      L=41-K
      GO TO 100
50    CONTINUE
      IF(K.GE.49)GO TO 60
      L=49-K
      GO TO 100
60    CONTINUE
      IF(K.GE.57)GO TO 70
      L=57-K
      GO TO 100
70    CONTINUE
      IF(K.GE.65)GO TO 80
      L=65-K
      GO TO 100
80    CONTINUE
      IF(K.GE.73)GO TO 90
      L=73-K
      GO TO 100
90    CONTINUE
      L=79-K
100   CONTINUE
      DO 110 J=1,L
      E$(K)=32
      K=K+1
      IF(K.GT.80)GO TO 140
110   CONTINUE
      GO TO 130
120   CONTINUE
      E$(K)=WORK$(I)
      K=K+1
      IF(K.GT.80)GO TO 140
130   CONTINUE
140   CONTINUE
      IF(K.GT.80)K=80
      E$(K)=0
      CALL MAKE$(WORK$,E$)
      RETURN
      END

C  PIECES - Break the passed string, WORK$, into its label field, LABEL$, its
C  continuation field, CONT$, its statement field, STATE$, and its identi-
C  fication field, IDEND$.

      SUBROUTINE PIECES(WORK$,LABEL$,CONT$,STATE$,IDEND$)
      BYTE WORK$(80),LABEL$(80),CONT$(80),STATE$(80),IDEND$(80)

      CONT$(1)=0
      STATE$(1)=0
      IDEND$(1)=0
      J=5
      I=LEN$(WORK$)
      IF (J.GT.I) J=I
      CALL LEFT$(LABEL$,WORK$,J)
      IF (I.LT.6) GO TO 10
      CALL MID$(CONT$,WORK$,6,1)
      J=66
      IF (I.LT.66) J=I
      CALL MID$(STATE$,WORK$,7,J)
      IF (I.LT.73) GO TO 10
      J=I-72
      CALL MID$(IDEND$,WORK$,73,J)
10    RETURN
      END


C  ADJUST - Eliminates all leading blanks.

      SUBROUTINE ADJUST(WORK$)
      BYTE WORK$(80), FILEN$(80)
      CALL DEFD$(FILEN$)
      J=LEN$(WORK$)
      DO 10 I=1,J
      IF(WORK$(I).NE.32)GO TO 20
10    CONTINUE
      CALL DEFD$(WORK$)
      RETURN

20    CONTINUE
      K=J-I+1
      CALL RIGHT$(FILEN$,WORK$,K)
      CALL MAKE$(WORK$,FILEN$)
      RETURN
      END

C  CLASSF - Returns a classification code in the integer TYPE for each string
C  passed to it in string WORK$.  All statements that allow labels within them
C  are assigned values between 1-9.  Statements requiring special processing
C  when encountered, but do not allow labels within them are assigned values
C  between 11-19.  All other statements are assigned a zero (0) value.  The
C  statement MUST begin in position 1 of WORK$.  Assignments are as follows:

C       1=GO TO                 11=PROGRAM
C       2=IF                    12=SUBROUTINE
C       3=DO                    13=CONTINUE
C       4=READ                  14=END
C       5=WRITE
C       6=ENCODE
C       7=DECODE                17=FUNCTION
C       8=ASSIGN


      SUBROUTINE CLASSF(WORK$,TYPE)
      BYTE WORK$(80), E$(80)
      INTEGER TYPE
      CALL DEFD$(E$)

      LEOS=IEOS$('@')
      CALL LEFT$(E$,WORK$,3)
      I=IDEN$(E$,'GO @')
      IF(I.NE.0)GO TO 10
      I=MATCH$(WORK$,'GO TO@',1)
      IF(I.NE.1)GO TO 170
      TYPE=1
      GO TO 180

10    CONTINUE
      I=IDEN$(E$,'GOT@')
      IF(I.NE.0)GO TO 20
      I=MATCH$(WORK$,'GOTO@',1)
      IF(I.NE.1)GO TO 170
      ISTART=5
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=1
      GO TO 180

20    CONTINUE
      I=IDEN$(E$,'IF @')
      IF(I.NE.0)GO TO 30
      ISTART=3
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=2
      GO TO 180

30    CONTINUE
      I=IDEN$(E$,'IF(@')
      IF(I.NE.0)GO TO 40
      ISTART=3
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=2
      GO TO 180

40    CONTINUE
      I=IDEN$(E$,'DO @')
      IF(I.NE.0)GO TO 70
      I=I+3
      GO TO 60

50    CONTINUE
      I=I+1
60    CONTINUE
      IF(WORK$(I).EQ.32)GO TO 50
      IF(WORK$(I).EQ.40)GO TO 170
      IF(WORK$(I).EQ.41)GO TO 170
      IF(WORK$(I).EQ.61)GO TO 170
      TYPE=3
      GO TO 180

70    CONTINUE
      I=IDEN$(E$,'REA@')
      IF(I.NE.0)GO TO 80
      I=MATCH$(WORK$,'READ@',1)
      IF(I.NE.1)GO TO 170
      ISTART=5
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=4
      GO TO 180

80    CONTINUE
      I=IDEN$(E$,'WRI@')
      IF(I.NE.0)GO TO 90
      I=MATCH$(WORK$,'WRITE@',1)
      IF(I.NE.1)GO TO 170
      ISTART=6
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=5
      GO TO 180

90    CONTINUE
      I=IDEN$(E$,'ENC@')
      IF(I.NE.0)GO TO 100
      I=MATCH$(WORK$,'ENCODE@',1)
      IF(I.NE.1)GO TO 170
      ISTART=7
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=6
      GO TO 180

100   CONTINUE
      I=IDEN$(E$,'DEC@')
      IF(I.NE.0)GO TO 110
      I=MATCH$(WORK$,'DECODE@',1)
      IF(I.NE.1)GO TO 170
      ISTART=7
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=7
      GO TO 180

110   CONTINUE
      I=IDEN$(E$,'ASS@')
      IF(I.NE.0)GO TO 120
      I=MATCH$(WORK$,'ASSIGN@',1)
      IF(I.NE.1)GO TO 170
      ISTART=7
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=8
      GO TO 180

120   CONTINUE
      I=IDEN$(E$,'PRO@')
      IF(I.NE.0)GO TO 130
      I=MATCH$(WORK$,'PROGRAM@',1)
      IF(I.NE.1)GO TO 170
      TYPE=11
      GO TO 180

130   CONTINUE
      I=IDEN$(E$,'SUB@')
      IF(I.NE.0)GO TO 140
      I=MATCH$(WORK$,'SUBROUTINE@',1)
      IF(I.NE.1)GO TO 170
      TYPE=12
      GO TO 180

140   CONTINUE
      I=IDEN$(E$,'FUN@')
      IF(I.NE.0)GO TO 150
      I=MATCH$(WORK$,'FUNCTION@',1)
      IF (I.NE.1)GO TO 170
      TYPE=17
      GO TO 180

150   CONTINUE
      I=IDEN$(E$,'CON@')
      IF(I.NE.0)GO TO 160
      I=MATCH$(WORK$,'CONTINUE@',1)
      IF(I.NE.1)GO TO 170
      TYPE=13
      GO TO 180

160   CONTINUE
      I=IDEN$(E$,'END@')
      IF(I.NE.0)GO TO 170
      ISTART=4
      CALL VALID(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      ISTART=4
      CALL CLEAR(WORK$,ISTART)
      IF(ISTART.NE.0)GO TO 170
      TYPE=14
      GO TO 180

170   CONTINUE
      TYPE=0

180   CONTINUE
      LEOS=IEOS$(LEOS)
      RETURN
      END

C  VALID - Validate keyword, make sure it is not an assignment statement
C  variable.  String, WORK$ is passed with the begining search position, START.
C  A -1 is returned in start if validation fails to find a legitimate
C  statement.  A zero (0) is returned is the validation test was passed.
C  Any other value indicates an error in processing.

      SUBROUTINE VALID(WORK$,START)
      BYTE WORK$(80)
      INTEGER START

      LEOS=IEOS$('@')
      I=START
      J=LEN$(WORK$)

10    CONTINUE
      IF(WORK$(I).EQ.32)GO TO 20
      IF(WORK$(I).EQ.40)GO TO 30
      IF(WORK$(I).EQ.61)GO TO 70

20    CONTINUE
      I=I+1
      IF(I.GT.J)GO TO 60
      GO TO 10

30    CONTINUE
      K=MATCH$(WORK$,')@',I)
      IF(K.EQ.0)GO TO 70
      I=K+1

40    CONTINUE
      IF(WORK$(I).EQ.32)GO TO 50
      IF(WORK$(I).EQ.40)GO TO 60
      IF(WORK$(I).EQ.61)GO TO 70

50    CONTINUE
      I=I+1
      IF(I.GT.J)GO TO 60
      GO TO 40

60    CONTINUE
      START=0
      GO TO 80

70    CONTINUE
      START=-1

80    CONTINUE
      LEOS=IEOS$(LEOS)
      RETURN

      END

C  CLEAR - Checks to see if anything other than a blank is in the
C  remainder of the string (WORK$) starting in postion START.  If
C  nothing is found (only blanks found), then a zero (0) is returned.
C  Otherwise a minus one (-1) is returned.

      SUBROUTINE CLEAR(WORK$,START)
      BYTE WORK$(80)
      INTEGER START
      I=START
      J=LEN$(WORK$)
10    CONTINUE
      IF(I.GT.J)GO TO 20
      IF(WORK$(I).NE.32)GO TO 30
      I=I+1
      GO TO 10

20    CONTINUE
      START=0
      GO TO 40

30    CONTINUE
      START=-1

40    CONTINUE
      RETURN
      END
μμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμ B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 