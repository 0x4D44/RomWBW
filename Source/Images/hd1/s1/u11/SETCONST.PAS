{$C-}
Program SetConst;

{          TURBO DATABASE TOOLBOX DEMONSTRATION PROGRAM
                  SET TURBO-ACCESS CONSTANTS

    This program can be used to help you determine appropriate
    values for the constants required in ACCESS.BOX.  For more
    information on  this  program,  refer to  page 13  of  the
    Owner's Handbook.

    Please note that some useful  keyboard input  routines are
    included below.
}

Const
  Version='1.10A';

Var
  MaxDataRecSize,MaxKeyLen,StackMem,MaxRecs,PageSize,PageStackSize,
  MaxHeight,MaxMaxHeight,Order,MaxSearch,MemSearch,DiskSearch,IrSize,Density,
  IxSize,DxSize,PerPage,TotalPages: Real;
  DFactor: Integer;
  Done: Boolean;

Type
  Buffer=String[255];

Procedure Abort(Msg: Buffer);
  Begin
    GoToXY(1,24);
    WriteLn;
    WriteLn(Msg);
    Halt;
  End; { Abort }

Procedure CW;                { Clear to end of line before advancing to next }
  Begin
    ClrEol;
    WriteLn;
  End; { CW }

Procedure SetScreenUp;                         { Set up the worksheet screen }
  Begin
    ClrScr;
    LowVideo;
    WriteLn('==       Turbo Access constant determination worksheet, Version ',
            Version,'        ==');
    WriteLn;
    WriteLn('Data record size (bytes)');
    WriteLn('Key string length (characters)');
    WriteLn('Size of the database (records)');
    WriteLn('Page size (keys)');
    WriteLn('Page stack size (pages)');
    WriteLn;
    WriteLn('Density (Percent of Items in use per average Page)',' ':2,'50%','75%':12,'100%':12);
    WriteLn;
    WriteLn('Total index file pages');
    WriteLn('Memory used for page stack (bytes)');
    WriteLn('Index file page size (bytes)');
    WriteLn('Index file size (bytes)');
    WriteLn('Data file size (bytes)');
    WriteLn;
    WriteLn('Order');
    WriteLn('MaxHeight');
    WriteLn('Average searches needed to find a key');
    WriteLn('Average searches satisfied by page stack');
    WriteLn('Average disk searches needed to find a key');
    WriteLn;
    NormVideo;
    WriteLn('ESC to end program');
    LowVideo;
  End; { SetScreenUp }

Procedure ShowParms;       { Show current input values to left of input area }
  Begin
    GotoXY(45,3); Write(MaxDataRecSize:11:0); ClrEol;
    GotoXY(45,4); Write(MaxKeyLen:11:0); ClrEol;
    GotoXY(45,5); Write(MaxRecs:11:0); ClrEol;
    GotoXY(45,6); Write(PageSize:11:0); ClrEol;
    GotoXY(45,7); Write(PageStackSize:11:0); ClrEol;
  End; { ShowParms }

{ ======================== LINE EDIT MODULE ================================ }
{
  This is a set of three routines that can be used in a Turbo Pascal program
  for getting input from the keyboard. Each routine provides WordStar-like
  editing of the input, an undo function, and pre-setting of the input buffer.
  A buffer is passed in, which in most cases will contain the old value of the
  variable being read.  If the global variable ShowBuffer is set to True, the
  incoming buffer will be displayed, ready to be edited.  If it is False, the
  incoming buffer will not be displayed but can be recalled with many of the
  editing keys.  ShowBuffer MUST BE INITIALIZED for results to be predictable!!!

  Here is a list of the control characters used (including synonymous IBM PC
  function keys):

  ^A  Move to beginning of line, nondestructive              [Ctrl-LeftArrow]
  ^B  Save current buffer in undo buffer
  ^D  Move forward one                                       [RightArrow]
  ^F  Move to end of line (same as ^R)                       [Ctrl-RightArrow]
  ^G  Delete character forward                               [DEL]
  ^H  Move back 1, destructive (same as ASCII DEL)           [BackSpace]
  ^J  End of input; accept entire buffer                     [Ctrl-Enter]
  ^M  End of input; accept what is currently visible         [Enter]
  ^N  End of input; accept entire buffer
  ^P  Accept next character as-is (control character prefix)
  ^R  Move to end of line (same as ^F)
  ^S  Move back 1, nondestructive                            [LeftArrow]
  ^T  Delete line forward                                    [Ctrl-End]
  ^U  Copy undo buffer into current buffer (undo)
  ^V  Insert on/off                                          [INS]
  ^X  Move to beginning of line, destructive                 [Ctrl-Home]
  ^Y  Delete line
  DEL Move back 1, destructive (same as ^H) (ASCII DEL, not IBM PC DEL)
  ESC End of input; accept what is currently visible

  The initial contents of both the current buffer and the undo buffer are set
  by the parameter Param.

  The character used to end input (^J, ^M, ^N, or ESC) is returned in the
  global variable AskTerminator.

  These routines will work with any version of Turbo Pascal.
}

