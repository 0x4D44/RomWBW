�CLRDIR V-0.4 (06-Aug-2012) by Max Scane

$�#:� � �R�:� �A���2I:� �:�:� ���
:� �-�:� �D�w>2P���T��>2P2R��Test option selected. No disk writes will be performed 
$���Y�>2Q:Q���;&�͚� ͥ:IO ��>����H͇:P�ī�u:R�ă̥�V*N+"N|��}���Directory cleared. $���  ^#V�"A�	 :���] ^#V�^#V#�"C�#####^#V#�"E�####^#V#�"G��*G"J!  "L*E#7?|g}o7?|g}o"N��Drive: $:I�A͍>:͍͚�Sectors Per Track: $:D�p:C�p͚�Directory Size: $:F�p:E�p͚�Track Offset: $:H�p:G�p͚�Sectors to write: $:O�p:N�p͚�*L#"L�*C|��}��!  "L*J#"J�>��!Sw#�|�S��:P���*LMD*A��3DM�	��S��:P���*JMD�*LMD*A��3DM�	�'�>T͍>:͍*J�|�p�}�p*JMD�> ͍>S͍>:͍*L�|�p�}�p͚�	� �  �~#��$�͍�� |��J}�1�2��CP/M 3 Detected
$��MP/M Not Currently Supported 
$�  �̓͍�̓͍���0�:���_� �� �>͍>
͍�: 2?2B2E2H2K2N2Q��Warning - this utility will overwite the directory sectors of $�Drive: $:I�A͍>:͍͚�Type Y to proceed any key other key to exit. $͔�Y��Usage: CLRDIR <drive> [-D, -Y]
Clear the directory sectors of the specified drive.

Options:
-D  Enable debug output.
-Y  Do not ask for confirmation.
$�  :���R�=:���F:���x�C:���e�@:���I:��± �L:�����O� � �! �$ �' �* �0 >	2��C��S�"���>
2��C��S�"���>2��C��S�"���>2��C��S�"���>2��C��S�"���>2��C��S�"���>2��C��S�"���2�� �� �         Invalid drive specified.
$Invalid option specified.
$
Directory NOT cleared.
$                  