�@Z3ENV �MSGSUP�IFSUP�PSUP�UINSTAT�PATH�SCANCUR�BELL�ROOT�UD  �s111*	�	�����~��@�r�i�P
���j�#�K�2c�*�	�z�z>�ͅ�w+: w+: w+6�" "�* "�͌"�!�:w#:w#:w#:$w!��[� ��*�� ��������*���p
  NZEX (New ZEX)  Version 1.0d
 �:] �/��p
Syntax:
  interactive mode:	ZEX
  command mode:		ZEX [du:|dir:]scriptname[.typ] [parameters]

Summary of parameters/directives:
   |	insert <CR>			$n	parameter (n=0..9)
  ^|	insert <CR><LF>			^$	define default parameters
  ^<ch>	insert control char		^?	pause until <CR>
  $|	insert '|'			^/	ring bell and pause
  $^	insert '^'			^"<ch>	user input with trigger
  $$	insert '$'			^*	ring bell
  ^<	begin direct echo		^#	toggle ZEX prompt :�(�p
  ^[	direct echo if true		^&	toggle false-if echo :�(�p
  ^>	end direct echo			^.	toggle cmd echo :�(�p
  ^]	end direct echo			^,	stop cmd echo
  ;;	ZEX comment			^-	disable conout
  ^(	begin skip on false IF		^+	enable conout
  ^)	end skip			^!	abort script on false IF
  ^%	toggle auto-redirect :$�(�p
 è� 
�p [on] ��p [off] �:c���%�p
  ZEX cannot be rerun using GO.
 è!� �� ���Ͷ("�͏�(|�("�����%�p
  Aborting: inadequate ZCPR3 facilities.
 è!��R6 ���S"�"���S6�� 	"��K ��B�0��e�(���%�p  TPA overflow è:;� �K>��͟j��3(&�%�p
  ZEX RSX file not found
 è���* �[ �R8}���R8* ��* ��}� b~�� ]�###"���[ ���R�8���S#N#F��B. |=2�+"�#"���S �����DM����N#��0:��w#z�(�����%�p  Error locating CCP entry point è��o& 6!�� �����>
2� �"���(!� (�s#r#:���k�(
�  ��ٯ>��º!  "�>�2��*�#"���>:�U> �U�
� �G*�6���� �6#6
#"�"��:e � (�/�e !d� �/�e !g� �/��%�p
  ZEX script file not found.
 è!] ~� �+~���%�è͢~�; #�  ~#� �*��B������+"�͢6 ɯ2�2�:2�!  "�#"��S�*���
 ��
����| >ͭ �;ʋ	�^(�$�{
2��=
��
��>�&
�]�&
�|�_	ͭ W�%(b�:(c�!(n�?(o�/(p�"(q�'(m�*�Z	�$�o	�.��	�,��	�-��	�+��	�#��	�<��	�(�#	�)�(	�[�
�&(
�@���Ò>�Ò>�Ò>�Ò>�Ò>�Ò>�Ò>�Ò>�Ò>��=
��(�(	�| >Ò�Ò>�Ò>�=
>
�=
2��i�!�� ����>	2��4�>
�q�!��w�ͭ#�!�:�=2��(�
 �w:��(�>�=
>
�q�>
�q��>�Ò�2�=2�>�Ò:�� �2�=2�>�Ò�2�2�>�Ò>�2�:���i/2�>�Õ>�2�:���i/2�>�Õ>�2�ͭ�i�2�2�>�Õ����[���R����w+�͖���%�p
  NZEX Already Present
 è�$��^��|��1���:���1�2���!��0_ ^#V�{�(�(�=
����i�!�:��Ҷ_ ^#V�{� ��� �w# ���*�#"�!�6 !�6 �S���� ���(��:����ͭ�:�<2��~���  > #��U��:6��>�U͂!� �\ � :)� Ͷ=G:i O�g(��:1ͽ��g��Â�͟�3�*�X �����ps#r�����pw����p~#fo����p~���p
Control character n�p
Parameter number out of range I*���R��p
Expression or Parameter "�p
Input and ZEX buffer overlap �%�p Error Line #  *����*��~�(#� �6 ��v��> (�U��p^ =�%�p
Too many parameters:  *���p
Text Buffer Empty �{1�O�*�|��y�      ��2���͇2�2� �͇2�2����:����͇<�~��!�n�A##����x2�_͇�y2�_ ͇����=�"��:�_� :�_ � :�G:�O�������}2���:���h�n##��x��Ky��K�������=�~�$�x:�<=G#~+�$:�O���� ����* ^#V������* ~#fo~#fo~����*" ~#fo����*	 ^#V#~�ѷ���*	 ^#V�Ͷ|��~��Ͷ�$��G#~#�$��O�����"�  ������ ����������w ����������� ���F>���G��������� ���F� ���F�@��� ������v����� ~#����	ʴ�(�ʡ�
ʦ�ʦ�ʪ�{ �{�{y��{�{y�G>�G�O> �U���{��������'�����d ��
 ��}�0�U����� }�o|�g���}�o|�gy���� y�0�U�>�U>
�U��� �U� �U��U��U�
�U��U��>^�U��@�U������O* .d������������ 2�� � 2�Ø����:�_� :�_ � �����  ����Y �� �X� ��������� �� � O�G�����H ��������W��������H �������W������r#x������H 	�	���� �	�	����H � ������|��@�1}��@~#x��1�����	�	�~+x��F�;�*a}��_$. ��3�ZEXSUB ZEX     RSX          