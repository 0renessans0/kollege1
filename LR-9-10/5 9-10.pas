const
  n= 10; 
var
  arr1, arr2: array[1..n] of Integer;
  i, max, min: Integer;
begin
  Randomize;
  for i := 1 to n do
  begin
    arr1[i]:= Random(101);
    arr2[i]:= Random(101);
  end;
  WriteLn('Исходный массив arr1:');
  for i:= 1 to n do
    Write(arr1[i], ' ');
  WriteLn();
  WriteLn('Исходный массив arr2:');
  for i := 1 to n do
    Write(arr2[i], ' ');
  WriteLn();
  max:= 1;
  for i := 2 to n do
  begin
    if arr1[i] > arr1[max] then
      max:= i;
  end;
  min:= 1;
  for i := 2 to n do
  begin
    if arr2[i] < arr2[min] then
      min := i;
  end;
  if max< min then
    arr1[max] := 0
  else
    for i := min+1 to n do
      arr2[i] := arr2[i] * 2;
  WriteLn('Измененный массив arr1:');
  for i := 1 to n do
    Write(arr1[i], ' ');
  WriteLn();
  WriteLn('Измененный массив arr2:');
  for i := 1 to n do
    Write(arr2[i], ' ');
  ReadLn;
end.