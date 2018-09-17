const
  max = 2500;
var
  field:array[0..max,0..max]of byte;
  n,m,i,j:integer;

procedure strip(x,y,t,d:integer);
var
  dx,dy,i:integer;
  k,l:integer;
begin
  dx := t;
  dy := 1-t;
  for i:=1 to d do
    field[x+i*dx,y+i*dy] := 0;
end;

var
 x,y,d,k:integer;
begin
  fillchar(field,sizeof(field),1);
  randseed := 32345166;
  n:= 1583;
  m:= 982;

  k:=8560;

  for i:=1 to n do
    for j:=1 to m do
       if (i+j) mod 100 < 3 then field[i,j] := 0;

  for i:=1 to n do
    for j:=1 to m do
       if (abs(i-j)) mod 80 < 3 then field[i,j] := 0;

  for i:=1 to n do
    for j:=1 to m do
       if (i) mod 90 < 3 then field[i,j] := 0;

  for i:=1 to n do
    for j:=1 to m do
       if (j) mod 110 < 3 then field[i,j] := 0;


  for i:=1 to k do
    begin
      x:= 1+ random(n);
      y:= 1+ random(m);
      d := 70+random(120);
      if random(20)<10 then strip(x,y,0,d)
      else strip(x,y,1,d);
    end;

  writeln(n,' ',m);
  for i:=1 to n do
    begin 
      for j:=1 to m do write(field[i,j]);
      writeln;
    end;
end.