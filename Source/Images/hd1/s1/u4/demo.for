	PROGRAM DEMO

	BYTE A$(80),B$(80),C$(80),D$(80)

	CALL DEFD$(A$)
	CALL DEFD$(B$)
	CALL DEFD$(C$)
	CALL DEFD$(D$)

10	FORMAT(1X,'The STRING/80 Bit  (tm)  Demonstration Program')
20	FORMAT(1X,'Version 1.01 - Copyright (C) 1980 Key Bits Inc.')
30	FORMAT(1X,'January, 1980 - P.O.BOX 592293, Miami, FL, USA')
40	FORMAT(1X,1X)
50	FORMAT(1X,19X,'using')
60	FORMAT(1X,'This program will run, list or explain each of the')
70	FORMAT(1X,'programs or functions identified in the HELP menu.')
80	FORMAT(1X,'Enter the name of the function to be executed.')
90	FORMAT(1X,'Enter either LIST or HELP followed by the program')
100	FORMAT(1X,'or function name to view the requested information.')
110	FORMAT(1X,'As an example, to view a copy of this program enter')
120	FORMAT(1x,'the command LIST DEMO and the source code will be')
130	FORMAT(1X,'displayed.  Enter END to terminate the session.')
140	FORMAT(1X,'Enter HELP to get a summary of all commands.')
150	FORMAT(1X,'        DEMO COMMAND SUMMARY')
160	FORMAT(1X,'     LIST   - A program to list any print file.')
170	FORMAT(1X,'     FORMAL - A program to formalize Fortran source')
180	FORMAT(1X,'              code and resequence the labels.')
190	FORMAT(1X,'     SERIES - A program to name up to three series,')
200	FORMAT(1X,'		 calculates the total, the average,')
210	FORMAT(1X,'		 the minimun, the maximum, and the ')
220	FORMAT(1X,'		 count of each.  A series can contain')
230	FORMAT(1X,'		 up to seventeen elements.')
240	FORMAT(1X,'     SORT   - A program to sort a file of strings.')
250	FORMAT(1X,'              A file of U. S. Presidents is used ')
260	FORMAT(1X,'              for the demonstration.')
270	FORMAT(1X,'     HELP   - A function to display a menu on each')
280	FORMAT(1X,'              of these items.')
290	FORMAT(1X,'     DIR    - A function to display a directory ')
300	FORMAT(1X,'              of the current disk.')
310	FORMAT(1X,'	REN    - A function to rename a specific file.')
320	FORMAT(1X,'              The convention of newname=oldname is')
330	FORMAT(1X,'              followed.')
340	FORMAT(1X,'     KILL   - A function to kill the named file.')
350	FORMAT(1X,'     END    - Terminates the demonstration session.')
360	FORMAT(1X,'COMMAND? ')
370	FORMAT(1X,'*** COMMAND NOT FOUND ***')
380	FORMAT(1X,'*** HELP parameter NOT RECOGNIZED ***')
390	FORMAT(1X,'THE HELP COMMAND')
400	FORMAT(1X,'FORMAT:  HELP [command name]')
410	FORMAT(1X,'The HELP command will give you a brief description')
420	FORMAT(1X,'of each of the commands in the main menu, and the')
430	FORMAT(1X,'format of the command necessary for execution.')
440	FORMAT(1X,'An example of each command is also given.')
450	FORMAT(1X,'EXAMPLE:  HELP HELP')
460	FORMAT(1X,'THE LIST COMMAND')
470	FORMAT(1X,'FORMAT:  LIST file name')
480	FORMAT(1X,'The LIST command will allow you to list a printable')
490	FORMAT(1X,'file.  The commands LIST, FORMAL, SERIES, SORT and')
500	FORMAT(1X,'DEMO are all Fortran files.  Thus to list a copy of')
510	FORMAT(1X,'the source code for DEMO use the example below. ')
520	FORMAT(1X,'commands HELP, END, DIR, REN and KILL are also in')
530	FORMAT(1X,'the DEMO program.  Thus the example will also give')
540	FORMAT(1X,'you the source listing for these commands.')
550	FORMAT(1X,'EXAMPLE:  LIST DEMO.FOR')
560	FORMAT(1X,'THE END COMAND')
570	FORMAT(1X,'FORMAT:  END')
580	FORMAT(1X,'The END command terminates the demonstration')
590	FORMAT(1X,'program session -- after that there is no more')
600	FORMAT(1X,'to say.')
610	FORMAT(1X,'EXAMPLE:  END')
620	FORMAT(1X,'THE FORMAL COMMAND')
630	FORMAT(1X,'FORMAT:  FORMAL filename[.FOR]')
640	FORMAT(1X,'The FORMAL command will result in the specified')
650	FORMAT(1X,'file being renamed to a .BAK file and a reformated')
660	FORMAT(1X,'version of the Fortran source code being place in')
670	FORMAT(1X,'the file specified.  The file specified must be a')
680	FORMAT(1X,'Fortran file, i.e. with extension .FOR, whether or')
690	FORMAT(1X,'the .FOR is specified.')
700	FORMAT(1X,'EXAMPLE:  FORMAL FORMAL.FOR')
710	FORMAT(1X,'     or:  FORMAL FORMAL')
720	FORMAT(1X,'THE SERIES COMMAND')
730	FORMAT(1X,'FORMAT:  SERIES')
740	FORMAT(1X,'The SERIES command executes a program to name,')
750	FORMAT(1X,'and manage three seventeen-element numeric ')
760	FORMAT(1X,'series.  A separate menu containing SERIES')
770	FORMAT(1X,'commands will appear once executed.  A summary')
780	FORMAT(1X,'of this program is contained in the User')
790	FORMAT(1X,'Manual in the DEMO program section.')
800	FORMAT(1X,'EXAMPLE:  SERIES')
810	FORMAT(1X,'THE SORT COMMAND')
820	FORMAT(1X,'FORMAT:  SORT filename')
830	FORMAT(1X,'The SORT command allows you to sort a file of')
840	FORMAT(1X,'text characters.  Included on the distribution')
850	FORMAT(1X,'disk is a file, PRES.TXT containing a list of')
860	FORMAT(1X,'US presidents in the order of their occupancy.')
870	FORMAT(1X,'You may use this for demonstration purposes.')
880	FORMAT(1X,'EXAMPLE:  SORT PRES.XXX=PRES.TXT')
890	FORMAT(1X,'THE DIR COMMAND')
900	FORMAT(1X,'FORMAT:  DIR ')
910	FORMAT(1X,'The DIR command list the file names  and the number')
920	FORMAT(1X,'of bytes; versus the closest Kbytes; for the ')
930	FORMAT(1X,'currently assigned disk drive.')
940	FORMAT(1X,'EXAMPLE:  DIR ')
950	FORMAT(1X,'THE REN COMMAND')
960	FORMAT(1X,'FORMAT:  REN newname=oldname')
970	FORMAT(1X,'The REN command will rename a file.  In the ')
980	FORMAT(1X,'example below, the file named OLD.TXT on ')
990	FORMAT(1X,'drive B is renamed to NEW.DOC on drive A.')
1000	FORMAT(1X,'EXAMPLE:  REN A:NEW.DOC=B:OLD.TXT')
1010	FORMAT(1X,'THE KILL COMMAND')
1020	FORMAT(1X,'FORMAT:  KILL filename')
1030	FORMAT(1X,'The KILL command deletes the named file')
1040	FORMAT(1X,'from the indicated disk.  USE CAUTIOUSLY.')
1050	FORMAT(1X,'A generalized name could destroy multiple')
1060	FORMAT(1X,'files.')
1070	FORMAT(1X,'EXAMPLE:  KILL B:OLD.TXT')

