const
  max = 2500;
  ww = 1;
  dir:array[0..3]of record x,y:integer end = ((x:1;y:0),(x:0;y:1),(x:-1;y:0),(x:0;y:-1));
var
  field:array[0..max,0..max]of byte;
  n,m,i,j:integer;
  pp:integer;


procedure tree(x,y,d,u:integer);
var
  i,j,l:integer;
begin
  l := 2;
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
      if random(1000) < pp then tree(x + l*dir[d].x, y+l*dir[d].y, i,u-1);
end;

begin
  fillchar(field,sizeof(field),0);
  n := 1900;
  m := 1900;
  pp := 700;
  randseed := 4635459;
  tree(n div 2, 1,1,30);
  for i:=1 to m do
    field[n div 2,i] := 1;
  writeln(n*2,' ',m*2);
  for i:=1 to n*2 do
    begin
      for j:=1 to m*2 do write(1-field[(i+1)div 2,(j+1) div 2]);
      writeln;
    end;
end.