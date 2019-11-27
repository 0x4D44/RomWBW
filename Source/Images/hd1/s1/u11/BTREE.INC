(*******************************************************)
(*                                                     *)
(*         TURBO-ACCESS Version 1.2 (CP/M-80)          *)
(*                                                     *)
(*              Database Example Program               *)
(*                 - Include Module -                  *)
(*                                                     *)
(*         Use with TURBO PASCAL 2.0 or later          *)
(*                                                     *)
(*              Copyright (C) 1984,85 by               *)
(*               Borland International                 *)
(*                                                     *)
(*******************************************************)


(*  UpcaseStr converts a string to upper case *)

function UpcaseStr(S : Str80) : Str80;
var
  P : Integer;
begin
  for P := 1 to Length(S) do 
    S[P] := Upcase(S[P]);
  UpcaseStr := S;
end;
 
(*  ConstStr returns a string with N characters of value C *)

function ConstStr(C : Char; N : Integer) : Str80;
var
  S : string[80];
begin
  if N < 0 then 
    N := 0; 
  S[0] := Chr(N); 
  FillChar(S[1],N,C);
  ConstStr := S;
end;
 
(*  Beep sounds the terminal bell or beeper *)

procedure Beep;
begin
  Write(^G);
end;


procedure InputStr(var S     : AnyStr;
                       L,X,Y : Integer;
                       Term  : CharSet;
                   var TC    : Char    );
const
  UnderScore  =  '_';
var
  P : Integer;
  Ch : Char;
begin
  GotoXY(X + 1,Y + 1); Write(S,ConstStr(UnderScore,L - Length(S)));
  P := 0;
  repeat
    GotoXY(X + P + 1,Y + 1); Read(Kbd,Ch);
    case Ch of
      #32..#126 : if P < L then
                  begin
                    if Length(S) = L then
                      Delete(S,L,1);
                    P := P + 1;
                    Insert(Ch,S,P);
                    Write(Copy(S,P,L));
                  end
                  else Beep;
      ^S        : if P > 0 then
                    P := P - 1
                  else Beep;
      ^D        : if P < Length(S) then
                    P := P + 1
                  else Beep;
      ^A        : P := 0;
      ^F        : P := Length(S);
      ^G        : if P < Length(S) then
                  begin
                    Delete(S,P + 1,1);
                    Write(Copy(S,P + 1,L),UnderScore);
                  end;
      ^H,#127   : if P > 0 then
                  begin
                    Delete(S,P,1);
                    Write(^H,Copy(S,P,L),UnderScore);
                    P := P - 1;
                  end
                  else Beep;
      ^Y        : begin
                    Write(ConstStr(UnderScore,Length(S) - P));
                    Delete(S,P + 1,L);
                  end;
    else
      if not (Ch in Term) then Beep;
    end;  {of case}
  until Ch in Term;
  P := Length(S);
  GotoXY(X + P + 1,Y + 1);
  Write('' :L - P);
  TC := Ch;
end;


procedure Select(    Prompt : Str80;
                     Term   : CharSet;
                 var TC     : Char    );
var
  Ch : Char;
begin
  GotoXY(1,23); Write(Prompt,'? ' ); ClrEol;
  repeat
    Read(Kbd,Ch);
    TC := Upcase(Ch);
    if not (TC in Term) then
      Beep;
  until TC in Term;
  Write(Ch);
end;

(*  ClearFrame clears the display frame, I.E. Lines 3 to 20 *)

procedure ClearFrame;
var
  I : Integer;
begin
  for I := 3 to 20 do
  begin
    GotoXY(1,I + 1); ClrEol ;
  end;
end;

(*  OutForm displays the entry form on the screen *)

procedure OutForm;
begin
  GotoXY(7,5); Write('Code :');
  GotoXY(29,5); Write('Date :');
  GotoXY(1,7); Write('First name :');
  GotoXY(29,7); Write('Last name :');
  GotoXY(4,9); Write('Company :');
  GotoXY(2,10); Write('Address 1 :');
  GotoXY(2,11); Write('Address 2 :');
  GotoXY(6,13); Write('Phone :');
  GotoXY(29,13); Write('Extension :');
  GotoXY(2,15); Write('Remarks 1 :');
  GotoXY(2,16); Write('Remarks 2 :');
  GotoXY(2,17); Write('Remarks 3 :');
end;
 
(*  ClearForm clears all fields in the entry form *)

procedure ClearForm;
begin
  GotoXY(13,5); Write('' :15);
  GotoXY(35,5); ClrEol;
  GotoXY(13,7); Write('' :15);
  GotoXY(40,7); ClrEol;
  GotoXY(13,9); ClrEol;
  GotoXY(13,10); ClrEol;
  GotoXY(13,11); ClrEol;
  GotoXY(13,13); Write('' :15);
  GotoXY(40,13); ClrEol;
  GotoXY(13,15); ClrEol;
  GotoXY(13,16); ClrEol;
  GotoXY(13,17); ClrEol;
