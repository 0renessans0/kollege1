unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);

var
  a, d, S1, S: Double;
begin
  // Вычисляем сторону квадрата
  a := Sqrt(S);

  // Вычисляем длину диагонали
  d := Sqrt(2) * a;

  // Вычисляем площадь круга, описанного вокруг квадрата
  S1 := Pi * (d*d/ 4);

  // Выводим результаты
  Label2.Caption:='Сторона квадрата a = ' + FloatToStr(a);
  Label3.Caption:='Диагональ d = ' + FloatToStr(d);
  Label4.Caption:='Площадь круга S1 = ' + FloatToStr(S1);
end;
end.

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.Label3Click(Sender: TObject);
begin

end;

procedure TForm1.Label4Click(Sender: TObject);
begin

end;

end.

