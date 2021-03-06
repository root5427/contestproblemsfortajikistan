const
  max = 2500;
  dir:array[0..3]of record x,y:integer end = ((x:1;y:0),(x:0;y:1),(x:-1;y:0),(x:0;y:-1));
var
  field:array[0..max,0..max]of byte;
  n,m,i,j:integer;
  pp:integer;

function rotate(var d:integer):integer;
begin
 if random(10) < 5 then d := (d+1)mod 4 else d := (d+3) mod 4;
end;

procedure burrow(x,y,l,d:integer);
var
  i,j,dx,dy:integer;
begin
  for i:=1 to l do
    begin
      field[x,y]:=0;
      if (random(1000) < pp ) then rotate(d);
      while (x+dir[d].x <= 0) or (x + dir[d].x > n) or (y+dir[d].y <= 0) or (y + dir[d].y > m) do
        rotate(d);
      x := x + dir[d].x;
      y := y + dir[d].y;
    end;
end;

begin
  fillchar(field,sizeof(field),1);
  n := 99;
  m := 98;
  pp := 50;
  randseed := 4563459;
  burrow(n div 2, 1,1700,1);
  pp := 150;
  for i:=1 to 20 do
    burrow(30 + random(n div 2), 40  + random(50), 50+ random(50),random(4));

  writeln(n,' ',m);
  for i:=1 to n do
    begin
      for j:=1 to m do write(field[i,j]);
      writeln;
    end;
end.