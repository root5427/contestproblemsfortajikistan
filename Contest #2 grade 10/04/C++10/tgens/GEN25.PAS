const
  max = 4500;
var
  field:array[0..max,0..max]of byte;
  n,m,i,j:integer;

procedure ss(i1,j1,i2,j2:integer);
var
 i,j,jj,cc:integer;
begin

 if j1+3>j2 then exit;
 for j:=j1 to j2 do
   field[i1,j] := 1;
 for i:=i1 to i2 do
   field[i,j1] := 1;
 for i:=i1 to i2 do
   field[i,j2] := 1;
 cc := 3+random(2);
 j:= j1;
 while j < j2 do
   begin
     jj := j + random((j2-j1)div cc)*2+1;
     if jj <= j2 then ss(i1+5, j+2,i2,jj-2)
     else ss(i1+5, j+2,i2,j2-2);
     for i:=i1 to i2 do
        field[i,j] := 1;
     j:=jj;
   end;
end;


begin
  fillchar(field,sizeof(field),0);
  n:=100;
  m:=4000;
  randseed := 3498767;

  ss(1,1,n,m);
  for j:=1 to m do
    field[n div 2,j] := 1;

  writeln(n,' ',m);
  for i:=n downto 1 do
    begin 
      for j:=1 to m do write(1-field[i,j]);
      writeln;
    end;
end.