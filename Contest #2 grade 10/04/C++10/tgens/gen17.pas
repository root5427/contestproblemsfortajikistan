var
  i:integer;
begin
  writeln('1 4000 ');
for i:=1 to 4000 do
  if (i < 2345) or (i > 3456) then write('1') else write('0');
end.