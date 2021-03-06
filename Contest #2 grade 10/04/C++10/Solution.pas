const
  infile = 'c.in';
  outfile = 'c.out';
type
 integer = longint;
const
 maxsize = 4500;
var
  field:array[0..2,0..maxsize]of byte;
  level:array[0..maxsize]of integer;
  n,m,k:integer;
  i,j,ll:integer;
  x,y,t,d:integer;
  cur,next,prev:integer;
  ncell,nangle:integer;
  vm:integer;

procedure readstrip;
begin
  if k > 0 then read(t,x,y,d)
  else
    begin
      x := n+1;
      y := m+1;
      k := 0;
    end;
  dec(k);
end;

procedure calc;
var
 i:integer;
begin
  for i:=1 to m do
    if field[cur,i] = 1 then
      begin
        inc(ncell);
        if field[prev,i-1] = 0 then inc(nangle,1-field[prev,i] - field[cur,i-1]);
        if field[prev,i+1] = 0 then inc(nangle,1-field[prev,i] - field[cur,i+1]);
        if field[next,i-1] = 0 then inc(nangle,1-field[next,i] - field[cur,i-1]);
        if field[next,i+1] = 0 then inc(nangle,1-field[next,i] - field[cur,i+1]);
      end;
end;


begin
  assign(input, infile);
  reset(input);
  assign(output,outfile);
  rewrite(output);
  read(vm);
  read(n,m,k);
  readstrip;

  fillchar(field, sizeof(field),0);
  fillchar(level, sizeof(level),0);
  ll := 0;
  i:=1;
  j:=1;
  ncell := 0;
  nangle := 0;
  prev := 0;
  cur := 1;
  next := 2;
  while i <= n do
    begin
      if (x = i) and (y=j) then
        begin
          if t = 1 then begin if level[j] < i+d then level[j] := i+d end
          else if ll < j+d then ll:=j+d;
          readstrip;
        end;

      if (j < ll) or (i < level[j]) then field[next,j] := 0 else field[next,j] := 1;
      inc(j);
      if (j > m) then
        begin
          calc;
          if i = 25 then
            j:=1;
          j:=1;
          ll :=0;
          inc(i);
          prev := cur;
          cur := next;
          next := (next+1)mod 3;
        end;
    end;
   fillchar(field[next], sizeof(field[0]),0);
   calc;
   if vm=1 then 
     writeln(ncell)
   else
     writeln(nangle div 4);
   close(input);
   close(output);
end.
