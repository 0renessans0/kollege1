program p4v10;
var
  a: array[1..8, 1..8] of integer;
  Arr: array[1..8] of integer;
  i, k, sum: integer;
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
    Arr[i] := a[i, 1]; // присваиваем первый элемент строки

    for k := 2 to 8 do
    begin
      if (a[i, k] < Arr[i]) then
      begin
        Arr[i] := a[i, k]; // находим минимальный элемент строки
      end;
    end;
  end;

  // нахождение среднего арифметического одномерного массива
  sum := 0;
  for i := 1 to 8 do
  begin
    sum := sum + Arr[i];
  end;
  
  if (sum mod 8 = 0) then
    writeln('Одномерный массив содержит свое среднее арифметическое')
  else
    writeln('Одномерный массив не содержит свое среднее арифметическое');
end.