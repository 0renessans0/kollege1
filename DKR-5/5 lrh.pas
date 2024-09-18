uses
  ABCObjects; // Подключение библиотеки ABCObjects для работы с объектами ABC

const
  MaxArraySize = 10000; // Определение максимального размера массива

type
  TArray = array of Integer; // Определение типа массива целых чисел

type
  TComparatorFunc = function(A, B: Integer): Boolean; // Определение типа функции-компаратора

function GetMaxValue(const A: TArray): Integer; // Функция поиска максимального значения в массиве
var
  i, MaxValue: Integer;
begin
  if Length(A) = 0 then
    Result := 0
  else
  begin
    MaxValue := A[0];
    for i := 1 to High(A) do
      if A[i] >= MaxValue then
        MaxValue := A[i];
    Result := MaxValue;
  end;
end;

function MyCompareFunc(A, B: Integer): Boolean; // Пример пользовательской функции-компаратора
begin
  // Реализуйте ваше сравнение здесь
  Result := A < B;
end;

procedure BubbleSort(var A: TArray; Comparator: TComparatorFunc); // Процедура сортировки пузырьком
var
  i, j, temp: Integer;
begin
  for i := 0 to High(A) - 1 do
    for j := 0 to High(A) - i - 1 do
      if Comparator(A[j + 1], A[j]) then
      begin
        temp := A[j];
        A[j] := A[j + 1];
        A[j + 1] := temp;
      end;
end;

procedure Merge(var A: TArray; Left, Middle, Right: Integer; Comparator: TComparatorFunc); // Процедура слияния для сортировки слиянием
var
  LeftSize, RightSize, i, j, k: Integer;
  LeftArray, RightArray: TArray;
begin
  LeftSize := Middle - Left + 1;
  RightSize := Right - Middle;

  SetLength(LeftArray, LeftSize);
  SetLength(RightArray, RightSize);

  for i := 0 to LeftSize - 1 do
    LeftArray[i] := A[Left + i];

  for j := 0 to RightSize - 1 do
    RightArray[j] := A[Middle + 1 + j];

  i := 0;
  j := 0;
  k := Left;

  while (i < LeftSize) and (j < RightSize) do
  begin
    if Comparator(LeftArray[i], RightArray[j]) then
    begin
      A[k] := LeftArray[i];
      Inc(i);
    end
    else
    begin
      A[k] := RightArray[j];
      Inc(j);
    end;
    Inc(k);
  end;

  while i < LeftSize do
  begin
    A[k] := LeftArray[i];
    Inc(i);
    Inc(k);
  end;

  while j < RightSize do
  begin
    A[k] := RightArray[j];
    Inc(j);
    Inc(k);
  end;
end;

procedure MergeSort(var A: TArray; Left, Right: Integer; Comparator: TComparatorFunc); // Процедура сортировки слиянием
var
  Middle: Integer;
begin
  if Left < Right then
  begin
    Middle := (Left + Right) div 2;

    MergeSort(A, Left, Middle, Comparator);
    MergeSort(A, Middle + 1, Right, Comparator);

    Merge(A, Left, Middle, Right, Comparator);
  end;
end;

var
  InputFileName, OutputFileName: string;

procedure ProcessData; // Процедура обработки данных
var
  InputFile, OutputFile: Text;
  InputData: TArray;
  InputValue: Integer;
  i, SortOption: Integer;
begin
Assign(InputFile, InputFileName);
Reset(InputFile);
Assign(OutputFile, OutputFileName);
Rewrite(OutputFile);
SetLength(InputData, 0);
while not Eof(InputFile) do
begin
ReadLn(InputFile, InputValue);
SetLength(InputData, Length(InputData) + 1);
InputData[High(InputData)] := InputValue;
end;
Close(InputFile);
WriteLn('Исходные данные:');
for i := 0 to High(InputData) do
WriteLn(InputData[i]);
WriteLn('Выберите вариант сортировки:');
WriteLn('1. Сортировка пузырьком');
WriteLn('2. Сортировка слиянием');
ReadLn(SortOption);
case SortOption of
    1:
    begin
      BubbleSort(InputData, MyCompareFunc);
      WriteLn('Отсортированные данные (Сортировка пузырьком):');
    end;
    2:
    begin
      MergeSort(InputData, 0, High(InputData), MyCompareFunc);
      WriteLn('Отсортированные данные (Сортировка слиянием):');
    end;
  else
    WriteLn('Неверный вариант. Вариант сортировки не распознан.');
    Exit;
  end;

  for i := 0 to High(InputData) do
    WriteLn(OutputFile, InputData[i]);

  Close(OutputFile);

  WriteLn('Данные обработаны и сохранены в ', OutputFileName);
end;

procedure Main; // Основная процедура
begin
  InputFileName := 'input.txt';
  OutputFileName := 'output.txt';

  ProcessData;
end;

begin
  Main;
end.