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

program SortExampleTwo { Customer File and Stock File };

type
  CustRec = record
              Number: integer;
              Name:   string[30];
              Addr:   string[20];
              City:   string[12];
              State:  string[3];
              Zip:    string[5];
            end;

  ItemRec = record
              Number:  integer;
              Descrip: string[30];
              InStock: integer;
              Price:   real;
            end;

var
  CustFile:   file of CustRec;
  Customer:   CustRec;
  StockFile:  file of ItemRec;
  Item:       ItemRec;
  Choice:     Char;
  x:          integer;

{$I SORT.BOX}

procedure Inp; {this procedure is forward declared in SORT.BOX}
var
  i : integer;
begin
  i := 0;
  Writeln('INPUT ROUTINE -- sending records to sort:');
  case Choice of
    'C': begin
           repeat
             i := i + 1;
             Write(#13, i:6);
             Read(CustFile,Customer);
             SortRelease(Customer);
           until EOF(CustFile);
         end;
    'S': begin
           repeat
             i := i + 1;
             Write(#13, i:6);
             Read(StockFile,Item);
             SortRelease(Item);
           until EOF(StockFile);
         end;
  end; {case}
  Writeln;
  Writeln('Done with input routine -- sorting . . .');
end;

function Less; {this boolean function has two parameters, X and Y}
               {and is forward declared in SORT.BOX}
var
  FirstCust:  CustRec absolute X;
  SecondCust: CustRec absolute Y;
  FirstItem:  ItemRec absolute X;
  SecondItem: ItemRec absolute Y;
begin
  case Choice of
    'C': Less := FirstCust.Number < SecondCust.Number;
    'S': Less := (FirstItem.InStock < SecondItem.InStock) or
                ((FirstItem.InStock = SecondItem.InStock) and
                 (FirstItem.Price < SecondItem.Price));
  end;
end;

procedure OutP;
var
  I:  Integer;
begin
  Writeln('Done with sort:');
  case Choice of
    'C': begin
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
    'S': begin
           repeat
             SortReturn(Item);
             with Item do
             begin
               Write(Number, ' ',Descrip,' ');
               for I := Length(Descrip) to 30 do Write(' ');
               WriteLn(InStock:5,Price:8:2);
             end;
           until SortEOS;
         end;
  end; {case}
end;

begin {program SortExampleOne}
  ClrScr;
  Write('Sort Customers or Stock? (enter C or S): ');
  repeat
    read(Kbd,Choice);
    Choice := UpCase(Choice);
  until Choice in ['C','S'];
  WriteLn(Choice);
  case Choice of
    'C': begin
           Assign(CustFile,'CUSTOMER.DTA');
           Reset(CustFile);
           x:=TurboSort(SizeOf(CustRec));
         end;
    'S': begin
           Assign(StockFile,'STOCK.DTA');
           Reset(StockFile);
           x:=TurboSort(SizeOf(ItemRec));
         end;
  end; {case}
  Writeln('Sort function result: ', x);
end.
