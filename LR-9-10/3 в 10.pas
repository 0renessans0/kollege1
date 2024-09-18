program p3v10;
var
  a: array[1..8, 1..8] of integer;
  Arr: array[1..8] of integer;
  i, k: integer;
begin
  // заполнение исходного массива случайными числами
  for i := 1 to 8 do
  begin
    for k := 1 to 8 do
    begin
      a[i, k] := random(10); // случайное число от 0 до 9
      write(a[i, k], ' ');
    end;
    writeln();
  end;

  // формирование одномерного массива
  for i := 1 to 8 do
  begin
    Arr[i] := -1; // по умолчанию значение -1

    for k := 1 to 7 do
    begin
      if (a[i, k] + a[i, k + 1] = 7) then
      begin
        Arr[i] := 1;
        break;
      end;
    end;
  end;

  for i := 1 to 8 do
  begin
    write(Arr[i], ' ');
  end;
end.