C		PRINT OPENING BULLETIN

	WRITE(5,10)
	WRITE(5,20)
	WRITE(5,30)
	WRITE(5,40)
	WRITE(5,50)
	WRITE(5,40)

	CALL VER$(A$)
	CALL PUT$(A$)

	WRITE(5,40)
	WRITE(5,60)
	WRITE(5,70)
	WRITE(5,80)
	WRITE(5,90)
	WRITE(5,100)
	WRITE(5,110)
	WRITE(5,120)
	WRITE(5,130)
	WRITE(5,140)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		READ COMMAND


1080	CONTINUE
	WRITE(5,360)
	CALL GET$(A$)

C		SELECT ROUTINE BASED ON COMMAND

	I=MATCH$(A$,'HELP@',1)
	IF(I.GT.0)GO TO 1090
	I=MATCH$(A$,'LIST@',1)
	IF(I.GT.0)GO TO 1200
	I=MATCH$(A$,'FORMAL@',1)
	IF(I.GT.0)GO TO 1260
	I=MATCH$(A$,'SERIES@',1)
	IF(I.GT.0)GO TO 1330
	I=MATCH$(A$,'SORT@',1)
	IF(I.GT.0)GO TO 1350
	I=MATCH$(A$,'DIR@',1)
	IF(I.GT.0)GO TO 1400
	I=MATCH$(A$,'REN@',1)
	IF(I.GT.0)GO TO 1450
	I=MATCH$(A$,'KILL@',1)
	IF(I.GT.0)GO TO 1480

	I=MATCH$(A$,'END@',1)
	IF(I.GT.0)GO TO 1490

