const
  max = 150;
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
    for k:=-1 to 1 do
      for l:=-1 to 1 do
    if field[x+i*dx+k,y+i*dy+l] = 1 then exit;
  for i:=1 to d do
    field[x+i*dx,y+i*dy] := 1;
end;

var
 x,y,d,k:integer;
begin
  fillchar(field,sizeof(field),0);
  randseed := 34566;
  n:= 78;
  m:= 67;

  k:=1456;

  for i:=1 to k do
    begin
      x:= 1+ random(n);
      y:= 1+ random(m);
      d := 1+ random((n+m)div 10);
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