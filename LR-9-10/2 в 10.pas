program p2v10;
var
  a: array[1..8, 1..6] of Integer;
  Ar: array[1..8] of Integer;
  i, k: Integer;
begin
  // Инициализация двумерного массива
  for i := 1 to 8 do
  begin
    for k := 1 to 6 do
      begin
      a[i,k] := Random(20) - 10;  
      Write(a[i,k]:3);
    end;
    Writeln;
  end;
   
  // формируем одномерный массив
  for i := 1 to 8 do
  begin
    Ar[i] := 1; // предполагаем, что в строке нет отрицательных чисел
    for k := 1 to 6 do
    begin
      if a[i, k] < 0 then
      begin
        Ar[i] := -1; // если находим отрицательное число, меняем значение в одномерном массиве
        break; 
      end;
    end;
  end;
  writeln('Исходный массив:');
  for i := 1 to 8 do
  begin
    for k := 1 to 6 do
      write(a[i, k]:4);
    writeln;
  end;

  writeln('Одномерный массив:');
  for i := 1 to 8 do
    write(Ar[i]:4);
end.