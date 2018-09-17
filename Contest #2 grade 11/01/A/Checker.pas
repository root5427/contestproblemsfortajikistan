uses testlib;

begin
while not ans.seekeof do begin
  if ans.readinteger<>ouf.readinteger then quit(_WA,'');
  end;

quit(_OK,'');
end.