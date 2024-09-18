const
n=15;
var
  arr:array [1..n] of integer;
  i,p:integer;
  begin
    writeln;
    for i:=1 to n do
    begin
      arr[i]:=random(201)-100;
      write(arr[i],' ');
      end;
      writeln;
      begin
        if arr[i] mod 2=0 then p:=p*(arr[i]);
      end;
      writeln('произведение четных чисел массива ',p);
  end.
  