end;


procedure InputCust(var Cust : CustRec);
const
  Term : CharSet  =  [^E,^I,^M,^X,^Z];
var
  L : Integer;
  TC : Char;
begin
  L := 1;
  with Cust do
  repeat
    case L of
      1 : InputStr(CustCode,15,12,4,Term,TC);
      2 : InputStr(EntryDate,8,34,4,Term,TC);
      3 : InputStr(FirstName,15,12,6,Term,TC);
      4 : InputStr(LastName,30,39,6,Term,TC);
      5 : InputStr(Company,40,12,8,Term,TC);
      6 : InputStr(Addr1,30,12,9,Term,TC);
      7 : InputStr(Addr2,30,12,10,Term,TC);
      8 : InputStr(Phone,15,12,12,Term,TC);
      9 : InputStr(PhoneExt,5,39,12,Term,TC);
      10 : InputStr(Remarks1,40,12,14,Term,TC);
      11 : InputStr(Remarks2,40,12,15,Term,TC);
      12 : InputStr(Remarks3,40,12,16,Term,TC);
    end;
    if (TC = ^I) or (TC = ^M) or (TC = ^X) then
      if L = 12 then
        L := 1
      else L := L + 1
    else
      if TC = ^E then
        if L = 1 then
          L := 12
        else L := L - 1;
  until (TC = ^M) and (L = 1) or (TC = ^Z);
end;

(*  OutCust displays the customer data contained in Cust *)

procedure OutCust(var Cust : CustRec);
begin
  with Cust do
  begin
    GotoXY(13,5); Write(CustCode,'' :15 - Length(CustCode));
    GotoXY(35,5); Write(EntryDate); ClrEol ;
    GotoXY(13,7); Write(FirstName,'' :15 - Length(FirstName));
    GotoXY(40,7); Write(LastName); ClrEol;
    GotoXY(13,9); Write(Company); ClrEol;
    GotoXY(13,10); Write(Addr1); ClrEol;
    GotoXY(13,11); Write(Addr2); ClrEol;
    GotoXY(13,13); Write(Phone,'' :15 - Length(Phone));
    GotoXY(40,13); Write(PhoneExt); ClrEol;
    GotoXY(13,15); Write(Remarks1); ClrEol;
    GotoXY(13,16); Write(Remarks2); ClrEol;
    GotoXY(13,17); Write(Remarks3); ClrEol;
  end;
end;
 

function KeyFromName(LastNm : Str15; FirstNm : Str10) : Str25;
const
  Blanks  =  '               ';
begin
  KeyFromName := UpcaseStr(LastNm) + 
                 Copy(Blanks,1,15 - Length(LastNm)) +
                 UpcaseStr(FirstNm);
end;

(*  Update is used to update the data base *)

procedure Update;
var
  Ch : Char;

(*  Add is used to add customers *)

procedure Add;
var
  DataF : Integer;
  Ccode : string[15];
  KeyN  : string[25];
  Cust  : CustRec;
begin
  with Cust do
  begin
    FillChar(Cust,SizeOf(Cust),0);
    repeat
      InputCust(Cust);
      Ccode := CustCode;
      FindKey(CodeIndexFile, DataF,Ccode);
      if OK then
      begin
        GotoXY(6,19);
        Write('ERROR : Duplicate customer code');
        Beep;
      end;
    until not OK;
    AddRec(DatF,DataF,Cust);
    AddKey(CodeIndexFile, DataF,CustCode);
    KeyN := KeyFromName(LastName,FirstName);
    AddKey(NameIndexFile, DataF,KeyN);
    GotoXY(6,19); ClrEol;
  end;
end;
 
(*  Find is used to find, edit and delete customers *)

procedure Find;
var
  D,L,I   : Integer;
  Ch,
  TC      : Char;
  Ccode,
  PCode,
  FirstNm : string[15];
  KeyN,
  PNm     : string[25];
  LastNm  : string[30];
  Cust    : CustRec;
