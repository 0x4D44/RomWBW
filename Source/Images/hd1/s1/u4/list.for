      PROGRAM LIST

C---------------------------------
C  DEFINE STRING VARIABLES
C---------------------------------

      BYTE FILE$(80)
      BYTE BUFF$(8), BUFF(80)
      BYTE NAME$(8), NAME(12)

C----------------------------------
C  INITIALIZE STRING VARIABLES
C----------------------------------

      CALL DEFD$(FILE$)
      CALL DEFS$(BUFF$,BUFF,80)
      CALL DEFS$(NAME$,NAME,12)
      LEOS=0

C----------------------------------
C  PRINT PROGRAM IDENTIFICATION
C----------------------------------

      WRITE(5,10)
10    FORMAT(1X,12X,1X)
      WRITE(5,20)
20    FORMAT(1X,12X,'The LIST Bit (tm)  -  Version 1.02')
      WRITE(5,30)
30    FORMAT(1X,12X,'Copyright (C) 1980   Key Bits Inc.')
      WRITE(5,40)
40    FORMAT(1X,12X,'May, 1980       -   Miami, FL, USA')
      WRITE(5,10)
      WRITE(5,50)
50    FORMAT(1X,25X,'using')
      WRITE(5,10)
      CALL VER$(FILE$)
      J=LEN$(FILE$)
      WRITE(5,60)(FILE$(I),I=1,J)
60    FORMAT(1X,80A1)
      WRITE(5,10)
      WRITE(5,10)

C--------------------------------
C  RETRIEVE PARAMETERS
C--------------------------------

      CALL CMD$(FILE$)
      I2=MATCH$(FILE$,'#@',1)
      IF(I2.GT.80)I2=0
      J=LEN$(FILE$)
      IF(J.LT.2)GO TO 90

C---------------------------------
C  VALIDATE FILE NAME
C---------------------------------

70    CONTINUE
      I=LOOK$(FILE$)
      IF(I.GT.-1) GO TO 120
      WRITE(5,80)
80    FORMAT(1X,'*** FILE NOT FOUND ***')
      GO TO 90

C-----------------------------------
C  PROMPT OPERATOR FOR NAME
C-----------------------------------

90    CONTINUE
      WRITE(5,100)
100   FORMAT(1X,'Enter file name to be listed - ')
      READ(5,110)FILE$
110   FORMAT(80A1)
      CALL STRIP$(FILE$)
      CALL UPPER$(FILE$)
      I=MATCH$(FILE$,'END@',1)
      IF(I.GT.0)GO TO 180
      GO TO 70

C---------------------------------
C  OPEN VALIDATED FILE NAME
C---------------------------------

120   CONTINUE
      K=NFORM$(NAME$,FILE$,1)
      CALL OPEN(7,NAME,K)
      LEOS=IEOS$(0)

C---------------------------------
C  READ A RECORD FROM FILE
C---------------------------------

130   CONTINUE
      READ(7,140,ERR=160,END=180)BUFF
140   FORMAT(80A1)
      CALL STRIP$(BUFF$)

C----------------------------------
C WRITE A RECORD TO SCREEN
C----------------------------------

      J=LEN$(BUFF$)
      IF((J.LE.0).OR.(J.GE.256)) GO TO 130
      WRITE(5,150)(BUFF(I),I=1,J)
150   FORMAT(1X,80A1)
      GO TO 130


C-----------------------------------
C  PRINT READ ERROR MESSAGE
C-----------------------------------

160   CONTINUE
      WRITE(5,170)
170   FORMAT(1X,'*** READ ERROR ***')
      GO TO 130

C-----------------------------------
C  END OF PROGRAM ROUTINE
C-----------------------------------

180   CONTINUE
      LEOS=IEOS$('@')
      WRITE(5,10)
      WRITE(5,190)
190   FORMAT(1X,12X, '        Goodbye . . .')
      WRITE(5,10)
      WRITE(5,10)

C---------------------------------
C  CHECK FOR RETURN TO A PROGRAM
C---------------------------------

      IF(I2.GT.0)GO TO 200
      GO TO 220

C----------------------------------
C  CHAIN TO THE CALLING PROGRAM
C----------------------------------

200   CONTINUE
      CALL CHAIN$('DEMO.COM@')
      WRITE(5,210)
210   FORMAT(1X,'*** DEMO.COM NOT FOUND - RETURNED TO SYSTEM ***')

C-----------------------------------
C  RETURN TO OPERATING SYSTEM
C-----------------------------------

220   CONTINUE
      END
μμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμnd will result in the specified')
650	FORMAT(1X,'file being renamed to a .BAK file and a reformated')
660	FORMAT(1X,'version 