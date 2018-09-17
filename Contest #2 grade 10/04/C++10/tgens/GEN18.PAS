const
  max = 4500;
var
  field:array[0..max,0..max]of byte;
  n,m,i,j,k,i1,j1,i2,j2,c:integer;
begin
  fillchar(field,sizeof(field),0);
  n:=3000;
  m:=3000;
  randseed := 9982342;
  for k:=1 to 1000 do
    begin
      i1 := random(n)+1;
      j1 := random(n)+1;
      i2 := i1 + random(n-i1);
      j2 := j1 + random(m-j1);
      c := random(2);
      if random(100) < 50 then
        begin
          if i2 > i1 + 10 then i2 := i1 + 5 +random(5);
        end
      else
        begin
          if j2 > j1 + 10 then j2 := j1 + 5 +random(5);
        end;

     for i:=i1 to i2 do
       for j:=j1 to j2 do
         field[i,j] := c;
    end;

  writeln(n,' ',m);
  for i:=1 to n do
    begin 
      for j:=1 to m do write(field[i,j]);
      writeln;
    end;
end.