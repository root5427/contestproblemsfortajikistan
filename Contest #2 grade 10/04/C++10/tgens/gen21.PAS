type
 integer = longint;
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
  n := 600;
  m := 800;
  pp := 10;
  randseed := 45345459;
  burrow(n div 2, 1,70000,1);
  n := n * 5;
  m := m * 5;
  writeln(n,' ',m);
  for i:=1 to n do
    begin
      for j:=1 to m do write(field[(i+4) div 5,(j+4) div 5]);
      writeln;
    end;
end.