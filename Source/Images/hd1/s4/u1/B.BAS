1 OPEN "I",1,"CLRSCRN"
2 INPUT#1,A:M9$=CHR$(A)
3 CLOSE 1
100  REM  (C) 1981 TAYLORWARE
200  GOSUB 50710
300  PRINT:PRINT: PRINT "INTRODUCTION:  DO OTHERS FREQUENTLY TAKE"
400  PRINT "ADVANTAGE OF YOU?  DO YOU SHY AWAY FROM"
500  PRINT "CONFLICT WITH OTHERS?  WOULD YOU RATHER"
600  PRINT "FIGHT THAN SWITCH?  THESE ARE VERY"
700  PRINT "IMPORTANT QUESTIONS THAT NEED TO BE"
800  PRINT "ANSWERED IN ORDER TO EVALUATE YOUR STYLE"
900  PRINT "OF SOCIAL INTERACTION.  FROM TIME TO"
1000  PRINT "TIME EACH OF US MUST DEAL WITH THE"
1100  PRINT "HOSTILITY OF OTHERS.  IN THESE"
1200  PRINT "SITUATIONS, DO WE HANDLE OURSELVES IN"
1300  PRINT "KEEPING WITH OUR GENERAL IDEALS OR DO WE"
1400  PRINT "REACT IN KIND AND MAKE THE SITUATION"
1500  PRINT "WORSE FOR OURSELVES?  THIS TEST WILL"
1600  PRINT "HELP YOU DETERMINE HOW TO DEAL WITH THE"
1700  PRINT "AGGRESSIVENESS OF OTHERS, AND IT WILL"
1800  PRINT "ALLOW YOU TO CONSIDER MODIFYING THE WAY"
1900  PRINT "IN WHICH YOU INTERACT WITH OTHERS."
2000 PRINT:PRINT"<<  PRESS RETURN TO CONTINUE >>";
2100  INPUT A$
2200  GOSUB 50710
2300  PRINT:PRINT: PRINT "DIRECTIONS:  THIS TEST CONTAINS 20"
2400  PRINT "QUESTIONS.  FOR EACH ONE SELECT THE"
2500  PRINT "ANSWER THAT YOU FEEL WOULD BEST DESCRIBE"
2600  PRINT "YOUR BEHAVIOR IN A GIVEN SITUATION."
2700  PRINT "YOUR SCORE WILL BE DISPLAYED AT THE END"
2800  PRINT "OF THE TEST."
2900 PRINT:PRINT"<< PRESS RETURN TO CONTINUE >>";
3000  INPUT A$
3100 OV = 0
3200 PA = 0
3300 VE = 0
3400 AC = 0
3500  GOSUB 50710
3600  PRINT:PRINT: PRINT "1.  SUPPOSE ONE OF YOUR CLOSEST FRIENDS"
3700  PRINT TAB(5); "DID SOMETHING WHICH AFFECTED YOU AND"
3800  PRINT TAB(5); "YOU DID NOT LIKE IT.  WHAT WOULD YOU"
3900  PRINT TAB(5); "DO?": PRINT 
3910  PRINT 
4000  PRINT TAB(5); "A.  PROBABLY NOT SAY ANYTHING."
4010  PRINT 
4100  PRINT TAB(5); "B.  TRY TO TALK IT OUT WITH YOUR"
4200  PRINT TAB(9); "FRIEND."
4210  PRINT 
4300  PRINT TAB(5); "C.  TALK OUT THE RESULTANT ANGER"
4400  PRINT TAB(9); "WITH SOMEONE ELSE."
4410  PRINT 
4500  PRINT TAB(5); "D.  PROBABLY BLOW UP."
4600 OV$ = "D":PA$ = "C":VE$ = "B":AC$ = "A"
4700  GOSUB 50000
4900  PRINT:PRINT: PRINT "2.  YOU MAKE A PURCHASE AND WHEN YOU GET"
5000  PRINT TAB(5); "IT HOME DISCOVER A FEW PARTS ARE"
5100  PRINT TAB(5); "MISSING.  THE MISSING PARTS ARE NOT"
5200  PRINT TAB(5); "CRUCIAL BUT ARE USEFUL.  YOU LIKELY"
5300  PRINT TAB(5); "WOULD:": PRINT 
5400  PRINT TAB(5); "A.  IMMEDIATELY GO BACK TO THE STORE"
5500  PRINT TAB(9); "AND VENT YOUR ANGER.": PRINT 
5600  PRINT TAB(5); "B.  NOT DO ANYTHING.": PRINT 
5700  PRINT TAB(5); "C.  CALL THE MANAGER AND SEE WHAT HE"
5800  PRINT TAB(9); "IS WILLING TO DO.": PRINT 
5900  PRINT TAB(5); "D.  NEVER GO BACK THERE AGAIN."
6000 OV$ = "A":PA$ = "D":VE$ = "C":AC$ = "B"
6100  GOSUB 50000
6300  PRINT:PRINT: PRINT "3.  A SALES CLERK INSULTS YOUR STYLE OF"
6400  PRINT TAB(5); "DRESS, SAYING IT IS OUTDATED.  YOU"
6500  PRINT TAB(5); "WOULD:": PRINT 
6600  PRINT TAB(5); "A.  LAUGH IT OFF.": PRINT 
6700  PRINT TAB(5); "B.  TELL THE CLERK YOU DID NOT ASK"
6800  PRINT TAB(9); "FOR AN OPINION.": PRINT 
6900  PRINT TAB(5); "C.  BECOME ANGRY AND WARN THIS"
7000  PRINT TAB(9); "UNINVITED CRITIC NOT TO DO IT"
7100  PRINT TAB(9); "AGAIN.": PRINT 
7200  PRINT TAB(5); "D.  LEAVE THE STORE."
7300 OV$ = "C":PA$ = "A":VE$ = "B":AC$ = "D"
7320  GOSUB 50000
7500  PRINT:PRINT: PRINT "4.  AT A BAR A DRUNK INSULTS YOU.  YOU"
7600  PRINT TAB(5); "WOULD:": PRINT 
7700  PRINT TAB(5); "A.  HIT HIM (OR SLAP HIM) IF HE"
7800  PRINT TAB(9); "REFUSES AN APOLOGY.": PRINT 
7900  PRINT TAB(5); "B.  MOVE TO ANOTHER SPOT.": PRINT 
8000  PRINT TAB(5); "C.  IGNORE HIM.": PRINT 
8100  PRINT TAB(5); "D.  TELL THE BARTENDER TO RESTORE"
8200  PRINT TAB(9); "ORDER."
8300 OV$ = "A":PA$ = "C":VE$ = "D":AC$ = "B"
8400  GOSUB 50000
8600  PRINT:PRINT: PRINT "5.  YOUR CHILD TALKS BACK TO YOU.  YOU"
8700  PRINT TAB(5); "ARE LIKELY TO:": PRINT 
8800  PRINT TAB(5); "A.  SEND THE CHILD TO HIS OR HER"
8900  PRINT TAB(9); "ROOM.": PRINT 
9000  PRINT TAB(5); "B.  TALK TO THE CHILD ABOUT"
9100  PRINT TAB(9); "HANDLING ANGER.": PRINT 
9200  PRINT TAB(5); "C.  HIT HIM OR HER.": PRINT 
9300  PRINT TAB(5); "D.  NOT SAY ANYTHING AT THE TIME."
9400 OV$ = "C":PA$ = "D":VE$ = "B":AC$ = "A"
9500  GOSUB 50000
9700  PRINT:PRINT: PRINT "6.  SOMEONE INTERRUPTS YOUR"
9800  PRINT TAB(5); "CONVERSATION.  YOU WOULD:": PRINT 
9900  PRINT TAB(5); "A.  SEETHE ON THE INSIDE BUT NOT"
9910  PRINT TAB(9); "COMMENT ON THE INTERRUPTION.": PRINT 
9920  PRINT TAB(5); "B.  WITHDRAW FROM THE CONVERSATION.": PRINT 
9930  PRINT TAB(5); "C.  WITH MILD HUMOR POINT OUT WHAT"
9940  PRINT TAB(9); "HAPPENED.": PRINT 
9950  PRINT TAB(5); "D.  ANGRILY TELL THE PERSON OFF."
9960 OV$ = "D":PA$ = "A":VE$ = "C":AC$ = "B
9970  GOSUB 50000
9990  PRINT:PRINT: PRINT "7.  YOUR SENATOR SPONSORS A BILL (LAW)"
10000  PRINT TAB(5); "THAT YOU DISLIKE.  YOU WOULD:": PRINT 
10010  PRINT TAB(5); "A.  ANGRILY CALL HIM.": PRINT 
10020  PRINT TAB(5); "B.  DO NOTHING.": PRINT 
10030  PRINT TAB(5); "C.  TALK AGAINST HIM.": PRINT 
10040  PRINT TAB(5); "D.  WRITE HIM A LETTER EXPLAINING"
10050  PRINT TAB(9); "YOUR OPPOSITION."
10060 OV$ = "A":PA$ = "C":VE$ = "D":AC$ = "B"
10070  GOSUB 50000
10090  PRINT:PRINT: PRINT "8.  A POLICEMAN WRONGLY ACCUSES YOU OF"
10100  PRINT TAB(5); "AN ILLEGAL TURN.  YOU ARE LIKELY TO:"
10110  PRINT : PRINT TAB(5); "A.  SAY NOTHING BECAUSE YOU MIGHT"
10120  PRINT TAB(9); "MAKE HIM ANGRY.": PRINT 
10130  PRINT TAB(5); "B.  ARGUE WITH HIM.": PRINT 
10140  PRINT TAB(5); "C.  REFUSE TO SUPPORT POLICE"
10150  PRINT TAB(9); "CHARITIES FROM THEN ON.": PRINT 
10160  PRINT TAB(5); "D.  BLOW YOUR TOP REGARDLESS OF WHAT"
10170  PRINT TAB(9); "HE DOES."
10180 OV$ = "D":PA$ = "C":VE$ = "B":AC$ = "A"
10190  GOSUB 50000
10210  PRINT:PRINT: PRINT "9.  AT A MOVIE THEATER YOU LEAVE FOR A"
10220  PRINT TAB(5); "DRINK.  WHEN YOU RETURN, SOMEONE HAS"
10230  PRINT TAB(5); "TAKEN YOUR SEAT.  YOU WOULD:": PRINT 
10240  PRINT TAB(5); "A.  LOUDLY DEMAND THAT THE"
10250  PRINT TAB(9); "INTERLOPER LEAVE.": PRINT 
10260  PRINT TAB(5); "B.  QUIETLY FIND ANOTHER SEAT.": PRINT 
10270  PRINT TAB(5); "C.  TELL THAT PERSON THAT HE OR SHE"
10280  PRINT TAB(9); "HAS YOUR SEAT.": PRINT 
10290  PRINT TAB(5); "D.  STAND THERE UNTIL HE OR SHE"
10300  PRINT TAB(9); "MOVES."
10310 OV$ = "A":PA$ = "D":VE$ = "C":AC$ = "B"
10320  GOSUB 50000
10340  PRINT:PRINT: PRINT "10.  A WAITRESS SPILLS A DRINK ON YOU."
10350  PRINT TAB(6); "YOU WOULD:": PRINT 
10360  PRINT TAB(6); "A.  DEMAND THAT THE MANAGER COME"
10370  PRINT TAB(10); "OUT AND LOOK AT THE DAMAGE.": PRINT 
10380  PRINT TAB(6); "B.  TELL HER THAT IT JUST ISN'T"
10390  PRINT TAB(10); "YOUR DAY.": PRINT 
10400  PRINT TAB(6); "C.  REFUSE TO SPEAK TO HER.": PRINT 
10410  PRINT TAB(6); "D.  TELL HER THAT YOU WISH TO HAVE"
10420  PRINT TAB(10); "THE CLEANING BILL PAID."
10430 OV$ = "A":PA$ = "B":VE$ = "D":AC$ = "C"
10440  GOSUB 50000
10460  PRINT:PRINT: PRINT "11.  YOU ORDER A STEAK COOKED MEDIUM AND"
10470  PRINT TAB(6); "IT ARRIVES WELL DONE.  YOU WOULD:": PRINT 
10480  PRINT TAB(6); "A.  EAT IT BUT REFUSE TO LEAVE A"
10490  PRINT TAB(10); "TIP AND NEVER RETURN.": PRINT 
10500  PRINT TAB(6); "B.  ASK TO SEE THE MANAGER SO THAT"
10510  PRINT TAB(10); "IT NEVER WILL HAPPEN AGAIN.": PRINT 
10520  PRINT TAB(6); "C.  TELL THE WAITER THAT YOU ARE"
10530  PRINT TAB(10); "SORRY BUT THAT HE WILL HAVE TO"
10540  PRINT TAB(10); "REPLACE THE STEAK.": PRINT 
10550  PRINT TAB(6); "D.  EAT THE STEAK AND NOT MAKE A"
10560  PRINT TAB(10); "FUSS."
10570 OV$ = "B":PA$ = "A":VE$ = "C":AC$ = "D"
10580  GOSUB 50000
10600  PRINT:PRINT: PRINT "12.  SOMEONE AT A PARTY MAKES A"
10610  PRINT TAB(6); "STATEMENT ABOUT ABORTION, A"
10620  PRINT TAB(6); "POSITION THAT IS DIRECTLY OPPOSITE"
10630  PRINT TAB(6); "YOURS.  YOU PROBABLY WOULD:": PRINT 
10640  PRINT TAB(6); "A.  TELL THAT PERSON THAT HE OR SHE"
10650  PRINT TAB(10); "IS TALKING RUBBISH.": PRINT 
10660  PRINT TAB(6); "B.  KEEP YOUR VIEWS TO YOURSELF.": PRINT 
10670  PRINT TAB(6); "C.  REFUSE TO SUPPORT THAT PERSON"
10680  PRINT TAB(10); "BY YOUR SILENCE.": PRINT 
10690  PRINT TAB(6); "D.  MAKE AN UNEMOTIONAL ATTEMPT TO"
10700  PRINT TAB(10); "OFFER YOUR OPINION."
10710 OV$ = "A":PA$ = "C":VE$ = "D":AC$ = "B"
10720  GOSUB 50000
10740  PRINT:PRINT: PRINT "13.  YOU ARE WITH THREE OTHER PEOPLE."
10750  PRINT TAB(6); "THEY WISH TO SEE A MOVIE YOU"
10760  PRINT TAB(6); "ALREADY HAVE SEEN.  YOU WOULD:": PRINT 
10780  PRINT TAB(6); "A.  GO ALONG BUT REFUSE TO LAUGH.": PRINT 
10800  PRINT TAB(6); "B.  TELL THEM YOU HAVE SEEN IT AND"
10810  PRINT TAB(10); "TRY TO PERSUADE THE GROUP TO"
10820  PRINT TAB(10); "SELECT ANOTHER MOVIE.": PRINT 
10830  PRINT TAB(6); "C.  GO ALONG AND TRY TO ENJOY IT.": PRINT 
10840  PRINT TAB(6); "D.  TELL THEM YOU REFUSE TO GO."
10850 OV$ = "D":PA$ = "A":VE$ = "B":AC$ = "C"
10860  GOSUB 50000
10880  PRINT:PRINT: PRINT "14.  SOMEONE BLOWS SMOKE IN YOUR FACE."
10900  PRINT TAB(6); "YOU FIND THAT OBJECTIONABLE,"
10910  PRINT TAB(6); "PARTICULARLY SINCE YOU DON'T SMOKE"
10920  PRINT TAB(6); "YOURSELF.  YOU WOULD:": PRINT 
10930  PRINT TAB(6); "A.  GRIN AND BEAR IT.": PRINT 
10940  PRINT TAB(6); "B.  SILENTLY LEAVE.": PRINT 
10950  PRINT TAB(6); "C.  TELL THE SMOKE-BLOWER THAT HE"
10960  PRINT TAB(10); "OR SHE IS VERY RUDE.": PRINT 
10980  PRINT TAB(6); "D.  TELL HIM OR HER THAT SMOKE"
10990  PRINT TAB(10); "DISTURBS YOU."
11000 OV$ = "C":PA$ = "A":VE$ = "D":AC$ = "B"
11010  GOSUB 50000
11030  PRINT:PRINT: PRINT "15.  YOUR BOSS PUBLICLY BERATES"
11040  PRINT TAB(6); "SOMETHING YOU HAVE DONE.  YOU"
11050  PRINT TAB(6); "WOULD:": PRINT 
11060  PRINT TAB(6); "A.  ASK YOUR BOSS TO DISCUSS WHAT"
11070  PRINT TAB(10); "HE OR SHE OBJECTS TO.": PRINT 
11080  PRINT TAB(6); "B.  BECOME ANGRY AND LEAVE.": PRINT 
11090  PRINT TAB(6); "C.  BECOME ANGRY AND FIGHT BACK.": PRINT 
11100  PRINT TAB(6); "D.  LOSE YOUR INCENTIVE TO DO GOOD"
11110  PRINT TAB(10); "WORK."
11120 OV$ = "C":PA$ = "D":VE$ = "A":AC$ = "B"
11130  GOSUB 50000
11150  PRINT:PRINT: PRINT "16.  SOMEONE STEALS YOUR PARKING PLACE."
11160  PRINT TAB(6); "YOU MIGHT WELL:": PRINT 
11170  PRINT TAB(6); "A.  WAIT UNTIL THAT PERSON LEAVES"
11180  PRINT TAB(10); "AND THEN SCRATCH THE PAINT ON"
11190  PRINT TAB(10); "THE OFFENDING CAR.": PRINT 
11200  PRINT TAB(6); "B.  EXPLAIN THAT YOU WERE WAITING"
11210  PRINT TAB(10); "FOR THAT SPOT.": PRINT 
11220  PRINT TAB(6); "C.  GO FIND ANOTHER SPOT.": PRINT 
11230  PRINT TAB(6); "D.  LEAVE AND GO HOME."
11240 OV$ = "A":PA$ = "C":VE$ = "B":AC$ = "D"
11250  GOSUB 50000
11270  PRINT:PRINT: PRINT "17.  SOMEONE INSULTS YOUR SPOUSE.  YOU"
11280  PRINT TAB(6); "WOULD:": PRINT 
11290  PRINT TAB(6); "A.  SAY THAT YOU DON'T CARE FOR"
11300  PRINT TAB(10); "SUCH COMMENTS.": PRINT 
11310  PRINT TAB(6); "B.  IGNORE THE PERSON.": PRINT 
11320  PRINT TAB(6); "C.  MAKE A NASTY REMARK TO THAT"
11330  PRINT TAB(10); "PERSON'S SPOUSE.": PRINT 
11340  PRINT TAB(6); "D.  LAUGH IT OFF."
11350 OV$ = "C":PA$ = "D":VE$ = "A":AC$ = "B"
11360  GOSUB 50000
11380  PRINT:PRINT: PRINT "18.  A HIGH-PRESSURE SALESMAN COMES TO"
11390  PRINT TAB(6); "YOUR DOOR.  YOU WOULD:": PRINT 
11400  PRINT TAB(6); "A.  SLAM THE DOOR IN HIS FACE.": PRINT 
11410  PRINT TAB(6); "B.  TELL HIM YOU AREN'T INTERESTED.": PRINT 
11420  PRINT TAB(6); "C.  LET HIM MAKE HIS SALESPITCH AND"
11430  PRINT TAB(10); "THEN NOT PURCHASE FROM HIM.": PRINT 
11440  PRINT TAB(6); "D.  DISCUSS HIS PRODUCT."
11450 OV$ = "B":PA$ = "C":VE$ = "D":AC$ = "A"
11460  GOSUB 50000
11480  PRINT:PRINT: PRINT "19.  ANOTHER PARENT TELLS YOU THAT HIS"
11490  PRINT TAB(6); "CHILD IS SMARTER THAN YOURS.  YOU"
11500  PRINT TAB(6); "PROBABLY WOULD:": PRINT 
11510  PRINT TAB(6); "A.  DISCUSS IT WITH HIM.": PRINT 
11520  PRINT TAB(6); "B.  WALK AWAY.": PRINT 
11530  PRINT TAB(6); "C.  TELL HIM THAT YOU ARE PLEASED"
11540  PRINT TAB(10); "WITH YOUR CHILD.": PRINT 
11550  PRINT TAB(6); "D.  TELL HIM THAT YOU AREN'T"
11560  PRINT TAB(10); "INTERESTED IN WHAT HE IS"
11570  PRINT TAB(10); "SAYING."
11580 OV$ = "D":PA$ = "A":VE$ = "C":AC$ = "B"
11590  GOSUB 50000
11610  PRINT:PRINT: PRINT "20.  YOU SEE A FRIEND DRINKING TOO MUCH"
11620  PRINT TAB(6); "AT A PARTY.  YOU PROBABLY WOULD:": PRINT 
11630  PRINT TAB(6); "A.  INFORM YOUR FRIEND THAT YOU"
11640  PRINT TAB(10); "HATE THAT KIND OF BEHAVIOR.": PRINT 
11650  PRINT TAB(6); "B.  TRY TO TALK ABOUT THIS OVER-"
11660  PRINT TAB(10); "IMBIBING TO SEE IF SOMETHING IS"
11670  PRINT TAB(10); "BOTHERING YOUR FRIEND.": PRINT 
11680  PRINT TAB(6); "C.  LOOK THE OTHER WAY.": PRINT 
11690  PRINT TAB(6); "D.  ACCEPT THIS BEHAVIOR AND JOKE"
11700  PRINT TAB(10); "WITH YOUR FRIEND ABOUT IT."
11710 OV$ = "A":PA$ = "D":VE$ = "B":AC$ = "C"
11720  GOSUB 50000
11740  PRINT:PRINT: PRINT "     THERE ARE FOUR PRIMARY APPROACHES"
11750  PRINT "TO EXPRESSING AGGRESSIVENESS OR"
11760  PRINT "ASSERTIVENESS.  ONE OF THESE IS OVERT"
11770  PRINT "AGGRESSION, IN WHICH QUICK DIRECT ANGER"
11780  PRINT "IS EXPRESSED TOWARD SOME PERSON OR"
11790  PRINT "OBJECT.  A SECOND IS PASSIVE AGGRESSION,"
11800  PRINT "IN WHICH ANGER IS EXPRESSED VERY"
11810  PRINT "INDIRECTLY, SUCH AS BY WITHHOLDING"
11820  PRINT "SOMETHING OF ONESELF FROM ANOTHER"
11830  PRINT "PERSON.  A THIRD WOULD INVOLVE VERBAL"
11840  PRINT "ASSERTIVENESS WHEREIN AN ATTEMPT IS MADE"
11850  PRINT "TO SOLVE THE PROBLEM (OR CONFLICT) BY"
11860  PRINT "COMMUNICATION.  FINALLY, THERE IS"
11870  PRINT "ACCOMODATION OR WITHDRAWAL, AND THIS"
11880  PRINT "INVOLVES TURNING THE ANGER INWARD.": PRINT 
11890  PRINT "     FEW PEOPLE USE ONE TECHNIQUE AT ALL"
11900  PRINT "TIMES, SIMPLY BECAUSE LIFE IS TOO"
11910  PRINT "COMPLEX TO RESORT TO ANY ONE APPROACH."
11920 PRINT:PRINT"<< PRESS RETURN TO CONTINUE >>";
11925  INPUT A$
11930  GOSUB 50710
11940  PRINT:PRINT: PRINT "     THIS TEST COUNTED THE NUMBER OF"
11950  PRINT "TIMES YOU HAVE USED EACH APPROACH.  YOU"
11960  PRINT "ARE LIKELY TO FIND THAT ONE APPROACH"
11970  PRINT "PREDOMINATES.  YOU CAN THEN RAISE THE"
11980  PRINT "QUESTION ON AS TO WHETHER YOU WISH TO"
11990  PRINT "CHANGE YOUR APPROACH TO MORE ADEQUATELY"
12000  PRINT "REACH YOUR GOALS.  OR YOU MAY DECIDE TO"
12010  PRINT "STICK WITH THAT WHICH HAS WORKED.  IN"
12020  PRINT "ANY EVENT, AWARENESS OF HOW YOU RESPOND"
12030  PRINT "SHOULD PROVIDE FLEXIBILITY.": PRINT 
12035  GOSUB 50720
12040  PRINT TAB(6); "YOUR SCORES ARE:": GOSUB 50730: PRINT 
12050  PRINT "OVERT AGGRESSION............."OV: PRINT 
12060  PRINT "PASSIVE AGGRESSIVE..........."PA: PRINT 
12070  PRINT "VERBAL ASSERTIVENESS........."VE: PRINT 
12080  PRINT "ACCOMODATION OR WITHDRAWAL..."AC: PRINT 
12090 PRINT"<< PRESS RETURN TO CONTINUE >>";:INPUT A$:PRINT
12100  GOTO 50740
50000 PRINT:PRINT "PLEASE ENTER YOUR ANSWER: ";:INPUT AN$
50100  IF  LEFT$ (AN$,1) = OV$ THEN OV = OV + 1: GOTO 50600
50200  IF  LEFT$ (AN$,1) = PA$ THEN PA = PA + 1: GOTO 50600
50300  IF  LEFT$ (AN$,1) = VE$ THEN VE = VE + 1: GOTO 50600
50400  IF  LEFT$ (AN$,1) = AC$ THEN AC = AC + 1: GOTO 50600
50500  PRINT  CHR$ (7): GOTO 50000
50600  GOSUB 50710
50700  RETURN 
50710 PRINT M9$:PRINT "          << THE ASSERTIVE TEST >>":RETURN
50720 RETURN
50730 RETURN
50740 RUN "STARTUP"
  RE