var
  i:integer;
begin
  writeln('4000 1');
for i:=1 to 4000 do
  if (i < 1234) or (i > 2345) then write('1') else write('0');
end.