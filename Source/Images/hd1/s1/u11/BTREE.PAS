
(*******************************************************)
(*                                                     *)
(*         TURBO-ACCESS Version 1.2 (CP/M-80)          *)
(*                                                     *)
(*              Database Example Program               *)
(*                                                     *)
(*         Use with TURBO PASCAL 2.0 or later          *)
(*                                                     *)
(*              Copyright (C) 1984,85 by               *)
(*               Borland International                 *)
(*                                                     *)
(*******************************************************)

program DataBase;
(*$A+,C-,R-,V-*)

label Stop;

const

(*  data record Size definition *)
  CustRegSize  =  342;        (*  customer record Size *)

(*  TURBO-access constants *)
  MaxDataRecSize  =  CustRegSize;   (*  max record Size *)
  MaxKeyLen       =  25;            (*  max key Size *)
  PageSize        =  16;            (*  page Size *)
  Order           =  8;             (*  half page Size *)
  PageStackSize   =  5;             (*  page buffer Size *)
  MaxHeight       =  5;             (*  max B-tree height *)


var
  NoOfRecs      : Integer;

(*  include TURBO-access modules *)

(*$I ACCESS.BOX*)
(*$I GETKEY.BOX*)
(*$I ADDKEY.BOX*)
(*$I DELKEY.BOX*)

type
  Str5    =  string[5];
  Str10   =  string[10];
  Str15   =  string[15];
  Str25   =  string[25];
  Str80   =  string[80];
  AnyStr  =  string[255];

(*  character set type *)
  CharSet=  set of Char;

(*  customer record definition *)

  CustRec = record
              CustStatus : Integer;         (*  CustStatus *)
              CustCode   : string[15];    (*  customer code *)
              EntryDate  : string[8];     (*  entry date *)
              FirstName  : string[15];    (*  first name *)
              LastName   : string[30];    (*  last name *)
              Company    : string[40];    (*  company *)
              Addr1      : string[40];    (*  Address 1 *)
              Addr2      : string[40];    (*  Address 2 *)
              Phone      : string[15];    (*  Phone number *)
              PhoneExt   : string[5];     (*  extension *)
              Remarks1   : string[40];    (*  remarks 1 *)
              Remarks2   : string[40];    (*  remarks 2 *)
              Remarks3   : string[40];    (*  ramarks 3 *)
            end;

var

(*  global variables *)
  DatF          : DataFile;
  CodeIndexFile,
  NameIndexFile : IndexFile;
  Ch            : Char;


{$I BTREE.INC}

(*  Main program *)

begin
  ClrScr ;
  Writeln(ConstStr('-',79));
  Writeln('TURBO-Access Customer Database');
  Writeln(ConstStr('-',79));
  GotoXY(1,22); Writeln(ConstStr('-',79));
  Writeln;
  Write(ConstStr('-',79)); GotoXY(1,4);
  InitIndex;
  OpenFile(DatF,'CUST.DAT',CustRegSize);
  if OK then
    OpenIndex(CodeIndexFile,'CUST.IXC',15,0);
  if OK then
    OpenIndex(NameIndexFile,'CUST.IXN',25,1);
  if not OK then
  begin
    Select('Data files missing. Create new files (Y/N)', ['Y','N'], Ch);
    if Ch = 'Y' then
    begin
      MakeFile(DatF,'CUST.DAT',CustRegSize);
      MakeIndex(CodeIndexFile,'CUST.IXC',15,0);
      MakeIndex(NameIndexFile,'CUST.IXN',25,1);
    end
    else goto Stop;
  end;
  GotoXY(60,2); Write(UsedRecs(DatF):5,' Records in use');
  repeat
    Select('Select : U)pdate, L)ist, Q)uit', ['U','L','Q'], Ch);
    case Ch of
      'U' : Update;
      'L' : List;
    end;
    if Ch <> 'Q' then ClearFrame;
  until UpCase(Ch) = 'Q';
  CloseFile(DatF);
  CloseIndex(CodeIndexFile) ;
  CloseIndex(NameIndexFile) ;
  Stop :
  ClrScr;
end.
