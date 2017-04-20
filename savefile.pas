unit savefile;

interface

uses
  Windows, Messages, SysUtils;

procedure saveResult;

var
  saveFileName,
  APIName : string;

implementation

uses main, trust;

procedure saveResult;
var
  f : TextFile;
  i : integer;
begin
  AssignFile(f,saveFileName);
  Rewrite(f);
  Append(f);
  Writeln(f, 'Результаты оценки времени выполнения API-функции ' + APIName);
  for i := 0 to getIndex - 1 do
    Writeln(f, 'F(' + inttostr(i + 1) + ') = ' + floattostr(APIResult[i]));
  Writeln(f, 'Среднее время выполнения функции - ' + floattostr(getSumm));
  Writeln(f, 'Стандартное отклонение - ' + floattostr(getSigma));
  Writeln(f, 'Доверительная вероятность - ' + trustP);
  Writeln(f, 'Левая граница доверительного интервала - ' + floattostr(getLTrust));
  Writeln(f, 'Правая граница доверительного интервала - ' + floattostr(getRTrust));
  Flush(f);
  CloseFile(f);
end;

end.
