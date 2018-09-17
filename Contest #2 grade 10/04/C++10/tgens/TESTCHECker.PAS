type
 integer = longint;
const
 max = 4000;
 maxk = 256000;
 maxsize = 4500;
 maxqueue = maxsize*maxsize;
 dir:array[0..1,1..2]of integer = ((0,1),(1,0));
var
  field:array[0..maxsize,0..maxsize]of byte;
  queue:array[0..maxqueue,1..2] of integer;
  n,m,k:integer;
  i,j,l,r:integer;
  xp,yp,x,y,t,d:integer;

begin
  fillchar(field, sizeof(field),1);
  xp := -1;
  yp := -1;
  read(n,m,k);
  if (n < 1) or (n > max) or (m < 1) or (m > max) or (k<0) or (k > maxk) then
    begin
      writeln('Error - wrong parameters ',n,' ',m,' ',k);
      exit;
    end;
  for i:=1 to k do
    begin
      read(t,x,y,d);
      if (x < xp) or ((x=xp)and(y <=yp)) then
        writeln('Error - wrong sequence of cell at strip #',i);
      if (t < 0) or (t > 1) then
        writeln('Error - wrong type ',t,' of the strip #',i);
      if (d < 1) then
        writeln('Error - wrong length ',d,' of the strip #',i);
      if (x < 1) or (y < 1) or (x + d*dir[t,1] > n+1) or (y + d*dir[t,2] > m+1)
        then writeln('Error - out of field in the strip #',i);

      if (t = 0) or (t = 1) then
      if not( (x < 1) or (y < 1) or (x + d*dir[t,1] > n+1) or (y + d*dir[t,2] > m+1)) then
        for j:=0 to d-1 do
          field[x + j*dir[t,1], y + j*dir[t,2]] := 0;
      xp := x;
      yp := y;
    end;
  l:=0;
  r:=0;
  for i:=1 to n do
    for j:=1 to m do
      if (field[i,j] = 1) and (field[i-1,j] = 0) then
        begin
          if ((field[i-1,j-1] = 1) and (field[i,j-1] = 0))
           or((field[i-1,j+1] = 1) and (field[i,j+1] = 0)) then
             begin
               writeln('Error - coner touch ',i,' ',j);  
               break;
             end;
        end;
  
  for i:=1 to n do
   begin
    for j:=1 to m do
      if (i=1) or (i=n )or (j=1) or (j=m) then
        if field[i,j] = 0 then
          begin
            queue[1,1] := i;
            queue[1,2] := j;
            field[i,j] := 2;
            r:=1;
            break;
          end;
    if r  >0 then break;
   end;
  field[queue[1,1], queue[1,2]] :=2;
  while l < r do
    begin
      inc(l);
      x := queue[l,1];
      y := queue[l,2];

      for i := -1 to 1 do
        for j := -1 to 1 do
          if abs(i)+abs(j) = 1 then
            if (x+i>0)and(y+j>0)and(x+i<=n)and(y+j<=m) then
              if field[x+i,y+j] = 0 then
                begin
                  inc(r);
                  queue[r,1] := x+i;
                  queue[r,2] := y+j;
                  field[x+i,y+j] := 2;
                end;
    end;
  for i:=1 to n do
    for j:=1 to m do
      if field[i,j] = 0 then
        begin
          writeln('Error -  paper was cut in several pieces');
          break;
        end;
end.
