1��(
NEVADA FORTRAN CONFIGURATION PROGRAM (27MAY83)

 :] � ���(
DO YOU WANT TO CREATE THE ERROR FILE (Y/N)?  �
� �(
 :���C:�͌�N���Y�C!n�9ʚ2!��9ʦ2@�(+++ CREATING "FORT.ERR" +++

 @� @� ���� ����
!u 6 #z���u��	���	u��	���	*u�*ws#r#"w�
څ�
ڭ
�
ڭ
*u#"u!y6 #��
�ڭ
��jw#�*u#"u!y4��K!yN#y�1
~#�1
�s�
ڭ
��d
�2`u��	���	u��	���	@� � �(
+++ FILE "FORT.ERR" DONE +++
 �(
+++ CONFIGURING NEVADA FORTRAN COMPILER +++

 � � !��9�32dd� ��ʷd� ���!�͕:� 2��(
CHARACTER TO BE USED TO SURROUND HEX CONSTANTS IN STRINGS [ ]  �
� �(
 :��ʥ:�2� �(
CAN YOUR CONSOLE OUTPUT DEVICE HANDLE LOWER CASE LETTERS? (Y/N)  �
� �(
 :��ʥ:� �Y��y��N��n¥x2� d�2�� d� !�9�q2��� ���H�� ��(
+++ CONFIGURING NEVADA FORTRAN RUNTIME PACKAGE +++

YOU CAN SPECIFY ONE OF 3 WAYS THAT THE RUNTIME
PACKAGE CAN DO CONSOLE I/O.  EACH HAS ITS ADVANTAGES.
CONSULT YOUR CP/M MANUALS FOR THE DIFFERENCES OF EACH
ENTER:
0 TO USE DIRECT BIOS I/O
2 TO USE CP/M FUNCTIONS 1 & 2
3 TO USE CP/M FUNCTION 6

 �
� �(
 :���X:��0�Xʹ�ʹ��X2� �(
CAN YOUR CONSOLE OUTPUT DEVICE HANDLE LOWER CASE LETTERS
DURING PROGRAM EXECUTION? (Y/N)  �
� �(
 :��ʼ:� �Y�L�y�L�N�L�n¼x2� �(

DO YOU HAVE A NORTH STAR FLOATING POINT BOARD IN YOUR
SYSTEM? (Y/N)  �
� �(
 :���P:�͌�Y���N> �Y�P�(WHAT ADDRESS IS YOUR FLOATING POINT BOARD ADDRESSED
AT?  ENTER NUMBER CORRESPONDING TO THE ADDRESS OF YOUR BOARD

0) 0FF2/0FF1  1) 1FF2/1FF1  2) 2FF2/2FF1
3) 3FF2/3FF1  4) 4FF2/4FF1  5) 5FF2/5FF1
6) 6FF2/6FF1  7) 7FF2/7FF1  8) 8FF2/8FF1
9) 9FF2/9FF1  A) AFF2/AFF1  B) BFF2/BFF1
C) CFF2/CFF1  D) DFF2/DFF1  E) EFF2/EFF1
F) FFF2/FFF1

 �
� �(
 :����:�͌�0���
�Q���������!� w��2�� �� �(
+++ ALL DONE +++
 �  �a��{�� �~���-~#2�^#V#�!� �^ �³#V�"���	�s#:����r�Õ>[�h:�����h��� 	�� 	��� 	��� 	��� 	�(]  ��/�33	�	;;�z��h�
� �(
 :��*�Y	_ !�6 �!  ��Y	�0ڍ	�
ҍ	�MD))	)�O 	�:	�z���(+++ DEFAULT CANNOT BE ZERO - REENTER +++  �	�(+++ INVALID DECIMAL DIGIT IN INPUT - REENTER +++  �	�*� �� @� ���(+++ WRITE ERROR, DISK FULL +++
 �  �*q}���%
q� � ��r
!q~#"q��7ȷ����*sw#}�q�]
�� @� ���	*� !�"s����>�1
:s���d
��(

+++ END OF FILE NOT FOUND ON FILE "ERRORS" +++
 �  �(+++ FORMAT ERROR IN INPUT TEXT FILE +++
 �  �(+++ INPUT TEXT FILE: "ERRORS" NOT FOUND +++
 �  �(+++ DIRECTORY FULL, CANNOT CREATE FORT.ERR +++
 �  �(+++ FORTRAN RUNTIME "FRUN.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �(+++ READ ERROR ON "FRUN.COM" +++
 �  �(+++ FORTRAN COMPILIER "FORT.COM" NOT FOUND, PROGRAM ABORTED +++
 �  �(+++ READ ERROR ON "FORT.COM" +++
 �  ��-�~#���h�-  "7*7�-�
� �(
 :���<:�͌�@�<����< �WHICH DRIVE CONTAINS THE FILE "ERRORS"?  TO WHICH DRIVE SHOULD "FORT.ERR" BE WRITTEN?  WHICH DRIVE CONTAINS THE FILE "FORT.COM"?
SPECIFY DRIVE "Z" TO SKIP THIS STEP:  WHICH DRIVE CONTAINS THE FILE "FRUN.COM"? 
SPECIFY DRIVE "Z" TO SKIP THIS STEP:  �_� ��                                                                                                                                                                                                                                                                ��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 u                                                                                                                                                                   ERRORS                              FORT    ERR                         FORT    COM                         FRUN    COM                        

THE NUMBER IN [] IS THE CURRENT DEFAULT FOR EACH PARAMETER.
TO USE THE DEFAULT, JUST HIT RETURN/ENTER, TO CHANGE. ENTER
THE NEW VALUE IN DECIMAL


SYMBOL TABLE SIZE    LABEL TABLE SIZE    NUMBER OF ARRAYS   NUMBER OF NESTED DO LOOPS   IF-THEN-ELSE NESTING DEPTH   
THE FOLLOWING 3 PARAMETERS HAVE TO DO WITH EXPRESSION EVAULATION
THE MORE COMPLEX THE STATEMENT TO BE EVALUATED, THE LARGER THE
FOLLOWING 3 PARAMETERS MUST BE.  THE DEFAULTS SHOWN SHOULD BE
STATISFACTORY FOR MOST EXPRESSIONS


NUMBER OF TEMPORARIES USED DURING EXPRESSION EVALUATION   NUMBER OF OP-CODE STACK VARIABLES   NUMBER OF OPERAND STACK VARIABLES                                                                           