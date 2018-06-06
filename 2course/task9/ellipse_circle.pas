﻿unit Ellipse_Circle;

interface

uses
  Classes, SysUtils, Circle_Figure;

type
  TEllipse = class(TCircle) {Класс элипс, наследует класс TCircle}
  private {Используем только в этом классе}
    r2: integer;
  public
    constructor Create(ax, ay, ar, ar2: integer);
    procedure Show; override;
    procedure Turn;
  end;

implementation

uses unit1;

constructor TEllipse.Create(ax, ay, ar, ar2: integer); {Создание элипса}
begin
  inherited Create(ax, ay); {Вызов процедуры из класса Кругов}
  r := ar;
  r2 := ar2;
end;

procedure TEllipse.Show; {Просмотр элипса}
begin
  form1.image1.canvas.ellipse(x - r, y - r2, x + r, y + r2);
end;

procedure TEllipse.Turn; {Поворот элипса}
begin
  Show;
  if r > r2 then
  begin
    r := r - 90;
    r2 := r2 + 90;
  end
  else
  begin
    r := r + 90;
    r2 := r2 - 90;
  end;
  TEllipse.Create(x, y, r, r2);
  Show;
end;

end.