C		PRINT ERROR MESSAGE, COMMAND NOT FOUND

	WRITE(5,370)
	GO TO 1080


C		DISPLAY COMMAND HELP BULLETIN

1090	CONTINUE
	L=LEN$(A$)
	IF(L.GT.7)GO TO 1100
	WRITE(5,150)
	WRITE(5,40)
	WRITE(5,160)
	WRITE(5,170)
	WRITE(5,180)
	WRITE(5,190)
	WRITE(5,200)
	WRITE(5,210)
	WRITE(5,220)
	WRITE(5,230)
	WRITE(5,240)
	WRITE(5,250)
	WRITE(5,260)
	WRITE(5,270)
	WRITE(5,280)
	WRITE(5,290)
	WRITE(5,300)
	WRITE(5,310)
	WRITE(5,320)
	WRITE(5,330)
	WRITE(5,340)
	WRITE(5,350)
	WRITE(5,40)
	GO TO 1080

C		WHICH DETAIL HELP MENU

1100	CONTINUE
	I=I+1
	J=MATCH$(A$,'HELP@',I)
	IF(J.GT.0)GO TO 1110
	J=MATCH$(A$,'LIST@',I)
	IF(J.GT.0)GO TO 1120
	J=MATCH$(A$,'END@',I)
	IF(J.GT.0)GO TO 1130
	J=MATCH$(A$,'FORMAL@',I)
	IF(J.GT.0)GO TO 1140
	J=MATCH$(A$,'SERIES@',I)
	IF(J.GT.0)GO TO 1150
	J=MATCH$(A$,'SORT@',I)
	IF(J.GT.0)GO TO 1160
	J=MATCH$(A$,'DIR@',I)
	IF(J.GT.0)GO TO 1170
	J=MATCH$(A$,'REN@',I)
	IF(J.GT.0)GO TO 1180
	J=MATCH$(A$,'KILL@',I)
	IF(J.GT.0)GO TO 1190

	WRITE(5,380)
	GO TO 1080

C		DISPLAY DETAIL HELP BULLETINS
C		DISPLAY HELP HELP

1110	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,390)
	WRITE(5,40)
	WRITE(5,400)
	WRITE(5,40)
	WRITE(5,410)
	WRITE(5,420)
	WRITE(5,430)
	WRITE(5,40)
	WRITE(5,450)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		DISPLAY HELP LIST

1120	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,460)
	WRITE(5,40)
	WRITE(5,470)
	WRITE(5,40)
	WRITE(5,480)
	WRITE(5,490)
	WRITE(5,500)
	WRITE(5,510)
	WRITE(5,520)
	WRITE(5,530)
	WRITE(5,540)
	WRITE(5,40)
	WRITE(5,550)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		DISPLAY HELP END

1130	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,560)
	WRITE(5,40)
	WRITE(5,570)
	WRITE(5,40)
	WRITE(5,580)
	WRITE(5,590)
	WRITE(5,600)
	WRITE(5,40)
	WRITE(5,610)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		DISPLAY HELP FORMAL

1140	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,620)
	WRITE(5,40)
	WRITE(5,630)
	WRITE(5,40)
	WRITE(5,640)
	WRITE(5,650)
	WRITE(5,660)
	WRITE(5,670)
	WRITE(5,680)
	WRITE(5,690)
	WRITE(5,40)
	WRITE(5,700)
	WRITE(5,710)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		DISPLAY HELP SERIES

