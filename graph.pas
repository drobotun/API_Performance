unit graph;

interface

uses
  Windows, SysUtils, Graphics;

procedure clearWorkRect;
procedure setGraph;

implementation

uses main, trust;

var
  workRect : TRect;

procedure clearWorkRect;
begin
  mainForm.graphPaintBox.Color := clCream;
  workRect.Left := 0;
  workRect.Top := 0;
  workRect.Right := 790;
  workRect.Bottom := 288;
  with mainForm do begin
    graphPaintBox.Canvas.FillRect(workRect);
    graphPaintBox.Canvas.MoveTo(780, 20);
    graphPaintBox.Canvas.LineTo(50,20);
    graphPaintBox.Canvas.LineTo(50, 278);
  end;
end;

procedure setHorPoint(X, Y : integer; text : string);
var
  oldWidth : integer;
begin
  with mainForm do begin
    oldWidth := graphPaintBox.Canvas.Pen.Width;
    graphPaintBox.Canvas.Pen.Color := clBlack;
    graphPaintBox.Canvas.Pen.Width := 3;
    graphPaintBox.Canvas.MoveTo(X, Y - 2);
    graphPaintBox.Canvas.LineTo(X, Y + 2);
    graphPaintBox.Canvas.TextOut(X - round(graphPaintBox.Canvas.TextWidth(text) / 2),
                                 Y - (3 + graphPaintBox.Canvas.TextHeight(text)),
                                 text);
    graphPaintBox.Canvas.Pen.Width := oldWidth;
  end;
end;

procedure setVertPoint(X, Y : integer; text : string);
var
  oldWidth : integer;
begin
  with mainForm do begin
    oldWidth := graphPaintBox.Canvas.Pen.Width;
    graphPaintBox.Canvas.Pen.Color := clBlack;
    graphPaintBox.Canvas.Pen.Width := 3;
    graphPaintBox.Canvas.MoveTo(X - 2, Y);
    graphPaintBox.Canvas.LineTo(X + 2, Y);
    graphPaintBox.Canvas.TextOut(X - (6 + graphPaintBox.Canvas.TextWidth(text)),
                                 Y - round(graphPaintBox.Canvas.TextHeight(text) / 2),
                                 text);
    graphPaintBox.Canvas.Pen.Width := oldWidth;
  end;
end;

procedure setPoint(X, Y : integer);
var
  oldWidth : integer;
  oldColor : TColor;
begin
  if ((Y > 20) and (Y < 278)) then begin
    with mainForm do begin
      oldWidth := graphPaintBox.Canvas.Pen.Width;
      oldColor := graphPaintBox.Canvas.Pen.Color;
      graphPaintBox.Canvas.Pen.Width := 3;
      graphPaintBox.Canvas.Pen.Color := clRed;
      graphPaintBox.Canvas.MoveTo(X - 2, Y);
      graphPaintBox.Canvas.LineTo(X + 2, Y);
      graphPaintBox.Canvas.MoveTo(X, Y - 2);
      graphPaintBox.Canvas.LineTo(X, Y + 2);
      graphPaintBox.Canvas.Pen.Width := oldWidth;
      graphPaintBox.Canvas.Pen.Color := oldColor;
    end;
  end;
end;

procedure setTrustLine;

begin
  with mainForm do begin

  end;
end;

procedure setGraph;
var
  i,
  deltaX,
  pointY,
  zoom : integer;
  scale : real;
  oldStyle : TPenStyle;
  oldColor : TColor;
begin
  if (strtoint(mainForm.zoomEdit.Text) > mainForm.zoomUpDown.Max) then
    mainForm.zoomEdit.Text := inttostr(mainForm.zoomUpDown.Max);
  if (strtoint(mainForm.zoomEdit.Text) < mainForm.zoomUpDown.Min) then
    mainForm.zoomEdit.Text := inttostr(mainForm.zoomUpDown.Min);
  if (strtoint(mainForm.indexEdit.Text) > mainForm.indexUpDown.Max) then
    mainForm.indexEdit.Text := inttostr(mainForm.indexUpDown.Max);
  if (strtoint(mainForm.indexEdit.Text) < mainForm.indexUpDown.Min) then
    mainForm.indexEdit.Text := inttostr(mainForm.indexUpDown.Min);
  clearWorkRect;
  zoom := mainForm.zoomUpDown.Position;
  setHorPoint(50, 20, '0');
  setVertPoint(50, 20, floattostrf(getLTrust / zoom, ffFixed, 8, 6));
  deltaX := round(740 / (getIndex + 1));
  for i := 1 to getIndex do begin
    setHorPoint((deltaX * i) + 50, 20, inttostr(i));
    oldStyle := mainForm.graphPaintBox.Canvas.Pen.Style;
    mainForm.graphPaintBox.Canvas.Pen.Style := psDot;
    mainForm.graphPaintBox.Canvas.MoveTo((deltaX * i) + 50, 20);
    mainForm.graphPaintBox.Canvas.LineTo((deltaX * i) + 50, 278);
    mainForm.graphPaintBox.Canvas.Pen.Style := oldStyle;
  end;
  setVertPoint(50, 85, floattostrf(getLTrust / zoom + (getSumm - getLTrust / zoom) / 2,
                                   ffFixed, 8, 6));
  setVertPoint(50, 149, floattostrf(getSumm, ffFixed, 8, 6));
  setVertPoint(50, 214, floattostrf(getRTrust * zoom - (getRTrust * zoom - getSumm) / 2,
                                   ffFixed, 8, 6));
  setVertPoint(50, 278, floattostrf(getRTrust * 3, ffFixed, 8, 6));
  mainForm.graphPaintBox.Canvas.Pen.Style := psDot;
  mainForm.graphPaintBox.Canvas.MoveTo(50, 85);
  mainForm.graphPaintBox.Canvas.LineTo(780, 85);
  mainForm.graphPaintBox.Canvas.MoveTo(50, 149);
  mainForm.graphPaintBox.Canvas.LineTo(780, 149);
  mainForm.graphPaintBox.Canvas.MoveTo(50, 214);
  mainForm.graphPaintBox.Canvas.LineTo(780, 214);
  mainForm.graphPaintBox.Canvas.MoveTo(50, 278);
  mainForm.graphPaintBox.Canvas.LineTo(780, 278);
  mainForm.graphPaintBox.Canvas.Pen.Style := oldStyle;
  scale := ((getRTrust * zoom) - (getLTrust / zoom)) / 258;
  for i := 0 to getIndex - 1 do begin
    pointY := 149 - round((getSumm - APIresult[i]) / scale);
    setPoint((deltaX * (i + 1)) + 50, pointY);
  end;
  with mainForm do begin
    oldStyle := graphPaintBox.Canvas.Pen.Style;
    oldColor := graphPaintBox.Canvas.Pen.Color;
    graphPaintBox.Canvas.Pen.Style := psDot;
    graphPaintBox.Canvas.Pen.Color := clBlue;
    if trustLCheckBox.Checked then begin
      graphPaintBox.Canvas.MoveTo(50, 149 - round((getSumm - getLTrust) / scale));
      graphPaintBox.Canvas.LineTo(780, 149 - round((getSumm - getLTrust) / scale));
    end;
    if trustRCheckBox.Checked then begin
      graphPaintBox.Canvas.MoveTo(50, 149 + round((getSumm - getLTrust) / scale));
      graphPaintBox.Canvas.LineTo(780, 149 + round((getSumm - getLTrust) / scale));
    end;
    graphPaintBox.Canvas.Pen.Style := oldStyle;
    graphPaintBox.Canvas.Pen.Color := oldColor;
  end;
end;

end.
