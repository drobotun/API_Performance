unit check;

interface

uses
  Windows, SysUtils;

procedure checkCreateFile;
procedure checkReadFile;
procedure checkDeleteFile;
procedure checkMoveFile;
procedure checkWriteFile;
procedure checkCopyFile;
procedure checkRemoveDirectory;
procedure checkCreateDirectory;

implementation

uses main, trust, dir;

procedure checkCreateFile;
var
  FileHandle : THandle;
  iCounterPerSec,
  StartTime,
  EndTime    : TLargeInteger;
  i : integer;
begin
  QueryPerformanceFrequency(iCounterPerSec);
  for i:= 0 to getIndex - 1 do begin
    QueryPerformanceCounter(StartTime);
    FileHandle := CreateFile(PChar(dirName + '\test.txt'),
                             GENERIC_WRITE,
                             FILE_SHARE_WRITE,
                             nil,
                             OPEN_ALWAYS,
                             FILE_ATTRIBUTE_NORMAL,
                             0);
    QueryPerformanceCounter(EndTime);
    APIresult[i] := (EndTime - StartTime)/iCounterPerSec;
    CloseHandle(FileHandle);
  end;
end;

procedure checkReadFile;
var
  Buf        : array[1..100] of char;
  ByteNum    : cardinal;
  FileHandle : THandle;
  iCounterPerSec,
  StartTime,
  EndTime    : TLargeInteger;
  i : integer;
  str : string;
begin
  str := 'Test string for API ReadFile';
  FileHandle := CreateFile(PChar(dirName + '\read_test.txt'),
                           GENERIC_READ,
                           FILE_SHARE_READ,
                           nil,
                           OPEN_ALWAYS,
                           FILE_ATTRIBUTE_NORMAL,
                           0);
  WriteFile(FileHandle,
             PChar(str)^,
             length(str),
             ByteNum,
             nil);
  QueryPerformanceFrequency(iCounterPerSec);
  for i:= 0 to getIndex - 1 do begin
    QueryPerformanceCounter(StartTime);
    ReadFile(FileHandle,
             Buf,
             sizeof(Buf),
             ByteNum,
             nil);
    QueryPerformanceCounter(EndTime);
    APIresult[i] := (EndTime - StartTime)/iCounterPerSec;
  end;
  CloseHandle(FileHandle);
end;

procedure checkDeleteFile;
var
  FileHandle : THandle;
  iCounterPerSec,
  StartTime,
  EndTime    : TLargeInteger;
  i : integer;
begin
  QueryPerformanceFrequency(iCounterPerSec);
  FileHandle := CreateFile(PChar(dirName + '\delete_test.txt'),
                           GENERIC_WRITE,
                           FILE_SHARE_WRITE,
                           nil,
                           OPEN_ALWAYS,
                           FILE_ATTRIBUTE_NORMAL,
                           0);
  for i:= 0 to getIndex - 1 do begin
    QueryPerformanceCounter(StartTime);
    DeleteFile(dirName + '\delete_test.txt');
    QueryPerformanceCounter(EndTime);
    APIresult[i] := (EndTime - StartTime)/iCounterPerSec;
  end;
  CloseHandle(FileHandle);
end;

procedure checkMoveFile;
var
  FileHandle : THandle;
  iCounterPerSec,
  StartTime,
  EndTime    : TLargeInteger;
  i : integer;
begin
  FileHandle := CreateFile(PChar(dirName + '\move_test.txt'),
                           GENERIC_WRITE,
                           FILE_SHARE_WRITE,
                           nil,
                           OPEN_ALWAYS,
                           FILE_ATTRIBUTE_NORMAL,
                           0);
  QueryPerformanceFrequency(iCounterPerSec);
  for i:= 0 to getIndex - 1 do begin
    QueryPerformanceCounter(StartTime);
    MoveFile(PChar(dirName + '\move_test.txt'),
             PChar(dirName + '\move_test_copy.txt'));
    QueryPerformanceCounter(EndTime);
    APIresult[i] := (EndTime - StartTime)/iCounterPerSec;
  end;
  DeleteFile(dirName + '\move_test_copy.txt');
  CloseHandle(FileHandle);
end;

procedure checkWriteFile;
var
  Buf        : string;
  ByteNum    : cardinal;
  FileHandle : THandle;
  iCounterPerSec,
  StartTime,
  EndTime    : TLargeInteger;
  i : integer;
begin
  FileHandle := CreateFile(PChar(dirName + '\write_test.txt'),
                           GENERIC_WRITE,
                           FILE_SHARE_WRITE,
                           nil,
                           OPEN_ALWAYS,
                           FILE_ATTRIBUTE_NORMAL,
                           0);
  Buf := '1234567890';
  QueryPerformanceFrequency(iCounterPerSec);
  for i:= 0 to getIndex - 1 do begin
    QueryPerformanceCounter(StartTime);
    WriteFile(FileHandle,
             PChar(Buf)^,
             length(Buf),
             ByteNum,
             nil);
    QueryPerformanceCounter(EndTime);
    APIresult[i] := (EndTime - StartTime)/iCounterPerSec;
  end;
  CloseHandle(FileHandle);
  DeleteFile(dirName + '\write_test.txt');
end;

procedure checkCopyFile;
var
  iCounterPerSec,
  StartTime,
  EndTime    : TLargeInteger;
  i : integer;
begin
  QueryPerformanceFrequency(iCounterPerSec);
  for i:= 0 to getIndex - 1 do begin
    QueryPerformanceCounter(StartTime);
    CopyFile(PChar(dirName + '\test.txt'),
             PChar(dirName + '\test_copy.txt'),
             false);
    QueryPerformanceCounter(EndTime);
    APIresult[i] := (EndTime - StartTime)/iCounterPerSec;
  end;
  DeleteFile(dirName + '\test_copy.txt');
end;

procedure checkRemoveDirectory;
var
  iCounterPerSec,
  StartTime,
  EndTime    : TLargeInteger;
  i : integer;
begin
  QueryPerformanceFrequency(iCounterPerSec);
  for i:= 0 to getIndex - 1 do begin
    CreateDirectory(PChar(dirName + '\test'), nil);
    QueryPerformanceCounter(StartTime);
    RemoveDirectory(PChar(dirName + '\test'));
    QueryPerformanceCounter(EndTime);
    APIresult[i] := (EndTime - StartTime)/iCounterPerSec;
  end;
end;

procedure checkCreateDirectory;
var
  iCounterPerSec,
  StartTime,
  EndTime    : TLargeInteger;
  i : integer;
begin
  QueryPerformanceFrequency(iCounterPerSec);
  for i:= 0 to getIndex - 1 do begin
    QueryPerformanceCounter(StartTime);
    CreateDirectory(PChar(dirName + '\test'), nil);
    QueryPerformanceCounter(EndTime);
    RemoveDirectory(PChar(dirName + '\test'));
    APIresult[i] := (EndTime - StartTime)/iCounterPerSec;
  end;
end;


end.
