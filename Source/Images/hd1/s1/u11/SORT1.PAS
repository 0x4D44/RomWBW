(*******************************************************)
(*                                                     *)
(*             TURBO-SORT Example Program              *)
(*                                                     *)
(*         Use with TURBO PASCAL 2.0 or later          *)
(*                                                     *)
(*              Copyright (C) 1984,85 by               *)
(*               Borland International                 *)
(*                                                     *)
(*******************************************************)

program SortExampleOne {Customer File};

type
  CustRec = record
              Number: integer;
              Name:   string[30];
              Addr:   string[20];
              City:   string[12];
              State:  string[3];
              Zip:    string[5];
            end;

var
  CustFile: file of CustRec;
  Customer: CustRec;
  x       : integer;

{$I SORT.BOX}

procedure Inp; {this procedure is forward declared in SORT.BOX}
var
  i : integer;
begin
  i := 0;
  Writeln('INPUT ROUTINE -- sending records to sort:');
  repeat
    i := i + 1;
    Write(#13, i:6);
    Read(CustFile,Customer);
    SortRelease(Customer);
  until EOF(CustFIle);
  Writeln;
  Writeln('Done with input routine  -- sorting . . .');
end;

function Less; {this boolean function has two parameters, X and Y}
               {and is forward declared in SORT.BOX}
var
  FirstCust:  CustRec absolute X;
  SecondCust: CustRec absolute Y;
begin
  Less := FirstCust.Number < SecondCust.Number;
end;

procedure OutP;
var
  I:  Integer;
begin
  Writeln('Done with sort:');
  repeat
    SortReturn(Customer);
    with Customer do
    begin
      Write(Number, ' ',Name,' ');
      for I := Length(Name) to 30 do Write(' ');
      Write(Addr);
      for I := Length(Addr) to 20 do Write(' ');
      Write(City);
      for I := Length(City) to 12 do Write(' ');
      WriteLn(State,' ',Zip);
    end;
  until SortEOS;
end;

begin {program SortExampleOne}
  ClrScr;
  Assign(CustFile,'CUSTOMER.DTA');
  Reset(Custfile);
  x:=TurboSort(SizeOf(CustRec));
  WriteLn('Sort function result: ', x);
end.
