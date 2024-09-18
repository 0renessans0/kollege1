uses
  GraphABC; // Подключение библиотеки GraphABC для работы с графикой

function CompareWithEpsilon(a, b, epsilon: real): boolean; // Определение функции сравнения двух вещественных чисел с заданной погрешностью
begin
  Result := Abs(a - b) < epsilon; // Возвращает true, если абсолютная разница между a и b меньше epsilon
end;

function PolynomialFunction(x: real): real; // Определение функции для полинома от x
begin
  Result := x**3+(-1)*x**2+(1)*x+(14); // Вычисление значения полинома для заданного x
end;

procedure DrawLine(x1, y1, x2, y2: real); // Определение процедуры для рисования линии на графическом окне
begin
  Line(Round(x1), Round(y1), Round(x2), Round(y2)); // Рисование линии с использованием округленных координат
end;

procedure DrawAxes; // Определение процедуры для рисования осей x и y на графическом окне
begin
  SetPenColor(clBlack); // Установка цвета пера на черный
  Line(0, WindowHeight div 2, WindowWidth, WindowHeight div 2); // Рисование оси x
  Line(WindowWidth div 2, 0, WindowWidth div 2, WindowHeight); // Рисование оси y

  // Рисование меток на оси x
  for var x: integer := -10 to 10 do
  begin
    TextOut(WindowWidth div 2 + x * 25 - 5, WindowHeight div 2 + 5, IntToStr(x)); // Отображение числовых меток на оси x
    Line(WindowWidth div 2 + x * 25, WindowHeight div 2 - 3, WindowWidth div 2 + x * 25, WindowHeight div 2 + 3); // Рисование меток на оси x
  end;

  // Рисование меток на оси y
  for var y: integer := -10 to 10 do
  begin
    TextOut(WindowWidth div 2 - 20, WindowHeight div 2 - y * 25 - 5, IntToStr(y)); // Отображение числовых меток на оси y
    Line(WindowWidth div 2 - 3, WindowHeight div 2 - y * 25, WindowWidth div 2 + 3, WindowHeight div 2 - y * 25); // Рисование меток на оси y
  end;
end;

procedure vvod; // Определение процедуры для вывода инструкций по вводу
begin
  writeln('Какое значение или погрешность хотите узнать?'); // Вывод текстовой подсказки на русском
  writeln('1 - точное, 2 - приблизительное, 3 - относительная погрешность, 4 - абсолютная погрешность '); // Вывод текстовой подсказки на русском
  writeln('Чтобы завершить программу введите 0'); // Вывод текстовой подсказки на русском
end;

function MidpointRectangleMethod(levo, pravo, h: real): real; // Определение функции для метода средних прямоугольников
var
  x_i, area: real; // Объявление переменных для x_i и площади
  c, otr: integer; // Объявление переменных для управления циклом и интервалов
begin
  Result := 0; // Инициализация переменной результата
  otr := Round((pravo - levo) / h); // Вычисление количества интервалов
  for c := 0 to otr - 1 do
  begin
    x_i := levo + (c + 0.5) * h; // Вычисление средней точки между левым и правым концами интервала
    area := h * PolynomialFunction(x_i); // Вычисление площади прямоугольника
    Result := Result + area; // Накопление общей площади
  end;
end;

var
  levo, pravo, s, d, h, x_i: real; // Объявление переменных для границ интервала, результата, шага и x_i
  c, otr, v: integer; // Объявление переменных для управления циклом и пользовательского ввода
  epsilon: real; // Объявление переменной для допустимой погрешности

begin
  SetWindowSize(800, 600); // Установка размеров графического окна

  DrawAxes; // Вызов процедуры для рисования осей x и y

  writeln('Введите левый интервал от -10 до 10 = '); // Вывод текстовой подсказки на русском
  readln(levo); // Считывание пользовательского ввода для левой границы интервала
  writeln('Введите правый интервал от -10 до 10 = '); // Вывод текстовой подсказки на русском
  readln(pravo); // Считывание пользовательского ввода для правой границы интервала
  write('Введите ширину прямоугольников (шаг) = '); // Вывод текстовой подсказки
  readln(h); // Считывание пользовательского ввода для шага
  write('Введите погрешность = '); // Вывод текстовой подсказки
  readln(epsilon); // Считывание пользовательского ввода для допустимой погрешности
  s := MidpointRectangleMethod(levo, pravo, h); // Вычисление интеграла с использованием метода средних прямоугольников
  d := (PolynomialFunction(pravo) - PolynomialFunction(levo)) / 2; // Вычисление точного значения интеграла

  // Рисование кривой функции с использованием метода средних прямоугольников
  SetPenColor(clBlue); // Установка цвета пера на синий
  for c := 0 to otr - 1 do
  begin
    x_i := levo + (c + 0.5) * h; // Вычисление x_i для каждого интервала
    DrawLine(WindowWidth div 2 + x_i * 25, WindowHeight div 2 - PolynomialFunction(x_i) * 25,
             WindowWidth div 2 + (x_i + h) * 25, WindowHeight div 2 - PolynomialFunction(x_i + h) * 25); // Рисование отрезка для каждого интервала
  end;

  repeat // Начало цикла для пользовательского ввода
    vvod; // Вызов процедуры для отображения инструкций по вводу
    read(v); // Считывание пользовательского ввода
    case v of // Начало оператора выбора на основе ввода пользователя
      1:
      begin
        writeln('точное значение = ', abs(d):0:3); // Вывод точного значения интеграла
      end;
      2:
      begin
        writeln('приблизительное значение = ', abs(s):0:3); // Вывод приближенного значения интеграла
      end;
      3:
      begin
        writeln('относительная погрешность = ', abs(d - s) / d:0:3); // Вывод относительной погрешности приближенного значения
      end;
      4:
      begin
        writeln('абсолютная погрешность = ', abs(d - s):0:3); // Вывод абсолютной погрешности приближенного значения
      end;
    end;
  until v = 0; // Продолжение цикла до тех пор, пока пользователь не введет 0
end.