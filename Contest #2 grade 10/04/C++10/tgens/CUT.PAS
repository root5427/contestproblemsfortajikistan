type
  integer = longint;
const
 maxsize = 4500;
 maxqueue = maxsize*maxsize;
 dir:array[0..1,1..2]of integer = ((0,1),(1,0));
var
  field:array[0..maxsize,0..maxsize]of byte;
  queue:array[0..maxqueue,1..2] of integer;
  list:array[0..maxqueue,1..4]of integer;
  level:array[0..maxsize] of integer;
  maxl:array[0..1,0..maxsize,0..maxsize]of integer;
  n,m,k:integer;
  i,j,l,r,l0,l1:integer;
  xp,yp,x,y,t,d:integer;

  seltype, ltype,pp:integer;

function readcell:byte;
var
  c:char;
begin
  c :=#0;
  while (c<>'0')and(c<>'1') do read(c);
  if c = '0' then readcell := 0 else readcell := 1;
end;


var
  code:system.integer;
begin

  val(paramstr(1), randseed, code);
  if code <> 0 then randseed := 4985633;
  val(paramstr(2), seltype, code);
  if code <> 0 then seltype := 2;
  val(paramstr(3), ltype, code);
  if code <> 0 then ltype := 4;
  val(paramstr(4), pp, code);
  if (pp < 0) or (pp > 2000) then pp := 500;

  fillchar(field, sizeof(field),0);
  read(n,m);
  for i:=1 to n do
      for j:=1 to m do field[i,j] := readcell;

  for i:=1 to n do
    for j:=1 to m do
      if (field[i,j] = 1) and (field[i-1,j] = 0) then
        begin
          if ((field[i-1,j-1] = 1) and (field[i,j-1] = 0)) then
            begin
              field[i-1,j] := 1;
              field[i,j-1] := 1;
            end;
          if ((field[i-1,j+1] = 1) and (field[i,j+1] = 0)) then
            begin
              field[i-1,j] := 1;
              field[i,j+1] := 1;
            end
        end;

  l:=0;
  r:=0;
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
      if field[i,j] = 0 then field[i,j] := 1;

  for i := n+1 downto 1 do
    for j:=m+1 downto 1 do
      if field[i,j] = 2 then
        begin
          maxl[0,i,j] := maxl[0,i,j+1]+1;
          maxl[1,i,j] := maxl[1,i+1,j]+1;
        end
      else
        begin
          maxl[0,i,j] := 0;
          maxl[1,i,j] := 0;
          field[i,j] := 0;
        end;

  fillchar(level, sizeof(level),0);

  k:=0;
  for i:=1 to n do
    begin
      level[0] := 0;
      for j:=1 to m do
        if field[i,j] = 2 then
           if ((j >= level[0]) and (i >= level[j])) or (random(1000) < pp ) then
             begin
               if seltype = 0 then d := 0;
               if seltype = 1 then d := 1;
               if seltype = 2 then
                begin
                 if random(1000) < 500 then d := 0 else d:=1;
                end;

               l0 := maxl[0,i,j];
               l1 := maxl[1,i,j];

               if seltype = 3 then
                begin
                 if l0 > l1 then d := 0
                 else
                   if l0<l1 then d := 1
                   else
                     if random(1000) < 500 then d := 0 else d:=1;
                 end;

               if d = 0 then r:=l0 else r:=l1;

               if ltype = 0 then l := r;
               if ltype = 1 then l := random(r)+1;
               if ltype = 2 then l := r div 2  +random(r div 2) + 1;
               if ltype = 3 then l := random(r div 2) + 1;
               if ltype = 4 then l := r div 3  +random(r div 3) + 1;
               if ltype = 5 then l := r div 2  +random(r) + 1;
               if ltype = 6 then l := r div 3  +random(r) + 1;
               if l < 1 then l:=1;
               if l > r then l:=r;
               inc(k);
               list[k,1]:=d;
               list[k,2]:=i;
               list[k,3]:=j;
               list[k,4]:=l;
               if d = 0 then begin if level[0] < j+l then level[0] := j+l; end
               else begin if level[j] < i+l then level[j] := i+l; end;

             end;
    end;





  writeln(n,' ',m,' ',k);
  for i:=1 to k do
    begin
      for j:=1 to 4 do write(list[i,j],' ');
      writeln;
    end;

end.
