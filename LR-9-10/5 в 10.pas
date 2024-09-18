program p5v10;
var
  a: array[1..8, 1..8] of integer;
  Arr: array[1..8] of integer;
  i, k, max, count: integer;
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
    max := a[i, 1]; // присваиваем первый элемент строки как максимальный
    count := 0; // счетчик максимальных элементов в строке

    for k := 2 to 8 do
    begin
      if (a[i, k] > max) then
      begin
        max := a[i, k]; // находим максимальный элемент строки
        count := 1; // обнуляем счетчик и устанавливаем его равным 1
      end
      else if (a[i, k] = max) then
      begin
        count := count + 1; // увеличиваем счетчик максимальных элементов
      end;
    end;

    if (count = 1) then
    begin
      Arr[i] := 1; // единственный максимум в строке
    end
    else
    begin
      Arr[i] := -1; // несколько максимумов в строке
    end;
  end;

  // вывод одномерного массива
  for i := 1 to 8 do
  begin
    write(Arr[i], ' ');
  end;
end.