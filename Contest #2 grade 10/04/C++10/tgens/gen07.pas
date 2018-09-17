const
  max = 2000;
var
  field:array[0..max,0..max]of byte;
  n,m,i,j:integer;
procedure spiral(i1,j1,i2,j2:integer);
var i,j:integer;
begin
  if (i1+4>i2)or(j1+4>j2) then exit;

  for j:=j1 to j2-2 do
    field[i1,j] := 1;

  for j:=j1+2 to j2 do
    field[i2,j] := 1;

  for i:=i1 to i2-2 do
    field[i,j2] := 1;

  for i:=i1+2 to i2 do
    field[i,j1] := 1;

  field[i1+2,j1+1] := 1;
  field[i1+1,j2-2] := 1;
  field[i2-2,j2-1] := 1;
  field[i2-1,j1+2] := 1;

  spiral(i1+2,j1+2,i2-2,j2-2);
end;


begin
  fillchar(field,sizeof(field),0);

  n := 1900;
  m := 1980;

  spiral(1,1,n,m);


  writeln(n,' ',m);
  for i:=1 to n do
    begin 
      for j:=1 to m do write(field[i,j]);
      writeln;
    end;
end.