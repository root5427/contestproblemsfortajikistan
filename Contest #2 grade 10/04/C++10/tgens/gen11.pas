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
  randseed := 345166;
  n:= 1000;
  m:= 1000;

  k:=8560;

  for j:=1 to m do
     field[1,j] := 0;



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