1150	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,720)
	WRITE(5,40)
	WRITE(5,730)
	WRITE(5,40)
	WRITE(5,740)
	WRITE(5,750)
	WRITE(5,760)
	WRITE(5,770)
	WRITE(5,780)
	WRITE(5,790)
	WRITE(5,40)
	WRITE(5,800)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		DISPLAY HELP SORT

1160	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,810)
	WRITE(5,40)
	WRITE(5,820)
	WRITE(5,40)
	WRITE(5,830)
	WRITE(5,840)
	WRITE(5,850)
	WRITE(5,860)
	WRITE(5,870)
	WRITE(5,40)
	WRITE(5,880)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		DISPLAY HELP DIR

1170	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,890)
	WRITE(5,40)
	WRITE(5,900)
	WRITE(5,40)
	WRITE(5,910)
	WRITE(5,920)
	WRITE(5,930)
	WRITE(5,40)
	WRITE(5,940)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		DISPLAY HELP REN

1180	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,950)
	WRITE(5,40)
	WRITE(5,960)
	WRITE(5,40)
	WRITE(5,970)
	WRITE(5,980)
	WRITE(5,990)
	WRITE(5,40)
	WRITE(5,1000)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		DISPLAY HELP KILL

1190	CONTINUE
	WRITE(5,40)
	WRITE(5,40)
	WRITE(5,1010)
	WRITE(5,40)
	WRITE(5,1020)
	WRITE(5,40)
	WRITE(5,1030)
	WRITE(5,1040)
	WRITE(5,1050)
	WRITE(5,1060)
	WRITE(5,40)
	WRITE(5,1070)
	WRITE(5,40)
	WRITE(5,40)
	GO TO 1080

C		LIST FILES

1200	CONTINUE
	L=LEN$(A$)
	I=I+4
	K=L-I+1
	IF(K.LT.1)GO TO 1230
	CALL MID$(B$,A$,I,K)

	J=MATCH$(B$,'DEMO@',1)
	IF(J.GT.0)GO TO 1250
	J=MATCH$(B$,'HELP@',1)
	IF(J.GT.0)GO TO 1250
	J=MATCH$(B$,'END@',1)
	IF(J.GT.0)GO TO 1250
	J=MATCH$(B$,'DIR@',1)
	IF(J.GT.0)GO TO 1250
	J=MATCH$(B$,'REN@',1)
	IF(J.GT.0)GO TO 1250
	J=MATCH$(B$,'KILL@',1)
	IF(J.GT.0)GO TO 1250

	CALL MERGE$(A$,' #@')
1210	CONTINUE
	CALL CHAIN$(A$)

	WRITE(5,1220)
1220	FORMAT(1X,'*** LIST.COM NOT FOUND ***')
	GO TO 1080

1230	CONTINUE
	WRITE(5,1240)
1240	FORMAT(1X,'*** INVALID FILE NAME IN LIST PARAMETER ***')
	GO TO 1080

1250	CONTINUE
	CALL MAKE$(A$,'LIST DEMO.FOR #')
	GO TO 1210


C		EXECUTE FORMAL

1260	CONTINUE
	L=LEN$(A$)
	I=I+4
	K=L-I+1
	IF(K.LT.1)GO TO 1310
	K=MATCH$(A$,'.@',1)
	IF(K.GT.0)GO TO 1300
1270	CONTINUE
	CALL MERGE$(A$,'.FOR #@')
1280	CONTINUE
	CALL CHAIN$(A$)

	WRITE(5,1290)
1290	FORMAT(1X,'*** FORMAL.COM NOT FOUND ***')
	GO TO 1080

1300	CONTINUE
	K=K-1
	CALL LEFT$(B$,A$,K)
	CALL MAKE$(A$,B$)
	GO TO 1270

1310	CONTINUE
	WRITE(5,1320)
1320	FORMAT(1X,'*** INVALID FILE NAME IN FORMAL PARAMETER ***')
	GO TO 1080

C		EXECUTE SERIES

1330	CONTINUE
	CALL CHAIN$('SERIES.COM@')
	WRITE(5,1340)
