const
n=15;
var
  arr:array [1..n] of integer;
  i:integer;
  begin
    randomize;
    for i:=1 to n do
       begin
      arr[i]:=random(201)-100;
      write(arr[i],' ');
      end;
      writeln;
      for i:=1 to n do
        begin
        if arr[i]>0 then writeln('номер первого положительного элемента в массиве ',i, ' ')
          else write('0');
          end;    
     end.