begin
  if UsedRecs(DatF) > 0 then
  begin
    Ccode := '';
    repeat
      InputStr(Ccode,15,12,4,[^M,^Z],TC);
      if Ccode <> '' then
      begin
        FindKey(CodeIndexFile,D,Ccode);
        if OK then
        begin
          GetRec(DatF,D,Cust); 
          OutCust(Cust);
        end
        else
        begin
          GotoXY(6,19);
          Write('ERROR : Customer code not found'); Beep;
        end;
      end;
    until OK or (Ccode = '');
    GotoXY(6,19); ClrEol;
    if Ccode = '' then
    begin
      L := 1; 
      FirstNm := ''; 
      LastNm := '';
      repeat
        case L of
          1 : InputStr(FirstNm,15,12,6,[^I,^M,^Z],TC);
          2 : InputStr(LastNm,30,39,6,[^I,^M,^Z],TC);
        end;
        if (TC = ^I) or (TC = ^M) then 
          L := 3 - L;
      until (TC = ^M) and (L = 1) or (TC = ^Z);
      KeyN := KeyFromName(LastNm,FirstNm); 
      SearchKey(NameIndexFile, D,KeyN);
      if not OK then 
        PrevKey(NameIndexFile,D,KeyN);
      repeat
        GetRec(DatF,D,Cust); 
        OutCust(Cust);
        Select('Find : N)ext, P)revious, Q)uit',['N','P','Q'],Ch);
        case Ch of
          'N' : repeat NextKey(NameIndexFile, D,KeyN) until OK;
          'P' : repeat PrevKey(NameIndexFile, D,KeyN) until OK;
        end;
      until Ch = 'Q';
    end;
    Select('Find : E)dit, D)elete, Q)uit',['E','D','Q'],Ch);
    with Cust do
    case Ch of
      'E' : begin
              PCode := CustCode; 
              PNm := KeyFromName(LastName,FirstName);
              repeat
                InputCust(Cust);
                if CustCode = PCode then 
                  OK := false
                else
                begin
                  Ccode := CustCode; 
                  FindKey(CodeIndexFile, I,Ccode); 
                  if OK then Beep;
                end;
              until not OK;
              PutRec(DatF,D,Cust);
              if CustCode <> PCode then
              begin
                DeleteKey(CodeIndexFile, D,PCode);
                AddKey(CodeIndexFile, D,CustCode);
              end;
              KeyN := KeyFromName(LastName,FirstName);
              if KeyN <> PNm then
              begin
                DeleteKey(NameIndexFile, D,PNm);
                AddKey(NameIndexFile, D,KeyN);
              end;
            end;
      'D' : begin
              DeleteKey(CodeIndexFile,D,CustCode);
              KeyN := KeyFromName(LastName,FirstName); 
              DeleteKey(NameIndexFile,D,KeyN);
              DeleteRec(DatF,D);
      end;
    end;
  end { of UsedRecs(DatF) > 0 .. }
  else Beep;
end;

begin(* Update*)
  OutForm;
  repeat
    Select('Update : A)dd, F)ind, Q)uit',['A','F','Q'],Ch);
    case Ch of
      'A' : Add;
      'F' : Find;
    end;
    if Ch <> 'Q' then
    begin
      GotoXY(60,2); Write(UsedRecs(DatF) :5);
      ClearForm;
    end;
  until Ch = 'Q';
end;

(*  List is used to list customers *)

procedure List;
label Escape;
var
  D,L,LD   : Integer;
  Ch,CO,CS : Char;
  Ccode    : string[15];
  KeyN     : string[25];
  Name     : string[35];
  Cust     : CustRec;
begin
  Select('Output device : P)rinter, S)creen',['P','S'],CO);
  Select('Sort by : C)ode, N)ame, U)nsorted',['C','N','U'],CS);
  GotoXY(1,23); Write('Press <Esc> to abort'); ClrEol;
  ClearKey(CodeIndexFile);
  ClearKey(NameIndexFile);
  D := 0;
  LD := FileLen(DatF) - 1;
  L := 3;
  repeat
    if KeyPressed then
    begin
      Read(Kbd,Ch); 
      if Ch = #27 then
        goto Escape;
    end;
    case CS of
      'C' : NextKey(CodeIndexFile,D,Ccode);
      'N' : NextKey(NameIndexFile,D,KeyN);
      'U' : begin
              OK := false;
              while (D < LD) and not OK do
              begin
                D := D + 1; 
                GetRec(DatF,D,Cust);
                OK := Cust.CustStatus = 0;
              end;
            end;
    end;
    if OK then
      with Cust do
      begin
        if CS <> 'U' then 
          GetRec(DatF,D,Cust);
        Name := LastName;
        if FirstName <> '' then 
          Name := Name + ', ' + FirstName;
        if CO = 'P' then
        begin
          Write(Lst,CustCode,'' :16 - Length(CustCode));
          Write(Lst,Name,'' :36 - Length(Name));
          Writeln(Lst,Copy(Company,1,25));
        end
        else
        begin
          if L = 21 then
          begin
            GotoXY(1,23);
            Write('Press <RETURN> to continue');
            Write(' or <Esc> to abort'); 
            ClrEol;
            repeat 
              Read(Kbd,Ch)
            until (Ch = ^M) or (Ch = #27);
            if Ch = #27 then
              goto Escape;
            GotoXY(1,23);
            Write('Press <Esc> to abort'); ClrEol;
            ClearFrame; 
            L := 3;
          end;
          GotoXY(1,L + 1); Write(CustCode);
          GotoXY(17,L + 1); Write(Name);
          GotoXY(53,L + 1); Write(Copy(Company,1,25));
          L := L + 1;
        end; { of with Cust do .. }
    end; { of if OK .. }
  until not OK;
  if CO = 'S' then
  begin
    GotoXY(1,23); Write('Press <RETURN>'); ClrEol;
    repeat 
      Read(Kbd,Ch)
    until Ch = ^M;
  end;
  Escape :
end;
 
