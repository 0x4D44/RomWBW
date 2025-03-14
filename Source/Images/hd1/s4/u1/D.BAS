1 OPEN "I",1,"CLRSCRN"
2 INPUT#1,A:M9$=CHR$(A)
3 CLOSE 1
6 GOSUB 50320
10  REM  (C) 1981 TAYLORWARE
20 PRINT "        <<THE MANIPULATION TEST>>": GOSUB 50340: PRINT: PRINT "INTRODUCTION: DO YOU SHAPE YOUR OWN"
30  PRINT "DESTINY?  DO YOU GENERALLY CONTROL YOUR": PRINT "OWN ACTIONS?  ARE YOU YOUR OWN PERSON?"
40  PRINT "DO YOU MAKE YOUR OWN PURCHASES OR ARE": PRINT "YOU DIRECTED BY OTHERS SKILLED IN THE"
50  PRINT "ART OF MANIPULATION?  ARE YOU A HABITUAL": PRINT "WINNER OR LOSER?  THESE ARE VITALLY"
60  PRINT "IMPORTANT QUESTIONS FOR EACH OF US TO": PRINT "ANSWER, ESPECIALLY TODAY WHEN SO MANY"
70  PRINT "ARE SKILLED IN THE ART OF MANIPULATION.": PRINT : PRINT "     ALL OF US HAVE TO PLAY DIFFERENT"
80  PRINT "ROLES AT VARIOUS TIMES, BUT THE MAJOR": PRINT "QUESTION IS, 'WHO PREDOMINATES?'  THIS"
90  PRINT "TEST WILL HELP YOU DETERMINE WHO": PRINT "CONTROLS YOUR BEHAVIOR.  DO YOU, OR DOES"
100  PRINT "SOMEONE ELSE?  HOW SUSCEPTIBLE ARE YOU": PRINT "TO MANIPULATION BY OTHERS?"
110  PRINT: GOSUB 50330: PRINT "<< PRESS RETURN TO CONTINUE >>";: INPUT A$: GOSUB 50320: PRINT TAB(9); "<<THE MANIPULATION TEST>>": GOSUB 50340: PRINT
120  PRINT "DIRECTIONS:  OUR WHOLE SOCIETY TODAY": PRINT "SEEMS TO BE BUILT UPON SOME VARIETY OF"
130  PRINT "MANIPULATION.  THE QUESTION BECOMES ONE": PRINT "OF HOW SUSCEPTIBLE EACH OF US IS TO THIS"
140  PRINT "TYPE OF CONTROL.  THE FOLLOWING TEST": PRINT "SHOULD ALLOW YOU TO MAKE A SELF-"
150  PRINT "APPRAISAL.  THIS TEST CONTAINS 25": PRINT "QUESTIONS.  SOME ARE FOR MEN ONLY AND"
160  PRINT "SOME ARE FOR WOMEN ONLY.  YOU MUST FIRST": PRINT "ENTER AN 'M' FOR MALE OR 'F' FOR FEMALE"
170  PRINT "SO THE TEST WILL KNOW WHICH QUESTIONS TO": PRINT "ASK YOU.  YOUR SCORE WILL BE DISPLAYED"
180  PRINT "AT THE END OF THE TEST.": PRINT : PRINT : PRINT : PRINT :  PRINT "PLEASE ENTER"
185  GOSUB 50330
190  PRINT : PRINT TAB(4); "AN M FOR MALE OR AN F FOR FEMALE:";:  INPUT SEX$: PRINT SEX$
200  IF  LEFT$ (SEX$,1) <  > "F" AND  LEFT$ (SEX$,1) <  > "M" THEN  PRINT  CHR$ (7): GOTO 190
210 A = 0:B = 0:C = 0
220  GOSUB 50320: PRINT TAB(9); "<<THE MANIPULATION TEST>>": PRINT: GOSUB 50340
230  PRINT "1.  WHEN PEOPLE BOMBARD YOU WITH THEIR": PRINT TAB(5); "VALUES, YOU:": PRINT 
240  PRINT TAB(5); "A.  FIND THAT YOUR OWN VALUES": PRINT TAB(9); "CHANGE.": PRINT 
250  PRINT TAB(5); "B.  ACCEPT THEIR VIEWS AS APPLICABLE": PRINT TAB(9); "TO THEM.": PRINT 
260  PRINT TAB(5); "C.  IGNORE WHAT THEY SAY AT THE TIME": PRINT TAB(9); "BUT LATER FIND YOURSELF": PRINT TAB(9); "QUESTIONING YOUR VALUES."
270  GOSUB 50000
280  PRINT "2.  IF SOMEONE WHOM YOU FEEL IS MUCH": PRINT TAB(5); "BRIGHTER THAN YOU ARGUES A POINT,": PRINT TAB(5); "YOU:": PRINT 
290  PRINT TAB(5); "A.  TEND TO YIELD RATHER QUICKLY.": PRINT 
300  PRINT TAB(5); "B.  CONSISTENTLY QUESTION THAT": PRINT TAB(9); "PERSON.": PRINT 
310  PRINT TAB(5); "C.  FIND YOURSELF SLOWLY CONVINCED."
320  GOSUB 50000
330  PRINT "3.  IF A FRIEND ASKS YOU TO DO SOMETHING": PRINT TAB(5); "YOU REALLY DISLIKE, YOU WOULD:": PRINT 
340  PRINT TAB(5); "A.  GRUDGINGLY AGREE.": PRINT 
350  PRINT TAB(5); "B.  DISCUSS YOUR FEELINGS AND": PRINT TAB(9); "PERHAPS NOT DO IT.": PRINT 
360  PRINT TAB(5); "C.  COMPLAIN BUT PROBABLY GIVE IN."
370  GOSUB 50000
380  PRINT "4.  WHEN YOU SHOP, DO YOU:": PRINT 
390  PRINT TAB(5); "A.  FIND YOURSELF ATTRACTED TO THE": PRINT TAB(9); "BRIGHTEST PACKAGE.": PRINT 
400  PRINT TAB(5); "B.  KNOW SPECIFICALLY WHAT YOU ARE": PRINT TAB(9); "LOOKING FOR.": PRINT 
410  PRINT TAB(5); "C.  GENERALLY FOLLOW THE ADVICE OF": PRINT TAB(9); "THE CLERK."
420  GOSUB 50000
430  PRINT "5.  WHEN BUYING A CAR, DO YOU:": PRINT 
440  PRINT TAB(5); "A.  ALWAYS GO TO ONE CAR DEALER.": PRINT 
450  PRINT TAB(5); "B.  SHOP AROUND.": PRINT 
460  PRINT TAB(5); "C.  BUY FROM THE SALESPERSON WHO": PRINT TAB(9); "MOST LOGICALLY PRESENTS A CASE": PRINT TAB(9); "FOR A PARTICULAR AUTOMOBILE."
470  GOSUB 50000
480  PRINT "6.  WHEN A STREET BEGGAR APPROACHES YOU": PRINT TAB(5); "FOR MONEY, YOU ARE LIKELY TO:": PRINT 
490  PRINT TAB(5); "A.  GIVE HIM WHAT HE WANTS SO HE": PRINT TAB(9); "WILL LEAVE YOU ALONE.": PRINT 
500  PRINT TAB(5); "B.  IGNORE HIM.": PRINT 
510  PRINT TAB(5); "C.  ARGUE WITH HIM BUT GIVE IN IF": PRINT TAB(9); "OTHERS WITH YOU DO SO."
520  GOSUB 50000
530  PRINT "7.  A HOSTESS AT A PARTY INSISTS THAT": PRINT TAB(5); "YOU HAVE YET ANOTHER DRINK.  YOU": PRINT TAB(5); "FEEL YOU HAVE HAD ENOUGH.  YOU ARE": PRINT TAB(5); "LIKELY TO:": PRINT 
540  PRINT TAB(5); "A.  TAKE THE DRINK SO AS NOT TO": PRINT TAB(9); "OFFEND HER.": PRINT 
550  PRINT TAB(5); "B.  THANK HER BUT TELL HER YOU HAVE": PRINT TAB(9); "HAD ENOUGH.": PRINT 
560  PRINT TAB(5); "C.  SAY 'NO', UNLESS SHE PERSISTS."
570  GOSUB 50000
580  PRINT "8.  IF YOU TOLD YOUR CHILD THAT HE COULD": PRINT TAB(5); "NOT STAY OUT AT NIGHT AND HE SAID"
590  PRINT TAB(5); "THAT OTHER YOUNGSTERS HIS AGE WERE": PRINT TAB(5); "STILL OUT, YOU WOULD:": PRINT 
600  PRINT TAB(5); "A.  ALLOW HIM TO STAY OUT.": PRINT 
610  PRINT TAB(5); "B.  TELL HIM YOU ARE SORRY BUT YOU": PRINT TAB(9); "FEEL HE NEEDS TO COME IN.": PRINT 
620  PRINT TAB(5); "C.  CHECK TO SEE HOW MANY OTHERS ARE": PRINT TAB(9); "OUT AND THEN PERHAPS ALLOW HIM": PRINT TAB(9); "TO REMAIN OUT.": PRINT 
630  GOSUB 50000
640  PRINT "9.  ANOTHER COUPLE INVITES YOU TO THEIR": PRINT TAB(5); "HOUSE FOR DINNER.  YOU DON'T REALLY": PRINT TAB(5); "WANT TO GO.  YOU ARE LIKELY TO:": PRINT 
650  PRINT TAB(5); "A.  GO, SINCE YOU DON'T WANT TO HURT": PRINT TAB(9); "THEIR FEELINGS.": PRINT 
660  PRINT TAB(5); "B.  TELL THEM YOU HAVE OTHER PLANS.": PRINT 
670  PRINT TAB(5); "C.  TRY TO FIND ANOTHER EXCUSE, BUT": PRINT TAB(9); "IN THE END, PROBABLY GO."
680  GOSUB 50000
690  PRINT "10.  A YOUNG NEIGHBOR WANTS TO CUT YOUR": PRINT TAB(6); "GRASS.  YOU DON'T LIKE THE JOB HE": PRINT TAB(6); "DOES BUT HE IS INSISTENT.  YOU": PRINT TAB(6); "WOULD:": PRINT 
700  PRINT TAB(6); "A.  LET HIM DO THE JOB.": PRINT 
710  PRINT TAB(6); "B.  TELL HIM YOU HAVE SOMEONE ELSE": PRINT TAB(10); "TO DO THE JOB.": PRINT 
720  PRINT TAB(6); "C.  HELP HIM SO HE DID A BETTER": PRINT TAB(10); "JOB."
730  GOSUB 50000
740  PRINT "11.  A FRIEND WANTS TO BORROW A TOOL": PRINT TAB(6); "THAT YOU HATE TO LEND.  WHAT WOULD": PRINT TAB(6); "YOU DO?": PRINT 
750  PRINT TAB(6); "A.  PROBABLY LEND IT ANYWAY.": PRINT 
760  PRINT TAB(6); "B.  TELL HIM THAT YOU NEED IT.": PRINT 
770  PRINT TAB(6); "C.  TRY TO CONVINCE HIM THAT YOU": PRINT TAB(10); "NEED IT, BUT PROBABLY LEND IT": PRINT TAB(10); "TO HIM."
780  GOSUB 50000
790  PRINT "12.  A STOCKBROKER TELLS YOU THAT HE HAS": PRINT TAB(6); "A REAL HOT STOCK.  HE HAS FAILED": PRINT TAB(6); "YOU IN THE PAST WITH THESE 'HOT": PRINT TAB(6); "TIPS.'  YOU WOULD:": PRINT 
800  PRINT TAB(6); "A.  GIVE HIM ANOTHER CHANCE.": PRINT 
810  PRINT TAB(6); "B.  TELL HIM YOU HAVE LOST FAITH IN": PRINT TAB(10); "'HOT TIPS.'": PRINT 
820  PRINT TAB(6); "C.  THINK IT OVER, BUT THEN": PRINT TAB(10); "PROBABLY DECIDE TO TAKE ONE": PRINT TAB(10); "MORE CHANCE."
830  GOSUB 50000
840  PRINT "13.  WHEN PEOPLE ASK YOU TO LOAN THEM": PRINT TAB(6); "MONEY, YOU:": PRINT 
850  PRINT TAB(6); "A.  NEARLY ALWAYS GIVE IN.": PRINT 
860  PRINT TAB(6); "B.  NEVER GIVE IN.": PRINT 
870  PRINT TAB(6); "C.  SOMETIMES GIVE IN."
880  GOSUB 50000
890  PRINT "14.  WHEN PEOPLE ASK YOUR ADVICE AND YOU": PRINT TAB(6); "FEEL THEY MAY WELL GET ANGRY OVER": PRINT TAB(6); "WHAT YOU TELL THEM, YOU:": PRINT 
900  PRINT TAB(6); "A.  GIVE IT ANYWAY.": PRINT 
910  PRINT TAB(6); "B.  LET THEM DECIDE THE ISSUE FOR": PRINT TAB(10); "THEMSELVES.": PRINT 
920  PRINT TAB(6); "C.  HOLD OFF UNTIL THEY PERSIST."
930  GOSUB 50000
940  PRINT "15.  WHEN CLOTHING STYLES CHANGE, DO": PRINT TAB(6); "YOU:": PRINT 
950  PRINT TAB(6); "A.  CHANGE RIGHT WITH THEM.": PRINT 
960  PRINT TAB(6); "B.  DECIDE FOR YOURSELF WHAT STYLE": PRINT TAB(10); "LOOKS BEST FOR YOU.": PRINT 
970  PRINT TAB(6); "C.  CHANGE AFTER EVERYONE ELSE": PRINT TAB(10); "CHANGES."
980  GOSUB 50000
990  PRINT "16.  YOU SEE A NUMBER OF PEOPLE MAKING": PRINT TAB(6); "FOOLS OF THEMSELVES AT A PARTY.": PRINT TAB(6); "THEY ASK YOU TO JOIN IN THE GAME.": PRINT TAB(6); "YOU ARE LIKELY TO:": PRINT 
1000  PRINT TAB(6); "A.  JOIN IN.": PRINT 
1010  PRINT TAB(6); "B.  AVOID SUCH BEHAVIOR.": PRINT 
1020  PRINT TAB(6); "C.  WAIT UNTIL NEARLY EVERYONE": PRINT TAB(10); "JOINS IN."
1030  GOSUB 50000
1040  PRINT "17.  A KNOWN RECKLESS DRIVER OFFERS YOU": PRINT TAB(6); "A RIDE.  WOULD YOU:": PRINT 
1050  PRINT TAB(6); "A.  ACCEPT, BUT WORRY ALL THE WAY.": PRINT 
1060  PRINT TAB(6); "B.  REFUSE.": PRINT 
1070  PRINT TAB(6); "C.  ACCEPT, BUT TRY TO ADVISE": PRINT TAB(10); "CAUTION."
1080  GOSUB 50000
1090  PRINT "18.  IF SOMEONE COMPLAINED THAT YOU": PRINT TAB(6); "GENERALLY DO THAT WHICH YOU FEEL": PRINT TAB(6); "IS RIGHT FOR YOU, YOU WOULD:": PRINT 
1100  PRINT TAB(6); "A.  TRY TO CHANGE.": PRINT 
1110  PRINT TAB(6); "B.  ACCEPT THE STATEMENT AS A": PRINT TAB(10); "COMPLIMENT.": PRINT 
1120  PRINT TAB(6); "C.  ARGUE, BUT PROBABLY SEE THE": PRINT TAB(10); "ERROR OF YOUR WAYS."
1130  GOSUB 50000
1140  PRINT "19.  WHEN YOU ARE WITH HEAVY DRINKERS": PRINT TAB(6); "GENERALLY YOU:": PRINT 
1150  PRINT TAB(6); "A.  JOIN IN AND DRINK HEAVILY.": PRINT 
1160  PRINT TAB(6); "B.  STAY AT YOUR OWN LEVEL OF": PRINT TAB(10); "DRINKING.": PRINT 
1170  PRINT TAB(6); "C.  DRINK MORE THAN USUAL BUT TRY": PRINT TAB(10); "TO SLOW THEM DOWN."
1180  GOSUB 50000
1190  PRINT "20.  YOU SEE A PAINTING THAT YOU LIKE.": PRINT TAB(6); "OTHERS STRONGLY CRITICIZE THE": PRINT TAB(6); "PAINTING.  YOU WOULD:": PRINT 
1200  PRINT TAB(6); "A.  ALTER YOUR OPINION.": PRINT 
1210  PRINT TAB(6); "B.  STICK TO YOUR OPINION.": PRINT 
1220  PRINT TAB(6); "C.  STILL LIKE THE PAINTING BUT NOT": PRINT TAB(10); "AS MUCH."
1230  GOSUB 50000
1240  IF  LEFT$ (SEX$,1) = "F" THEN  GOTO 1510
1250  PRINT "21.  A GROUP OF MEN ARE TALKING BADLY": PRINT TAB(6); "ABOUT A WOMAN YOU LIKE.  YOU WOULD:": PRINT 
1260  PRINT TAB(6); "A.  PROBABLY ALTER YOUR OPINION OF": PRINT TAB(10); "HER.": PRINT 
1270  PRINT TAB(6); "B.  NOT CHANGE YOUR OPINION AND": PRINT TAB(10); "PERHAPS EVEN DEFEND HER": PRINT TAB(10); "REPUTATION.": PRINT 
1280  PRINT TAB(6); "C.  TRY TO ARGUE AGAINST THEM."
1290  GOSUB 50000
1300  PRINT "22.  A DRIVER SCRAPES THE FENDER OF YOUR": PRINT TAB(6); "CAR.  WHEN THE DRIVER EMERGES FROM": PRINT TAB(6); "THE CAR YOU NOTE THAT SHE IS MOST": PRINT TAB(6); "ATTRACTIVE.  YOU WOULD:": PRINT 
1310  PRINT TAB(6); "A.  APOLOGIZE FOR ANY INITIAL": PRINT TAB(10); "ANGER.": PRINT 
1320  PRINT TAB(6); "B.  TELL HER THAT SHE HAS DAMAGED": PRINT TAB(10); "YOUR CAR.": PRINT 
1330  PRINT TAB(6); "C.  INFORM HER THAT YOUR INSURANCE": PRINT TAB(10); "COMPANIES CAN SETTLE IT."
1340  GOSUB 50000
1350  PRINT "23.  YOU HAVE JUST PUT ON A NEW SPORT": PRINT TAB(6); "COAT THAT YOU HAVE HITHERTO LOVED.": PRINT TAB(6); "AN ATTRACTIVE LADY DOESN'T LIKE IT.": PRINT TAB(6); "YOU ARE APT TO:": PRINT 
1360  PRINT TAB(6); "A.  GET A NEW SPORT COAT.": PRINT 
1370  PRINT TAB(6); "B.  FIGURE THAT SHE HAS A RIGHT TO": PRINT TAB(10); "HER OPINION AND YOU DO TO": PRINT TAB(10); "YOURS.": PRINT 
1380  PRINT TAB(6); "C.  LOOK FOR A SECOND OPINION."
1390  GOSUB 50000
1400  PRINT "24.  A VERY ATTRACTIVE MAGAZINE": PRINT TAB(6); "SALESLADY IS PUSHING SOME MAGAZINES": PRINT TAB(6); "THAT ARE NOT AMONG YOUR FAVORITES.": PRINT TAB(6); "YOU PROBABLY WOULD:": PRINT 
1410  PRINT TAB(6); "A.  BUY SEVERAL MAGAZINES.": PRINT 
1420  PRINT TAB(6); "B.  TELL HER YOU ARE NOT": PRINT TAB(10); "INTERESTED.": PRINT 
1430  PRINT TAB(6); "C.  TRY TO INDICATE THAT THESE": PRINT TAB(10); "MAGAZINES ARE NOT AMONG YOUR": PRINT TAB(10); "FAVORITES."
1440  GOSUB 50000
1450  PRINT "25.  YOU ARE WAITING IN LINE AT A": PRINT TAB(6); "CARRY-OUT RESTAURANT.  A LADY": PRINT TAB(6); "BARGES IN FRONT OF YOU, SAYING SHE": PRINT TAB(6); "IS RUSHED.  YOU WOULD:": PRINT 
1460  PRINT TAB(6); "A.  SMILE AND SAY NOTHING.": PRINT 
1470  PRINT TAB(6); "B.  TELL HER YOU ARE SORRY BUT YOU": PRINT TAB(10); "ARE RUSHED TOO.": PRINT 
1480  PRINT TAB(6); "C.  TRY TO PERSUADE HER THAT SHE": PRINT TAB(10); "SHOULD WAIT HER TURN, BUT NOT": PRINT TAB(10); "PUSH IT."
1490  GOSUB 50000
1500  GOTO 1760
1510  PRINT "21.  YOU HAVE AN ARGUMENT WITH A MAN WHO": PRINT TAB(6); "INDICATES THAT YOU ARE USING": PRINT TAB(6); "FEMININE LOGIC.  YOU WOULD:": PRINT 
1520  PRINT TAB(6); "A.  BACK OFF.": PRINT 
1530  PRINT TAB(6); "B.  POINT OUT THAT HE IS NOT USING": PRINT TAB(10); "LOGIC.": PRINT 
1540  PRINT TAB(6); "C.  LISTEN TO HIS POINTS AND": PRINT TAB(10); "PROBABLY YIELD."
1550  GOSUB 50000
1560  PRINT "22.  YOU ARE NOT IN A SEXY MOOD.  YOUR": PRINT TAB(6); "HUSBAND TELLS YOU THAT IT HAS BEEN": PRINT TAB(6); "A NUMBER OF DAYS SINCE THERE HAD": PRINT TAB(6); "BEEN ANY SEXUAL ACTIVITY.  WHAT": PRINT TAB(6); "WOULD YOU DO?": PRINT 
1570  PRINT TAB(6); "A.  PROBABLY YIELD.": PRINT 
1580  PRINT TAB(6); "B.  TELL HIM YOU ARE SORRY BUT THAT": PRINT TAB(10); "DOESN'T CHANGE YOUR MOOD.": PRINT 
1590  PRINT TAB(6); "C.  TRY TO COMPROMISE AND PROMISE": PRINT TAB(10); "HIM YOU WILL BE IN THE MOOD": PRINT TAB(10); "TOMORROW."
1600  GOSUB 50000
1610  PRINT "23.  THERE IS A DISCUSSION ABOUT": PRINT TAB(6); "ABORTION.  SEVERAL PEOPLE ATTACK": PRINT TAB(6); "THE POSITION YOU HOLD.  YOU WOULD:": PRINT 
1620  PRINT TAB(6); "A.  PROBABLY YIELD BECAUSE OF THE": PRINT TAB(10); "HEAVY EMOTIONALITY.": PRINT 
1630  PRINT TAB(6); "B.  STICK TO YOUR GUNS.": PRINT 
1640  PRINT TAB(6); "C.  YIELD ONLY IF THEIR ARGUMENTS": PRINT TAB(10); "SEEM IMMEDIATELY SOUND."
1650  GOSUB 50000
1660  PRINT "24.  YOUR BOSS ASKS YOU TO RUN AN ERRAND"
1661  PRINT TAB(6);: PRINT "FOR HIM AND YOU DISSLIKE THIS TYPE": PRINT TAB(6);: PRINT "OF JOB.  YOU TRY TO GET OUT OF IT": PRINT TAB(6);
1662  PRINT "BUT HE SAYS, 'OH WELL, THEN I'M": PRINT TAB(6);: PRINT "AFRAID I WILL HAVE TO DO IT!'  YOU": PRINT TAB(6); "WOULD:": PRINT 
1670  PRINT TAB(6); "A.  YIELD BECAUSE OF GUILT": PRINT TAB(10); "FEELINGS.": PRINT 
1680  PRINT TAB(6); "B.  STICK TO YOUR POSITION.": PRINT 
1690  PRINT TAB(6); "C.  TRY TO CONVINCE HIM THAT IT": PRINT TAB(10); "ISN'T THAT DIFFICULT FOR HIM": PRINT TAB(10); "TO RUN THE ERRAND, BUT YIELD IF": PRINT TAB(10); "HE STILL FEELS IT WOULD BE": PRINT TAB(10); "DIFFICULT FOR HIM."
1700  GOSUB 50000
1710  PRINT "25.  YOU FEEL ANGRY AT A REMARK MADE TO": PRINT TAB(6); "YOU AT A PARTY BY ANOTHER WOMAN.  A": PRINT TAB(6); "THIRD PERSON TELLS YOU THAT IT": PRINT TAB(6); "ISN'T FEMININE TO BE ANGRY.  YOU": PRINT TAB(6); "WOULD:": PRINT 
1720  PRINT TAB(6); "A.  HOLD YOUR ANGER IN.": PRINT 
1730  PRINT TAB(6); "B.  TELL HER YOU ARE STILL ANGRY,": PRINT TAB(10); "MAYBE EVEN MORE SO AFTER HER": PRINT TAB(10); "COMMENT.": PRINT 
1740  PRINT TAB(6); "C.  TRY TO CONVINCE HER IT IS": PRINT TAB(10); "ALLOWABLE FOR A WOMAN TO FEEL": PRINT TAB(10); "ANGRY.  IF YOU SUCCEED, THEN": PRINT TAB(10); "YOU MAY VENTILATE YOUR": PRINT TAB(10); "FEELINGS."
1750  GOSUB 50000
1760  PRINT TAB(5); "EACH 'A' ANSWER INDICATES EASY": PRINT "MANIPULATION BY OTHERS.  ANSWER 'B'"
1770  PRINT "INDICATES THAT YOU RESIST MANIPULATION": PRINT "BY OTHERS, AND ANSWER 'C' SHOWS THAT YOU"
1780  PRINT "CAN BE MANIPULATED BUT YOU OFFER TOKEN": PRINT "RESISTANCE.": PRINT 
1790  PRINT TAB(6);: GOSUB 50330: PRINT "YOU SCORED:": GOSUB 50340: PRINT : PRINT TAB(10); "A - "A: PRINT 
1800  PRINT TAB(10); "B - "B: PRINT : PRINT TAB(10); "C - "C
1805  GOSUB 50330
1810  PRINT: PRINT "<< PRESS RETURN TO CONTINUE >>";
1815  INPUT A$
1820  GOSUB 50320: PRINT TAB(9); "<<THE MANIPULATION TEST>>": PRINT
1825  GOSUB 50340
1830  PRINT TAB(6); "THERE ARE FIVE CATEGORIES OF": PRINT "MANIPULATION.  THEY ARE:": PRINT 
1840  PRINT TAB(6); "1.  MANIPULATION PROOF": PRINT 
1850  PRINT TAB(6); "2.  ABOVE AVERAGE": PRINT 
1860  PRINT TAB(6); "3.  AVERAGE MARK": PRINT 
1870  PRINT TAB(6); "4.  FAR BELOW AVERAGE": PRINT 
1880  PRINT TAB(6); "5.  A VERY EASY TARGET": PRINT 
1890  PRINT TAB(6); "YOU FALL INTO THE:": PRINT : PRINT TAB(6);
1900  IF B > 21 THEN A$ = "MANIPULATION PROOF ": GOTO 1950
1910  IF B > 17 THEN A$ = "ABOVE AVERAGE       ": GOTO 1950
1920  IF B > 13 THEN A$ = "AVERAGE MARK        ": GOTO 1950
1930  IF B > 10 THEN A$ = "FAR BELOW AVERAGE   ": GOTO 1950
1940 A$ = "A VERY EASY TARGET "
1950  GOSUB 50330: PRINT A$"CATEGORY": GOSUB 50340: PRINT 
1960  PRINT TAB(6); "ARE YOU SURPRISED BY THE RESULTS?": PRINT "IF YOU DO FIND THAT YOU ARE EASILY"
1970  PRINT "MANIPULATED BY OTHERS YOU MAY NOW"
1975  GOSUB 50330
1980  PRINT: PRINT "<< PRESS RETURN TO CONTINUE >>";: INPUT A$
1990  GOSUB 50320: PRINT TAB(9); "<<THE MANIPLATION TEST>>": PRINT
1995  GOSUB 50340
2000  PRINT "UNDERSTAND WHY YOU OFTEN DO THINGS THAT": PRINT "YOU REGRET LATER.  YOU MAY WISH TO"
2010  PRINT "EXPLORE BOOKS ON SELF-ASSERTIVENESS.  AT"
2020  PRINT "THE OTHER EXTREME, ARE YOU SO": PRINT "INDIVIDUALIZED THAT YOU SEEM"
2030  PRINT "UNCOMPROMISING TO OTHERS?  AT LEAST NOW"
2040  PRINT "YOU CAN MAKE SOME CHOICES."
2050  PRINT: GOSUB 50330: PRINT TAB(4); "<< PRESS RETURN FOR MENU >>";: GOSUB 50340: INPUT A$: PRINT 
2060  GOTO 50350
50000 PRINT:PRINT "    PLEASE ENTER YOUR ANSWER: ";:INPUT AN$
50100  IF  LEFT$ (AN$,1) <  > "A" AND  LEFT$ (AN$,1) <  > "B" AND  LEFT$ (AN$,1) <  > "C" THEN  PRINT  CHR$ (7): GOTO 50000
50200  IF  LEFT$ (AN$,1) = "A" THEN A = A + 1
50210  IF  LEFT$ (AN$,1) = "B" THEN B = B + 1
50220  IF  LEFT$ (AN$,1) = "C" THEN C = C + 1
50300  GOSUB 50320:  GOSUB 50330: PRINT "<<THE MANIPULATION TEST>>": GOSUB 50340: PRINT: RETURN 
50310  REM  ***THE FOLLOWING ROUTINES MUST BE CHANGED WHEN CONVERTING TO OTHER MACHINES***
50320 PRINT M9$:RETURN
50330   RETURN 
50340   RETURN 
50350 RUN "STARTUP"
E CHANGED WHEN CONVERTING TO O