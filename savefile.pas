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
  Writeln(f, '���������� ������ ������� ���������� API-������� ' + APIName);
  for i := 0 to getIndex - 1 do
    Writeln(f, 'F(' + inttostr(i + 1) + ') = ' + floattostr(APIResult[i]));
  Writeln(f, '������� ����� ���������� ������� - ' + floattostr(getSumm));
  Writeln(f, '����������� ���������� - ' + floattostr(getSigma));
  Writeln(f, '������������� ����������� - ' + trustP);
  Writeln(f, '����� ������� �������������� ��������� - ' + floattostr(getLTrust));
  Writeln(f, '������ ������� �������������� ��������� - ' + floattostr(getRTrust));
  Flush(f);
  CloseFile(f);
end;

end.
