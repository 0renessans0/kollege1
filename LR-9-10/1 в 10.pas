program p1v10;
var
  a: array[1..6, 1..8] of Integer;
  Ar: array[1..6] of Integer;
  i, k: Integer;
begin
  // Инициализация двумерного массива
  for i := 1 to 6 do
  begin
    for k := 1 to 8 do
    begin
      a[i,k] := Random(20) - 10;  
      Write(a[i,k]:3);
    end;
    Writeln;
  end;
  
  for i := 1 to 6 do
  begin
    Ar[i] := 0;
    for k := 1 to 8 do
    begin
      if (abs(a[i,k]) > 4) then
      begin
        Ar[i] := a[i,k];
        Break;
      end;
    end;
  end;

  Writeln('Одномерный массив:');
  for i := 1 to 6 do
  begin
    Write(Ar[i]:3);
  end;

  Readln;
end.