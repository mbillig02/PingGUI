unit Version;

interface
  function GetBuildInfoString(FileName: String): String;

implementation

uses
  Windows, SysUtils;
{========================================================================}
function GetBuildInfo(FileName: String; var V1, V2, V3, V4: Word): Boolean;
var
  VerInfoSize,
  VerValueSize,
  Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  Result := false;
  V1 := 0;
  V2 := 0;
  V3 := 0;
  V4 := 0;
  try
    VerInfoSize := GetFileVersionInfoSize(PChar(FileName), Dummy);
    GetMem(VerInfo, VerInfoSize);
    try
      FillChar(VerInfo^, VerInfoSize, 0);
      GetFileVersionInfo(PChar(FileName), 0, VerInfoSize, VerInfo);
      if VerInfo <> nil then
      begin
        VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
        with VerValue^ do
        begin
          V1 := dwFileVersionMS shr 16;
          V2 := dwFileVersionMS and $FFFF;
          V3 := dwFileVersionLS shr 16;
          V4 := dwFileVersionLS and $FFFF;
        end;
        Result := true;
      end;
    finally
      FreeMem(VerInfo, VerInfoSize);
    end;
  except
    Result := false;
  end;
end;
{========================================================================}
function GetBuildInfoString(FileName: String): String;
var
  V1, V2, V3, V4: Word;
  S: String;
  rc: Boolean;
begin
  S := '';
  rc := GetBuildInfo(FileName, V1, V2, V3, V4);
  if rc then
    S := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
         IntToStr(V3) + '.' + IntToStr(V4);
  Result := S;
end;
{========================================================================}
end.