Type
  CharSet=Set Of Char;

Const
  TermChars: CharSet=[^C,^J,^M,^N,^[];

Var
  ShowBuffer: Boolean; { Input: should the buffer be displayed at the start? }
  AskTerminator: Char; { Output: Returns the terminator -- ^J, ^M, ^N or ESC }

Function AskString(Prompt,Param: Buffer; LegalChars: CharSet;
                   MaxLen: Byte): Buffer;
  Const
    ESC=^[;
    DEL=#$7F;
    InsertFlag: Boolean=True;

  Var
    AS: Buffer;
    Cursor: Integer;
    Ch: Char;
    WasChar,WasFunKey,First: Boolean;

  Procedure PutC;
    Var
      C: Char;
    Begin
      C:=AS[Cursor];
      If C<' ' Then Write('^',Chr(Ord(C)+64))
      Else Write(C);
    End; { PutC }

  Procedure UnPutC;
    Var
      C: Char;
    Begin
      C:=AS[Cursor];
      Write(^H' '^H);
      If C<' ' Then Write(^H' '^H);
    End; { UnPutC }

  Begin { AskString }
    Write(Prompt);
    AS:=Param;
    Cursor:=0;
    First:=True;
    Repeat
      If First And ShowBuffer Then
       Begin
        First:=False;
        Ch:=^R;
       End
      Else Read(Kbd,Ch);
      WasChar:=False;
      WasFunKey:=(Ch=ESC) And KeyPressed;
      If WasFunKey Then
       Begin
        Read(Kbd,Ch);
        Case Ch Of
          's','G': Ch:=^A; { Ctrl-LeftArrow, Home }
          'M': Ch:=^D;     { RightArrow }
          'S': Ch:=^G;     { DEL }
          'K': Ch:=^S;     { LeftArrow }
          'u': Ch:=^T;     { Ctrl-End }
          'R': Ch:=^V;     { INS }
          'w': Ch:=^X;     { Ctrl-Home }
          Else Ch:=^F;     { Ctrl-RightArrow, End, all unknowns }
         End;
       End;
      Case Ch Of
        ^A,^U,^X,^Y: Begin
                       While Cursor>0 Do
                        Begin
                         UnPutC;
                         If Ch=^X Then Delete(AS,Cursor,1);
                         Cursor:=Cursor-1;
                        End;
                       If Ch=^U Then AS:=Param
                       Else If Ch=^Y Then AS:='';
                     End;
        ^B: Param:=AS;
        ^D: If Length(AS)>Cursor Then
             Begin
              Cursor:=Cursor+1;
              PutC;
             End;
        ^F,^R,^N,^J: While Length(AS)>Cursor Do
                      Begin
                       Cursor:=Cursor+1;
                       PutC;
                      End;
        ^G: Delete(AS,Cursor+1,1);
        ^H,^S,DEL: If Cursor>0 Then
                    Begin
                     UnPutC;
                     If Ch<>^S Then Delete(AS,Cursor,1);
                     Cursor:=Cursor-1;
                    End;
        ^P: Begin
              Read(Kbd,Ch);
              WasChar:=True;
            End;
        ^T: Delete(AS,Cursor+1,Length(AS));
        ^V: InsertFlag:=Not InsertFlag;
        Else WasChar:=Not (Ch In TermChars);           { Case Else }
       End;
      If WasChar And (Length(AS)<MaxLen) And (Ch In LegalChars) Then
       Begin
        Cursor:=Cursor+1;
        If InsertFlag Then Insert(Ch,AS,Cursor)
        Else AS[Cursor]:=Ch;
        If Cursor>Length(AS) Then AS[0]:=Chr(Cursor);
        PutC;
       End
      Else If WasChar Then ;      { Add:  Write(^G) to ring the bell }
     Until (Ch In TermChars) And Not WasChar;
    AskTerminator:=Ch;
    AskString:=Copy(AS,1,Cursor);
  End; { AskString }

Function AskInt(Prompt: Buffer; Param: Integer; MaxLen: Byte): Integer;
  Var
    Temp: Buffer;
    P,I: Integer;
  Begin
    Str(Param,Temp);
    Temp:=AskString(Prompt,Temp, ['0'..'9', '-'], MaxLen);
    Val(Temp,P,I);
    If Length(Temp)=0 Then AskInt:=0
    Else If I=0 Then AskInt:=P
    Else AskInt:=Param;
  End; { AskInt }

Function AskReal(Prompt: Buffer; Param: Real; MaxLen: Byte): Real;
  Var
    Temp: Buffer;
    P: Real;
    I: Integer;
  Begin
    Str(Param:1:12,Temp);
    I:=14;
    While Temp[I]='0' Do I:=I-1;
    If Temp[I]='.' Then I:=I-1;
    Temp:=AskString(Prompt,Copy(Temp,1,I),['0'..'9', '.', '-'], MaxLen);
    Val(Temp,P,I);
    If Length(Temp)=0 Then AskReal:=0.0
    Else If I=0 Then AskReal:=P
    Else AskReal:=Param;
  End; { AskReal }

{ ======================== END OF LINE EDIT MODULE ========================= }

Procedure GetParms;              { Get new values for the 5 input parameters }

  Procedure ErrorMsg(B: Buffer);         { Print an error message on line 24 }
    Var Ch: Char;
    Begin
      GotoXY(1,24);
      Write('Error: ',B,'!  Hit any key: ');
      Read(Kbd,Ch);
      GotoXY(1,24);
      Write(' ':22+Length(B));
      AskTerminator := ^M;{ Prevent ESC from ending program on illegal value }
    End; { ErrorMsg }

  Var I: Integer;

  Begin { GetParms }
    ShowBuffer:=True;{ Tell AskString to start out with its buffer displayed }
    I:=1;
    NormVideo;                                        { Hilight input values }
    Repeat
      GotoXY(62,I+2);
      Case I Of
                    { For each I, input a value for its associated variable. }
                    { Then check that value for validity.  If it is valid,   }
                    { increment I so that the next variable is read;         }
                    { otherwise, complain and try again.                     }
        1: Begin
             MaxDataRecSize:=Int(AskReal('',MaxDataRecSize, 6));
             If (MaxDataRecSize>=8.0) And (MaxDataRecSize<65536.0) Then I:=2
             Else ErrorMsg('MaxDataRecSize must be between 8 and 65535');
           End;
        2: Begin
             MaxKeyLen:=Int(AskReal('',MaxKeyLen, 6));
             If (MaxKeyLen>=1.0) And (MaxKeyLen<=255.0) Then I:=3
             Else ErrorMsg('MaxKeyLen must be between 1 and 255');
           End;
        3: Begin
             MaxRecs:=Int(AskReal('',MaxRecs, 6));
             If MaxRecs>0.0 Then I:=4
             Else ErrorMsg('Most databases have a positive number of records');
           End;
        4: Begin
             PageSize:=Int(AskReal('',PageSize, 6));
             If (PageSize>=4.0) And (PageSize<=254.0)
                And Not Odd(Trunc(PageSize)) Then I:=5
             Else ErrorMsg('PageSize must be an even integer between 4 and 254');
           End;
        5: Begin
             PageStackSize:=Int(AskReal('',PageStackSize, 6));
             If (PageStackSize>=3.0) And (PageStackSize<=254.0) Then I:=6
             Else ErrorMsg('PageStackSize must be between 3 and 254');
           End;
       End;
      If AskTerminator=^C Then Abort('INTERRUPTED');
      Done:=(AskTerminator=^[);
    Until (I=6) Or Done;
    LowVideo;
  End; { GetParms }

Procedure Calculate;        { Calculate the derived constants from the input }
                            { constants, for a given density                 }
  Var
    M,Temp: Real;
    I: Integer;
  Begin
    Density:=DFactor/4;
    Order:=PageSize/2;
    PerPage:=PageSize*Density;
    MaxSearch:=Ln(MaxRecs)/Ln(PerPage);
    MaxHeight:=Trunc(MaxSearch+1.0);
    TotalPages:=Int(MaxRecs/PerPage+1.0);
    Temp:=1.0;
    M:=PerPage;
    I:=1;
    While Temp+M<PageStackSize Do
     Begin
      Temp:=Temp+M;
      I:=I+1;
      M:=Exp(Ln(PerPage)*I);
     End;
    If Temp+M>TotalPages Then M:=TotalPages-Temp+1;
    MemSearch:=I+(PageStackSize-Temp)/M;
    DiskSearch:=MaxSearch-MemSearch;
    IrSize:=(MaxKeyLen+5)*PageSize+3;
    IxSize:=IrSize*TotalPages;
    DxSize:=MaxDataRecSize*(MaxRecs+1);
    StackMem:=IrSize*PageStackSize;
  End; { Calculate }

Procedure ShowResults;      { Show the derived constants for a given density }
  Begin
    GotoXY(21+DFactor*12,11); Write(TotalPages:11:0);
    GotoXY(21+DFactor*12,12); Write(StackMem:11:0);
    GotoXY(21+DFactor*12,13); Write(IrSize:11:0);
    GotoXY(21+DFactor*12,14); Write(IxSize:11:0);
    GotoXY(21+DFactor*12,15); Write(DxSize:11:0);
    GotoXY(21+DFactor*12,17); Write(Order:11:0);
    GotoXY(21+DFactor*12,18); Write(MaxHeight:11:0);
    GotoXY(21+DFactor*12,19); Write(MaxSearch:11:2);
    GotoXY(21+DFactor*12,20); Write(MemSearch:11:2);
    GotoXY(21+DFactor*12,21); Write(DiskSearch:11:2);
  End; { ShowResults }

Procedure GiveConstSection;{ Output the Database Toolbox constants to a file }
  Var Ch: Char;
      FileName: String[66];
      T: Text;
  Begin
    GotoXY(1,24);
    WriteLn;
    Write('Do you want to save these constants to a file (Y/N)? ');
    Repeat
      Read(Kbd,Ch);
      Ch:=UpCase(Ch);
    Until Ch In ['Y','N',^C,^[];
    If Ch<>'Y' Then
     Begin
      WriteLn('No');
      Halt;
     End
    Else WriteLn('Yes');
    FileName:='';
    Repeat
      Ch:='Y';
      FileName:=AskString('Filename: ',FileName,[#32..#126],66);
      WriteLn;
      If (FileName='') Or (AskTerminator=^[) Then Halt;
      Assign(T,FileName);
      {$I-} Reset(T); {$I+}
      If IOResult=0 Then
       Begin
        Close(T);
        Write(FileName,' already exists.  Overwrite it (Y/N)? ');
        Repeat
          Read(Kbd,Ch);
          Ch:=UpCase(Ch);
        Until Ch In ['Y','N',^C,^[];
        If Ch<>'Y' Then
         Begin
          WriteLn('No');
          If Ch<>'N' Then Halt;
         End
        Else WriteLn('Yes');
       End;
      If Ch='Y' Then
       Begin
        Assign(T,FileName);
        {$I-} Rewrite(T); {$I+}
        If IOResult<>0 Then
         Begin
          WriteLn(FileName,' could not be created.');
          Ch:='N';
         End;
       End;
    Until Ch='Y';
    WriteLn(T,'Const');
    WriteLn(T,'  MaxDataRecSize = ',MaxDataRecSize:3:0, ';');
    WriteLn(T,'  MaxKeyLen      = ',MaxKeyLen:3:0, ';');
    WriteLn(T,'  PageSize       = ',PageSize:3:0, ';');
    WriteLn(T,'  Order          = ',Order:3:0, ';');
    WriteLn(T,'  PageStackSize  = ',PageStackSize:3:0, ';');
    WriteLn(T,'  MaxHeight      = ',MaxMaxHeight:3:0, ';');
    Close(T);
  End; { GiveConstSection }

Procedure Init;                                { Initialize global variables }
  Begin
    MaxDataRecSize:=200;             { Set up some reasonable default values }
    MaxKeyLen:=10;
    MaxRecs:=10000;
    PageSize:=24;
    PageStackSize:=10;
    Done:=False;
  End; { Init }

Begin { SetConst }
  SetScreenUp;
  Init;
  ShowParms;
  Repeat
    GetParms;                                { Get a set of input parameters }
    ShowParms;                                                   { Show them }
    MaxMaxHeight:=0;
    For DFactor:=2 To 4 Do                               { For each density, }
     Begin
      Calculate;                          { calculate the derived constants, }
      If MaxHeight>MaxMaxHeight Then
        MaxMaxHeight:=MaxHeight;         { (be conservative with MaxHeight), }
      ShowResults;                                   { then show the results }
     End;
  Until Done;                                  { Stop when the user hits ESC }
  GiveConstSection;                  { Save the Toolbox constants to a file? }
End. { SetConst }
