const
  max = 2500;
var
  field:array[0..max,0..max]of byte;
  n,m,i,j:integer;
begin
  fillchar(field,sizeof(field),1);
  n:=70;
  m:=50;

  for i:=1 to n do
     field[i,m div 2] := 0;
  writeln(n,' ',m);
  for i:=1 to n do
    begin 
      for j:=1 to m do write(field[i,j]);
      writeln;
    end;
end.