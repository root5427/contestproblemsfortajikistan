const fin='a.in';
      fout='a.out';

const maxn=100;
      maxm=100;


var n:integer;
    points:array[1..maxn] of integer;
    bonus:integer;
    m:integer;
    p:integer;

    i,j:integer;
    flag:boolean;
    cur:integer;
    max:integer;

begin
assign(input,fin);
assign(output,fout);
reset(input);
rewrite(output);

read(n);
for i:=1 to n do read(points[i]);
read(bonus);
read(m);
max:=0;
for j:=1 to m do begin
  flag:=true;
  cur:=0;
  for i:=1 to n do begin
    read(p);
    if p=0 then flag:=false
    else cur:=cur+points[i];
    end;
  if flag then cur:=cur+bonus;
  cur:=cur - 2*(j-1);
  if cur>max then max:=cur;
  writeln(max);
  end;
close(input);
close(output);
end.




