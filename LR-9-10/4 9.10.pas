const
  MAX_SIZE = 100; // максимальный размер массива

var
  arr1, arr2: array[1..MAX_SIZE] of Integer; // два одномерных массива
  n, i, sum1, sum2: Integer; // переменные для размера массива, циклов и суммы положительных элементов

begin
  // Ввод размера массива
  writeln('Введите размер массива (не более ', MAX_SIZE, '): ');
  readln(n);

  // Ввод элементов первого массива
  writeln('Введите элементы первого массива:');
  for i := 1 to n do
  begin
    write('arr1[', i, '] = ');
    readln(arr1[i]);
  end;

  // Ввод элементов второго массива
  writeln('Введите элементы второго массива:');
  for i := 1 to n do
  begin
    write('arr2[', i, '] = ');
    readln(arr2[i]);
  end;

  // Вычисление суммы положительных элементов первого массива
  sum1 := 0;
  for i := 1 to n do
  begin
    if arr1[i] > 0 then
      sum1 := sum1 + arr1[i];
  end;

  // Вычисление суммы положительных элементов второго массива
  sum2 := 0;
  for i := 1 to n do
  begin
    if arr2[i] > 0 then
      sum2 := sum2 + arr2[i];
  end;

  // Печать обоих массивов
  writeln('Первый массив:');
  for i := 1 to n do
    write(arr1[i], ' ');

  writeln();

  writeln('Второй массив:');
  for i := 1 to n do
    write(arr2[i], ' ');

  writeln();

  // Проверка и умножение массива
  if sum2 < sum1 then
  begin
    writeln('Сумма положительных элементов второго массива меньше, умножаем его на 10');

    for i := 1 to n do
      arr2[i] := arr2[i] * 10;
  end
  else
  begin
    writeln('Сумма положительных элементов второго массива не меньше, не умножаем');
  end;

  // Печать измененного второго массива
  writeln('Измененный второй массив:');
  for i := 1 to n do
    write(arr2[i], ' ');

  readln;
end.