const
  max = 4500;
  ww = 1;
  dir:array[0..3]of record x,y:integer end = ((x:1;y:0),(x:0;y:1),(x:-1;y:0),(x:0;y:-1));
var
  field:array[0..max,0..max]of byte;
  n,m,i,j:integer;
  pp:integer;


procedure tree(x,y,d:integer);
var
  i,j,l:integer;
begin
  l := 1;
  while (true) do
  begin

      if (x+l*dir[d].x <= 0) or (x + l*dir[d].x > n) or
        (y+l*dir[d].y <= 0) or (y + l*dir[d].y > m) then break;
      for i:=-ww to ww do
        if field[x+l*dir[d].x +  i*dir[d].y,y+l*dir[d].y - i*dir[d].x] = 1 then break;
      if field[x+l*dir[d].x +  i*dir[d].y,y+l*dir[d].y - i*dir[d].x] = 1 then break;
      inc(l);
  end;
  if l < 4 then exit;

  l := l div 3 + random(l div 3);


  for i:=1 to l do
    for j:=-ww+1 to ww-1 do
      field[x + i* dir[d].x + j*dir[d].y, y+dir[d].y*i-j*dir[d].x] := 1;

  for i:=0 to 3 do
    if i <> d then
      if random(1000) < pp then tree(x + l*dir[d].x, y+l*dir[d].y, i);
end;

function dist(x,y,d:integer):boolean;
var
 i,j:integer;
begin
  dist := false;
  if (x<d) or (y<d) or(x+d>n) or (y+d>m) then exit;
  for i:=0 to d do
      for j:=-i to i do
        begin
          if field[x+i,y+j] = 1 then exit;
          if field[x-i,y+j] = 1 then exit;
          if field[x+j,y+i] = 1 then exit;
          if field[x+j,y-i] = 1 then exit;
        end;

  dist :=true;
end;

begin
  fillchar(field,sizeof(field),0);
  n := 3500;
  m := 3700;
  pp := 800;
  randseed := 41534559;
  for i:=1 to n do
    for j:=1 to m do
      if i mod 500 = 0 then field[i,j] := 1;
  for i:=1 to n do
    for j:=1 to m do
      if j mod 500 = 0 then field[i,j] := 1;

  for i:=1 to n do
    for j:=1 to m do
      if (i mod 500 = 50) and (j mod 500 = 50) then
        tree(i,j,random(4));

  for i:=1 to n do
    for j:=1 to m do
      if i mod 100 = 0 then field[i,j] := 1;
  for i:=1 to n do
    for j:=1 to m do
      if j mod 100 = 0 then field[i,j] := 1;

  writeln(n,' ',m);
  for i:=1 to n do
    begin
      for j:=1 to m do write(1-field[i,j]);
      writeln;
    end;
end.