1340	FORMAT(1X,'*** SERIES.COM NOT FOUND ***')
	GO TO 1080

C		EXECUTE SORT

1350	CONTINUE
	L=LEN$(A$)
	I=I+4
	K=L-I
	IF(K.LT.1)GO TO 1380
	CALL MID$(B$,A$,I,K)

	CALL MERGE$(A$,' #@')
1360	CONTINUE
	CALL CHAIN$(A$)

	WRITE(5,1370)
1370	FORMAT(1X,'*** SORT.COM NOT FOUND ***')
	GO TO 1080

1380	CONTINUE
	WRITE(5,1390)
1390	FORMAT(1X,'*** INVALID FILE NAME IN SORT PARAMETER ***')
	GO TO 1080

C		DISPLAY DIRECTORY

1400	CONTINUE
	WRITE(5,40)
	WRITE(5,1410)
1410	FORMAT(1X,'DIRECTORY')
	WRITE(5,40)
	CALL MAKE$(B$,'???????.???@')
	CALL IDIR$(B$)
	N=0
1420	CONTINUE
	CALL DIR$(B$,N)
	IF(N.LT.0)GO TO 1440
	N=N*128
	WRITE(5,1430)(B$(K),K=1,12),N
1430	FORMAT(1X,12A1,5X,'Bytes=',I6)
	GO TO 1420
1440	CONTINUE
	WRITE(5,40)
	GO TO 1080

C		RENAME A FILE

1450	CONTINUE
	I=I+4
	J=LEN$(A$)
	J=J-I+1
	CALL RIGHT$(B$,A$,J)
	CALL SAVE(B$,I)
	IF(I.GT.0)GO TO 1460
	CALL REN$(B$)
	GO TO 1080

C		ABORT RENAME OR KILL

1460	CONTINUE
	WRITE(5,1470)
1470	FORMAT(1X,'*** ABORTED - PART OF The STRING/80 Bit DEMO ***')
	CALL PUT$(B$)
	WRITE(5,40)
	GO TO 1080

C		KILL A FILE

1480	CONTINUE
	I=I+5
	J=LEN$(A$)
	J=J-I+1
	CALL RIGHT$(B$,A$,J)
	CALL SAVE(B$,I)
	IF(I.GT.0)GO TO 1460
	CALL KILL$(B$)
	GO TO 1080

C		END RPUTINE

1490	CONTINUE
	WRITE(5,1500)
1500	FORMAT(1X,'The STRING/80 Bit (tm) Demonstration has been')
	WRITE(5,1510)
1510	FORMAT(1X,'brought to you by Key Bits Inc., Miami, FL')
	WRITE(5,1520)
1520	FORMAT(1X,'We appreciate the opportunity to do so.  Thank')
	WRITE(5,1530)
1530	FORMAT(1X,'you.  Goodbye for now ...')
	WRITE(5,40)
	WRITE(5,40)
	END

	SUBROUTINE SAVE(A$,K)
	BYTE A$(80)
	K=0
	K=MATCH$(A$,'LIST@',1)
	IF(K.GT.0)GO TO 10
	K=MATCH$(A$,'FORMAL@',1)
	IF(K.GT.0)GO TO 10
	K=MATCH$(A$,'DEMO@',1)
	IF(K.GT.0)GO TO 10
	K=MATCH$(A$,'SERIES@',1)
	IF(K.GT.0)GO TO 10
	K=MATCH$(A$,'SORT@',1)
	IF(K.GT.0)GO TO 10
	K=MATCH$(A$,'PRES@',1)
	IF(K.GT.0)GO TO 10
	K=MATCH$(A$,'STR80@',1)
	IF(K.GT.0)GO TO 10
	K=MATCH$(A$,'UTL80@',1)
	IF(K.GT.0)GO TO 10
	K=-1
	RETURN

10	CONTINUE
	J=K
	K=MATCH$(A$,'COM@',J)
	IF(K.GT.0)RETURN
	K=MATCH$(A$,'FOR@',J)
	IF(K.GT.0)RETURN
	K=MATCH$(A$,'REL@',J)
	IF(K.GT.0)RETURN
	K=MATCH$(A$,'ASM@',J)
	IF(K.GT.0)RETURN
	K=-1
	RETURN
	END
μμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμμ B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B B 