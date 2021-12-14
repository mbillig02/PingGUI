unit MFUnit;

interface

uses
  Windows, Messages, Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  SysUtils, Classes, IdIcmpClient, IdBaseComponent, IdComponent, IdRawBase, IdRawClient,
  Spin, OverbyteIcsWndControl, OverbyteIcsPing, Buttons, TeEngine, Series,
  TeeProcs, Chart, ComCtrls, FileCtrl, PingThrd, JvExExtCtrls,
  JvExtComponent, JvClock, JvComponentBase,
  JvRollOut, VclTee.TeeGDIPlus, OverbyteIcsSmtpProt, JvBalloonHint,
  System.Actions, Vcl.ActnList, Vcl.Menus;

const
  clPing1C = clGreen;
  clPing2C = clBlue;
  clPing3C = $000080FF; //Orange
  clPing4C = clFuchsia;
  clPing5C = clBlack;
  clPing6C = clRed;
  clPing7C = $00808040;
  clPing8C = clPurple;
  clPingTimeout = clWhite;

type
  TMainForm = class(TForm)
    TopPanel: TPanel;
    ContinuousPingSpdBtn1, ContinuousPingSpdBtn2, ContinuousPingSpdBtn3, ContinuousPingSpdBtn4: TSpeedButton;
    DisplayMemo1, DisplayMemo2, DisplayMemo3, DisplayMemo4: TMemo;
    HostComboBox1, HostComboBox2, HostComboBox3, HostComboBox4: TComboBox;
    PingSeries1, PingSeries2, PingSeries3, PingSeries4: TLineSeries;
    Timer1, Timer2, Timer3, Timer4: TTimer;
    PingChart: TChart;
    SecondsToShowComboBox: TComboBox;
    PingIntervalSpinEdit: TSpinEdit;
    Splitter: TSplitter;
    MemoPanel: TPanel;
    Label1L: TLabel;
    Label1A: TLabel;
    Label1H: TLabel;
    Label1LTT: TLabel;
    Label2L: TLabel;
    Label2A: TLabel;
    Label2H: TLabel;
    Label2LTT: TLabel;
    Label3L: TLabel;
    Label3A: TLabel;
    Label3H: TLabel;
    Label3LTT: TLabel;
    Label4L: TLabel;
    Label4A: TLabel;
    Label4H: TLabel;
    Label4LTT: TLabel;
    LogChkBox: TCheckBox;
    OpenLogDirBtn: TSpeedButton;
    SelectLogDirBtn: TSpeedButton;
    LogPanel: TPanel;
    ZipCsvBtn: TSpeedButton;
    AutoZipJvClock: TJvClock;
    TopPanel2: TPanel;
    ContinuousPingSpdBtn5: TSpeedButton;
    ContinuousPingSpdBtn6: TSpeedButton;
    ContinuousPingSpdBtn7: TSpeedButton;
    ContinuousPingSpdBtn8: TSpeedButton;
    Label5L: TLabel;
    Label5H: TLabel;
    Label5A: TLabel;
    Label5LTT: TLabel;
    Label6L: TLabel;
    Label6H: TLabel;
    Label6A: TLabel;
    Label6LTT: TLabel;
    Label7L: TLabel;
    Label7H: TLabel;
    Label7A: TLabel;
    Label7LTT: TLabel;
    Label8L: TLabel;
    Label8H: TLabel;
    Label8A: TLabel;
    Label8LTT: TLabel;
    HostComboBox5: TComboBox;
    HostComboBox6: TComboBox;
    HostComboBox7: TComboBox;
    HostComboBox8: TComboBox;
    Timer5: TTimer;
    Timer6: TTimer;
    Timer7: TTimer;
    Timer8: TTimer;
    ColorDialog: TColorDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    DisplayMemo5: TMemo;
    DisplayMemo6: TMemo;
    DisplayMemo7: TMemo;
    DisplayMemo8: TMemo;
    Label1T: TLabel;
    Label4T: TLabel;
    Label2T: TLabel;
    Label3T: TLabel;
    Label5T: TLabel;
    Label6T: TLabel;
    Label7T: TLabel;
    Label8T: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CBPanel: TPanel;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    DtaDirBtn: TSpeedButton;
    DtaDirJvBalloonHint: TJvBalloonHint;
    MainMenu: TMainMenu;
    ActionList: TActionList;
    aClearHosts: TAction;
    mmiClearHosts: TMenuItem;
    aHostListEditor: TAction;
    mmiHostListEditor: TMenuItem;
    aStartPingingAllHosts: TAction;
    mmiStartPingingAllHosts: TMenuItem;
    aStopPingingAllHosts: TAction;
    mmiStopPingingAllHosts: TMenuItem;
    aSaveToCmdFile: TAction;
    mmiSaveToCmdFile: TMenuItem;
    aClearGraph: TAction;
    mmiClearGraph: TMenuItem;
    mmiVersionAbout: TMenuItem;
    aAbout: TAction;
    aDisplayLog: TAction;
    mmiDisplayLog: TMenuItem;
    a4or8: TAction;
    mmi4or8: TMenuItem;
    mmiManageHosts: TMenuItem;
    aLast7DaysSummaryReport: TAction;
    aMonthOfSummaryReports: TAction;
    mmiReports: TMenuItem;
    mmiLast7DaysSummaryReport: TMenuItem;
    mmiMonthOfSummaryReports: TMenuItem;
    mmiFile: TMenuItem;
    mmiMisc: TMenuItem;
    aExit: TAction;
    mmiExit: TMenuItem;
    procedure TimerTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SecondsToShowComboBoxChange(Sender: TObject);
    procedure PingIntervalSpinEditChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ContinuousPingSpdBtn1Click(Sender: TObject);
    procedure ContinuousPingSpdBtn2Click(Sender: TObject);
    procedure ContinuousPingSpdBtn3Click(Sender: TObject);
    procedure ContinuousPingSpdBtn4Click(Sender: TObject);
    procedure OpenLogDirBtnClick(Sender: TObject);
    procedure SelectLogDirBtnClick(Sender: TObject);
    procedure LogChkBoxClick(Sender: TObject);
    procedure ZipCsvBtnClick(Sender: TObject);
    procedure AutoZipJvClockAlarm(Sender: TObject);
    procedure SaveSettings;
    procedure ContinuousPingSpdBtn5Click(Sender: TObject);
    procedure ContinuousPingSpdBtn6Click(Sender: TObject);
    procedure ContinuousPingSpdBtn7Click(Sender: TObject);
    procedure ContinuousPingSpdBtn8Click(Sender: TObject);
    procedure AverageLabelMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure LabelxTMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LabelxTMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PingChartResize(Sender: TObject);
    procedure OpenDirectory(DirectoryName: String);
    procedure DtaDirBtnMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure HostComboBoxChange(Sender: TObject);
    function GetLstDir: String;
    procedure aClearHostsExecute(Sender: TObject);
    procedure aHostListEditorExecute(Sender: TObject);
    procedure aStartPingingAllHostsExecute(Sender: TObject);
    procedure aStopPingingAllHostsExecute(Sender: TObject);
    procedure aSaveToCmdFileExecute(Sender: TObject);
    procedure aClearGraphExecute(Sender: TObject);
    procedure aAboutExecute(Sender: TObject);
    procedure aDisplayLogExecute(Sender: TObject);
    procedure a4or8Execute(Sender: TObject);
    procedure aLast7DaysSummaryReportExecute(Sender: TObject);
    procedure aMonthOfSummaryReportsExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
  private
    FInitialized: Boolean;
    FLogOpen: Boolean;
    procedure Display1(Msg: String);
    procedure Display2(Msg: String);
    procedure Display3(Msg: String);
    procedure Display4(Msg: String);
    procedure LoadSettings;
    procedure AddToLog(TextToLog: ShortString);
    procedure CsvZipMgr;
    procedure UpdateLoggingState;
    procedure PingThreadTermPing(Sender: TObject);
    procedure DoPingThread(PingThreadId: Integer; HostToPing: String);
    procedure UpdateColors;
    procedure Display5(Msg: String);
    procedure Display6(Msg: String);
    procedure Display7(Msg: String);
    procedure Display8(Msg: String);
    procedure DeleteOldZips;
    procedure Display(const Msg: String);
    procedure ResetTimeDisplay;
    function SummaryReport(const ZipFileName: String;
      const IPSelectList: TStringList; const OutDir: String): String;
    procedure DaySummaryReport(const DaysToRpt: Integer);
    procedure ProcessCSVFiles(CSVPath, OutputFileName: String; IPSelectList: TStringList);
    procedure MonthOfSummaryReports(const YearMonth: TDate);
    procedure MemoBGColor(TheMemo: TMemo; FontColor: TColor);
    procedure SizeControls;
    procedure SetSecond4Visibility(Second4Visible: Boolean);
    procedure RightMenu;
  public
  end;

var
  MainForm: TMainForm;
  ShowTestControls: Boolean;
  LogDir: String;

implementation

uses Registry, UtlUnit, About, ShellAPI, DateUtils, HLEUnit,
  PadUnit, PerlRegEx, jclSysInfo, IniFiles, DLUnit, ClipBrd, System.Zip, System.UITypes;

var
  SecondsToShow, DaysToKeep: Integer;
  ChartLineColorA: array[1..8] of TColor;
  ExeDir, DtaDir, ZipDir, TmpDir, RptDir, TmpRptDir, LogFileName, PgmUpdDir, LstDir: String;
  LogFileStream: TFileStream;
  LogMinute: Word;
  Ping1Active, Ping2Active, Ping3Active, Ping4Active: Boolean;
  Ping5Active, Ping6Active, Ping7Active, Ping8Active: Boolean;
  ChkBoxState1, ChkBoxState2, ChkBoxState3, ChkBoxState4,
  ChkBoxState5, ChkBoxState6, ChkBoxState7, ChkBoxState8: Boolean;

{$R *.DFM}


function GetTextWidth(InText: String; InFont: TFont): Integer;
var
  c: TBitmap;
begin
  c := TBitmap.Create;
  try
    c.Canvas.Font.Assign(InFont);
    Result := c.Canvas.TextWidth(InText);
  finally
    c.Free;
  end;
end;

function Occurrences(const Substring, Text: String): Integer;
var
  Offset: Integer;
begin
  Result := 0;
  Offset := PosEx(Substring, Text, 1);
  while Offset <> 0 do
  begin
    Inc(Result);
    Offset := PosEx(Substring, Text, Offset + Length(Substring));
  end;
end;

function StringToIPAddress(const IPAddress: String): Cardinal;
var
  Str: String;
  Answer: Cardinal;
  i, Pz: Integer;
  Tmp: Integer;
begin
  Str := IPAddress;
  Answer := 0;
  try
    for i := 0 to 3 do
    begin
      Pz := Pos('.', Str);
      if Pz <= 0 then Pz := Length(Str) + 1;
      if PZ = 1 then Raise EConvertError.Create(IPAddress + ' is not a valid IP address');
      Tmp := StrToInt(Copy(Str, 1, Pz - 1));
      Delete(Str, 1, Pz);
      if (Tmp < 0) or (Tmp > 255) then Raise EConvertError.Create(IPAddress + ' is not a valid IP address');
      Answer := (Answer shl 8) + Byte(Tmp);
    end;
  except
    Raise EConvertError.Create(IPAddress + ' is not a valid IP address');
  end;
  StringToIPAddress := Answer;
end;

function ComputerName: String;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer
  else
    Result := '';
end;

// https://stackoverflow.com/questions/11594084/shift-in-the-right-of-last-item-of-the-menu
Procedure TMainForm.RightMenu; // Shift in the right of last item of the menu
var
  mii: TMenuItemInfo;
  MainMenu: hMenu;
  Buffer: array[0..79] of Char;
begin
  MainMenu := Self.Menu.Handle;
  mii.cbSize := SizeOf(mii);
  mii.fMask := MIIM_TYPE;
  mii.dwTypeData := Buffer;
  mii.cch := SizeOf(Buffer);
  GetMenuItemInfo(MainMenu, mmiVersionAbout.Command, False, mii);
  mii.fType := mii.fType or MFT_RIGHTJUSTIFY;
  if SetMenuItemInfo(MainMenu, mmiVersionAbout.Command, False, mii) then DrawMenuBar(Self.Menu.WindowHandle);
end;

procedure TMainForm.Display1(Msg: String);
begin
  while DisplayMemo1.Lines.Count >= PingChart.Series[0].Count do DisplayMemo1.Lines.Delete(0);
  if Length(Trim(DisplayMemo1.Lines.Strings[0])) = 0 then DisplayMemo1.Lines.Delete(0);
  DisplayMemo1.Lines.Append(Msg);
end;

procedure TMainForm.Display2(Msg: String);
begin
  while DisplayMemo2.Lines.Count >= PingChart.Series[1].Count do DisplayMemo2.Lines.Delete(0);
  if Length(Trim(DisplayMemo2.Lines.Strings[0])) = 0 then DisplayMemo2.Lines.Delete(0);
  DisplayMemo2.Lines.Append(Msg);
end;

procedure TMainForm.Display3(Msg: String);
begin
  while DisplayMemo3.Lines.Count >= PingChart.Series[2].Count do DisplayMemo3.Lines.Delete(0);
  if Length(Trim(DisplayMemo3.Lines.Strings[0])) = 0 then DisplayMemo3.Lines.Delete(0);
  DisplayMemo3.Lines.Append(Msg);
end;

procedure TMainForm.Display4(Msg: String);
begin
  while DisplayMemo4.Lines.Count >= PingChart.Series[3].Count do DisplayMemo4.Lines.Delete(0);
  if Length(Trim(DisplayMemo4.Lines.Strings[0])) = 0 then DisplayMemo4.Lines.Delete(0);
  DisplayMemo4.Lines.Append(Msg);
end;

procedure TMainForm.Display5(Msg: String);
begin
  while DisplayMemo5.Lines.Count >= PingChart.Series[4].Count do DisplayMemo5.Lines.Delete(0);
  if Length(Trim(DisplayMemo5.Lines.Strings[0])) = 0 then DisplayMemo5.Lines.Delete(0);
  DisplayMemo5.Lines.Append(Msg);
end;

procedure TMainForm.Display6(Msg: String);
begin
  while DisplayMemo6.Lines.Count >= PingChart.Series[5].Count do DisplayMemo6.Lines.Delete(0);
  if Length(Trim(DisplayMemo6.Lines.Strings[0])) = 0 then DisplayMemo6.Lines.Delete(0);
  DisplayMemo6.Lines.Append(Msg);
end;

procedure TMainForm.Display7(Msg: String);
begin
  while DisplayMemo7.Lines.Count >= PingChart.Series[6].Count do DisplayMemo7.Lines.Delete(0);
  if Length(Trim(DisplayMemo7.Lines.Strings[0])) = 0 then DisplayMemo7.Lines.Delete(0);
  DisplayMemo7.Lines.Append(Msg);
end;

procedure TMainForm.Display8(Msg: String);
begin
  while DisplayMemo8.Lines.Count >= PingChart.Series[7].Count do DisplayMemo8.Lines.Delete(0);
  if Length(Trim(DisplayMemo8.Lines.Strings[0])) = 0 then DisplayMemo8.Lines.Delete(0);
  DisplayMemo8.Lines.Append(Msg);
end;

procedure TMainForm.LabelxTMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  IncludeHost: Boolean;
begin

  if Button = mbLeft then IncludeHost := True else IncludeHost := False;

  ChkBoxState1 := CheckBox1.Checked; CheckBox1.Checked := not IncludeHost;
  ChkBoxState2 := CheckBox2.Checked; CheckBox2.Checked := not IncludeHost;
  ChkBoxState3 := CheckBox3.Checked; CheckBox3.Checked := not IncludeHost;
  ChkBoxState4 := CheckBox4.Checked; CheckBox4.Checked := not IncludeHost;
  ChkBoxState5 := CheckBox5.Checked; CheckBox5.Checked := not IncludeHost;
  ChkBoxState6 := CheckBox6.Checked; CheckBox6.Checked := not IncludeHost;
  ChkBoxState7 := CheckBox7.Checked; CheckBox7.Checked := not IncludeHost;
  ChkBoxState8 := CheckBox8.Checked; CheckBox8.Checked := not IncludeHost;

  case (Sender as TLabel).Tag of
    1: CheckBox1.Checked := IncludeHost;
    2: CheckBox2.Checked := IncludeHost;
    3: CheckBox3.Checked := IncludeHost;
    4: CheckBox4.Checked := IncludeHost;
    5: CheckBox5.Checked := IncludeHost;
    6: CheckBox6.Checked := IncludeHost;
    7: CheckBox7.Checked := IncludeHost;
    8: CheckBox8.Checked := IncludeHost;
  end;

  PingChart.Series[0].Visible := CheckBox1.Checked;
  PingChart.Series[1].Visible := CheckBox2.Checked;
  PingChart.Series[2].Visible := CheckBox3.Checked;
  PingChart.Series[3].Visible := CheckBox4.Checked;
  PingChart.Series[4].Visible := CheckBox5.Checked;
  PingChart.Series[5].Visible := CheckBox6.Checked;
  PingChart.Series[6].Visible := CheckBox7.Checked;
  PingChart.Series[7].Visible := CheckBox8.Checked;

end;

procedure TMainForm.LabelxTMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  CheckBox1.Checked := ChkBoxState1; PingChart.Series[0].Visible := CheckBox1.Checked;
  CheckBox2.Checked := ChkBoxState2; PingChart.Series[1].Visible := CheckBox2.Checked;
  CheckBox3.Checked := ChkBoxState3; PingChart.Series[2].Visible := CheckBox3.Checked;
  CheckBox4.Checked := ChkBoxState4; PingChart.Series[3].Visible := CheckBox4.Checked;
  CheckBox5.Checked := ChkBoxState5; PingChart.Series[4].Visible := CheckBox5.Checked;
  CheckBox6.Checked := ChkBoxState6; PingChart.Series[5].Visible := CheckBox6.Checked;
  CheckBox7.Checked := ChkBoxState7; PingChart.Series[6].Visible := CheckBox7.Checked;
  CheckBox8.Checked := ChkBoxState8; PingChart.Series[7].Visible := CheckBox8.Checked;
end;

procedure TMainForm.LoadSettings;
var
  i, ItemCount: Integer;
  RegIniFile: TIniFile;
begin

  RegIniFile := TIniFile.Create(DtaDir + 'PingGUI.INI');
  try

    ShowTestControls := RegIniFile.ReadBool('Section-Options', 'ShowTestControls', False);
    SecondsToShowComboBox.ItemIndex := RegIniFile.ReadInteger('Section-Options', 'SecondsToShow', 5);
    TopPanel2.Visible := RegIniFile.ReadBool('Section-Options', 'Second4Visible', False);
    SetSecond4Visibility(TopPanel2.Visible);

    LogDir := RegIniFile.ReadString('Section-Directories', 'LogDir', DtaDir + 'Logs\');
    SysUtils.ForceDirectories(LogDir);
    SelectLogDirBtn.Width := GetTextWidth(LogDir, SelectLogDirBtn.Font) + 10;
    SelectLogDirBtn.Caption := LogDir;
    ZipDir := LogDir + 'ZIP\';
    RptDir := LogDir + 'RPT\';
    SysUtils.ForceDirectories(RptDir);

    AutoZipJvClock.AlarmHour := RegIniFile.ReadInteger('Section-Options', 'AutoZipHour', 0);
    AutoZipJvClock.AlarmMinute := RegIniFile.ReadInteger('Section-Options', 'AutoZipMinute', 0);

    DaysToKeep := RegIniFile.ReadInteger('Section-Options', 'DaysToKeep', 28);

    RegIniFile.ReadSection('HostComboBox', HostComboBox1.Items);
    ItemCount := HostComboBox1.Items.Count;
    HostComboBox1.Clear;
    for i := 0 to ItemCount - 1 do
      HostComboBox1.Items.Append(RegIniFile.ReadString('HostComboBox', IntToStr(i), ''));

    HostComboBox2.Items.Text := HostComboBox1.Items.Text;
    HostComboBox3.Items.Text := HostComboBox1.Items.Text;
    HostComboBox4.Items.Text := HostComboBox1.Items.Text;
    HostComboBox5.Items.Text := HostComboBox1.Items.Text;
    HostComboBox6.Items.Text := HostComboBox1.Items.Text;
    HostComboBox7.Items.Text := HostComboBox1.Items.Text;
    HostComboBox8.Items.Text := HostComboBox1.Items.Text;

    HostComboBox1.Text := RegIniFile.ReadString('Section-Hosts', 'PingHostName1', 'one.one.one.one');
    HostComboBox2.Text := RegIniFile.ReadString('Section-Hosts', 'PingHostName2', 'dns.quad9.net');
    HostComboBox3.Text := RegIniFile.ReadString('Section-Hosts', 'PingHostName3', 'cdns01.comcast.net');
    HostComboBox4.Text := RegIniFile.ReadString('Section-Hosts', 'PingHostName4', 'dns.google');
    HostComboBox5.Text := RegIniFile.ReadString('Section-Hosts', 'PingHostName5', 'dns.comcast.net');
    HostComboBox6.Text := RegIniFile.ReadString('Section-Hosts', 'PingHostName6', 'dns.opendns.com');
    HostComboBox7.Text := RegIniFile.ReadString('Section-Hosts', 'PingHostName7', 'google-public-dns-a.google.com');
    HostComboBox8.Text := RegIniFile.ReadString('Section-Hosts', 'PingHostName8', 'google-public-dns-b.google.com');

    Label1A.Font.Color := RegIniFile.ReadInteger('Section-Color', 'Ping1Color', clPing1C);
    Label2A.Font.Color := RegIniFile.ReadInteger('Section-Color', 'Ping2Color', clPing2C);
    Label3A.Font.Color := RegIniFile.ReadInteger('Section-Color', 'Ping3Color', clPing3C);
    Label4A.Font.Color := RegIniFile.ReadInteger('Section-Color', 'Ping4Color', clPing4C);
    Label5A.Font.Color := RegIniFile.ReadInteger('Section-Color', 'Ping5Color', clPing5C);
    Label6A.Font.Color := RegIniFile.ReadInteger('Section-Color', 'Ping6Color', clPing6C);
    Label7A.Font.Color := RegIniFile.ReadInteger('Section-Color', 'Ping7Color', clPing7C);
    Label8A.Font.Color := RegIniFile.ReadInteger('Section-Color', 'Ping8Color', clPing8C);

  finally
    RegIniFile.Free;
  end;

end;

procedure TMainForm.UpdateLoggingState;
begin
  if not LogChkBox.Checked then
  begin
    if FLogOpen then
    begin
      LogFileStream.Free;
      FLogOpen := False;
    end;
  end;
end;

procedure TMainForm.LogChkBoxClick(Sender: TObject);
begin
  SelectLogDirBtn.Enabled := not LogChkBox.Checked;
  UpdateLoggingState;
  AutoZipJvClock.AlarmEnabled := LogChkBox.Checked;
  if not ZipCsvBtn.Enabled then AutoZipJvClock.AlarmEnabled := False;
  AutoZipJvClock.Visible := AutoZipJvClock.AlarmEnabled;
end;

procedure TMainForm.SaveSettings;
var
  i: Integer;
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(DtaDir + 'PingGUI.INI');
  try

    RegIniFile.WriteBool('Section-Options', 'ShowTestControls', ShowTestControls);
    RegIniFile.WriteInteger('Section-Options', 'SecondsToShow', SecondsToShowComboBox.ItemIndex);
    RegIniFile.WriteBool('Section-Options', 'Second4Visible', TopPanel2.Visible);

    RegIniFile.WriteString('Section-Directories', 'LogDir', LogDir);

    RegIniFile.WriteString('Section-Hosts', 'PingHostName1', HostComboBox1.Text);
    RegIniFile.WriteString('Section-Hosts', 'PingHostName2', HostComboBox2.Text);
    RegIniFile.WriteString('Section-Hosts', 'PingHostName3', HostComboBox3.Text);
    RegIniFile.WriteString('Section-Hosts', 'PingHostName4', HostComboBox4.Text);
    RegIniFile.WriteString('Section-Hosts', 'PingHostName5', HostComboBox5.Text);
    RegIniFile.WriteString('Section-Hosts', 'PingHostName6', HostComboBox6.Text);
    RegIniFile.WriteString('Section-Hosts', 'PingHostName7', HostComboBox7.Text);
    RegIniFile.WriteString('Section-Hosts', 'PingHostName8', HostComboBox8.Text);

    RegIniFile.WriteInteger('Section-Color', 'Ping1Color', Label1A.Font.Color);
    RegIniFile.WriteInteger('Section-Color', 'Ping2Color', Label2A.Font.Color);
    RegIniFile.WriteInteger('Section-Color', 'Ping3Color', Label3A.Font.Color);
    RegIniFile.WriteInteger('Section-Color', 'Ping4Color', Label4A.Font.Color);
    RegIniFile.WriteInteger('Section-Color', 'Ping5Color', Label5A.Font.Color);
    RegIniFile.WriteInteger('Section-Color', 'Ping6Color', Label6A.Font.Color);
    RegIniFile.WriteInteger('Section-Color', 'Ping7Color', Label7A.Font.Color);
    RegIniFile.WriteInteger('Section-Color', 'Ping8Color', Label8A.Font.Color);

    RegIniFile.EraseSection('HostComboBox');
    for i := 0 to HostComboBox1.Items.Count - 1 do
      RegIniFile.WriteString('HostComboBox', IntToStr(i), HostComboBox1.Items[i]);

  finally
    RegIniFile.Free;
  end;

end;

procedure TMainForm.SelectLogDirBtnClick(Sender: TObject);
const
  SelDirHelp = 1000;
var
  TmpDirL: String;
begin
  TmpDirL := LogDir;
  if SelectDirectory(
     TmpDirL,
     [sdAllowCreate,
     sdPerformCreate,
     sdPrompt],
     SelDirHelp
     ) then
  begin
    if Pos('', TmpDirL) = 0 then TmpDirL := IncludeTrailingPathDelimiter(TmpDirL) + 'PingGUI-Logs\';
    LogDir := TmpDirL;
    SysUtils.ForceDirectories(LogDir);
    SelectLogDirBtn.Width := GetTextWidth(LogDir, SelectLogDirBtn.Font) + 10;
    SelectLogDirBtn.Caption := LogDir;
  end;
end;

procedure TMainForm.DeleteOldZips;
var
  SearchRec: TSearchRec;
  FileList: TStringList;
  i, j: Integer;
begin
  FileList := TStringList.Create;
  if FindFirst(ZipDir + ComputerName + '-PingGUI-Logs-*.ZIP', faAnyFile, SearchRec) = 0 then
  begin
    repeat
      FileList.Append(SearchRec.Name);
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;
  for i := 0 to DaysToKeep do
  begin
    j := FileList.IndexOf(ComputerName + '-PingGUI-Logs-' + FmtDateToStr('FULL-YMD', Now-i) + '.ZIP');
    if j <> -1 then FileList.Delete(j);
  end;
  if FileList.Count > 0 then
  begin
    for i := 0 to FileList.Count-1 do
    begin
      MyErase(ZipDir+FileList[i]);
    end;
  end;
  FileList.Free;
end;

procedure TMainForm.DoPingThread(PingThreadId: Integer; HostToPing: String);
begin
  with TPingThread.Create(True) do      // create suspended
  begin
    PingAddThread(ThreadId);            // keep threadid so it's freed
    FreeOnTerminate := True;
    PingId := PingThreadId;             // keep track of the results
    OnTerminate := PingThreadTermPing;  // where we get the response
    PingHostName := HostToPing;         // host name or IP address to ping
    PingTimeout := 4000;                // ms
    PingTTL := 32;                      // hops
    PingLookupReply := False;           // don't need response host name lookup
    Resume;                             // start it now
  end;
end;

procedure TMainForm.OpenDirectory(DirectoryName: String);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(DirectoryName), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

procedure TMainForm.DtaDirBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
   if ssShift in Shift then
  begin
    case Button of
      mbRight:
      begin
        // Shift-Right-Click
      end;
    end;
  end
  else
  begin
    case Button of
      mbLeft:
      begin
        // Left-Click
        OpenDirectory(DtaDir);
      end;
      mbRight:
      begin
        // Right-Click
        DtaDirBtn.Hint := '';
        Clipboard.AsText := DtaDir;
        DtaDirJvBalloonHint.ActivateHint(DtaDirBtn, '(Copied to clipboard)', DtaDir, 4000);
      end;
    end;
  end;

end;

procedure TMainForm.MemoBGColor(TheMemo: TMemo; FontColor: TColor);
var
  TimeOuts: Integer;
begin
  if Pos('timed out', TheMemo.Text) = 0 then TheMemo.Color := clWhite else
  begin
    TimeOuts := Occurrences('timed out', TheMemo.Text);
    case TimeOuts of
      1: TheMemo.Color := RGB(255,255,255-(1*32));
      2: TheMemo.Color := RGB(255,255,255-(2*32));
      3: TheMemo.Color := RGB(255,255,255-(3*32));
      4: TheMemo.Color := RGB(255,255,255-(4*32));
      5: TheMemo.Color := RGB(255,255,255-(5*32));
      6: TheMemo.Color := RGB(255,255,255-(6*32));
      7: TheMemo.Color := RGB(255,255,255-(7*32));
    else
      TheMemo.Color := clYellow;
    end;
  end;
  TheMemo.Font.Color := FontColor;
  if Pos('IP Error',TheMemo.Text) > 0 then
  begin
    TheMemo.Color := clRed;
    TheMemo.Font.Color := clWhite;
  end;
end;

procedure TMainForm.SizeControls;
begin
  Panel1.Width := (MemoPanel.Width div 4) - 1;
  Panel2.Width := (MemoPanel.Width div 4) - 1;
  Panel3.Width := (MemoPanel.Width div 4) - 1;
  Panel4.Width := (MemoPanel.Width div 4) - 1;

  DisplayMemo5.Height := Panel1.Height div 2;
  ContinuousPingSpdBtn1.Left := Panel1.Left;
  HostComboBox1.Left := Panel1.Left;
  Label1L.Left := Panel1.Left + Panel1.Width - (Panel1.Width div 6);
  Label1H.Left := Panel1.Left + Panel1.Width - (Panel1.Width div 6);
  Label1A.Left := Panel1.Left + Panel1.Width - (Panel1.Width div 6);
  Label1T.Left := Panel1.Left + Panel1.Width - ((Panel1.Width div 6) * 2);
  Label1LTT.Left := Panel1.Left + Panel1.Width - ((Panel1.Width div 6) * 2);
  ContinuousPingSpdBtn1.Width := (Label1T.Left - ContinuousPingSpdBtn1.Left) - 10;
  HostComboBox1.Width := ContinuousPingSpdBtn1.Width;
  PostMessage(HostComboBox1.Handle, CB_SETEDITSEL, 0, 0); // unselect text

  DisplayMemo6.Height := Panel2.Height div 2;
  ContinuousPingSpdBtn2.Left := Panel2.Left;
  HostComboBox2.Left := Panel2.Left;
  Label2L.Left := Panel2.Left + Panel2.Width - (Panel2.Width div 6);
  Label2H.Left := Panel2.Left + Panel2.Width - (Panel2.Width div 6);
  Label2A.Left := Panel2.Left + Panel2.Width - (Panel2.Width div 6);
  Label2T.Left := Panel2.Left + Panel2.Width - ((Panel2.Width div 6) * 2);
  Label2LTT.Left := Panel2.Left + Panel2.Width - ((Panel2.Width div 6) * 2);
  ContinuousPingSpdBtn2.Width := (Label2T.Left - ContinuousPingSpdBtn2.Left) - 10;
  HostComboBox2.Width := ContinuousPingSpdBtn2.Width;
  PostMessage(HostComboBox2.Handle, CB_SETEDITSEL, 0, 0); // unselect text

  DisplayMemo7.Height := Panel3.Height div 2;
  ContinuousPingSpdBtn3.Left := Panel3.Left;
  HostComboBox3.Left := Panel3.Left;
  Label3L.Left := Panel3.Left + Panel3.Width - (Panel3.Width div 6);
  Label3H.Left := Panel3.Left + Panel3.Width - (Panel3.Width div 6);
  Label3A.Left := Panel3.Left + Panel3.Width - (Panel3.Width div 6);
  Label3T.Left := Panel3.Left + Panel3.Width - ((Panel3.Width div 6) * 2);
  Label3LTT.Left := Panel3.Left + Panel3.Width - ((Panel3.Width div 6) * 2);
  ContinuousPingSpdBtn3.Width := (Label3T.Left - ContinuousPingSpdBtn3.Left) - 10;
  HostComboBox3.Width := ContinuousPingSpdBtn3.Width;
  PostMessage(HostComboBox3.Handle, CB_SETEDITSEL, 0, 0); // unselect text

  DisplayMemo8.Height := Panel4.Height div 2;
  ContinuousPingSpdBtn4.Left := Panel4.Left;
  HostComboBox4.Left := Panel4.Left;
  Label4L.Left := Panel4.Left + Panel4.Width - (Panel4.Width div 6);
  Label4H.Left := Panel4.Left + Panel4.Width - (Panel4.Width div 6);
  Label4A.Left := Panel4.Left + Panel4.Width - (Panel4.Width div 6);
  Label4T.Left := Panel4.Left + Panel4.Width - ((Panel4.Width div 6) * 2);
  Label4LTT.Left := Panel4.Left + Panel4.Width - ((Panel4.Width div 6) * 2);
  ContinuousPingSpdBtn4.Width := (Label4T.Left - ContinuousPingSpdBtn4.Left) - 10;
  HostComboBox4.Width := ContinuousPingSpdBtn4.Width;
  PostMessage(HostComboBox4.Handle, CB_SETEDITSEL, 0, 0); // unselect text

  ContinuousPingSpdBtn5.Left := ContinuousPingSpdBtn1.Left;
  HostComboBox5.Left := HostComboBox1.Left;
  Label5L.Left := Label1L.Left;
  Label5H.Left := Label1H.Left;
  Label5A.Left := Label1A.Left;
  Label5T.Left := Label1T.Left;
  Label5LTT.Left := Label1T.Left;
  ContinuousPingSpdBtn5.Width := (Label5T.Left - ContinuousPingSpdBtn5.Left) - 10;
  HostComboBox5.Width := ContinuousPingSpdBtn5.Width;
  PostMessage(HostComboBox5.Handle, CB_SETEDITSEL, 0, 0); // unselect text

  ContinuousPingSpdBtn6.Left := ContinuousPingSpdBtn2.Left;
  HostComboBox6.Left := HostComboBox2.Left;
  Label6L.Left := Label2L.Left;
  Label6H.Left := Label2H.Left;
  Label6A.Left := Label2A.Left;
  Label6T.Left := Label2T.Left;
  Label6LTT.Left := Label2T.Left;
  ContinuousPingSpdBtn6.Width := (Label6T.Left - ContinuousPingSpdBtn6.Left) - 10;
  HostComboBox6.Width := ContinuousPingSpdBtn6.Width;
  PostMessage(HostComboBox6.Handle, CB_SETEDITSEL, 0, 0); // unselect text

  ContinuousPingSpdBtn7.Left := ContinuousPingSpdBtn3.Left;
  HostComboBox7.Left := HostComboBox3.Left;
  Label7L.Left := Label3L.Left;
  Label7H.Left := Label3H.Left;
  Label7A.Left := Label3A.Left;
  Label7T.Left := Label3T.Left;
  Label7LTT.Left := Label3T.Left;
  ContinuousPingSpdBtn7.Width := (Label7T.Left - ContinuousPingSpdBtn7.Left) - 10;
  HostComboBox7.Width := ContinuousPingSpdBtn7.Width;
  PostMessage(HostComboBox7.Handle, CB_SETEDITSEL, 0, 0); // unselect text

  ContinuousPingSpdBtn8.Left := ContinuousPingSpdBtn4.Left;
  HostComboBox8.Left := HostComboBox4.Left;
  Label8L.Left := Label4L.Left;
  Label8H.Left := Label4H.Left;
  Label8A.Left := Label4A.Left;
  Label8T.Left := Label4T.Left;
  Label8LTT.Left := Label4T.Left;
  ContinuousPingSpdBtn8.Width := (Label8T.Left - ContinuousPingSpdBtn8.Left) - 10;
  HostComboBox8.Width := ContinuousPingSpdBtn8.Width;
  PostMessage(HostComboBox8.Handle, CB_SETEDITSEL, 0, 0); // unselect text

  AutoZipJvClock.Left := (MainForm.Width div 2) - (AutoZipJvClock.Width div 2);
  AutoZipJvClock.Top := PingChart.Height - 20;
end;

procedure TMainForm.SetSecond4Visibility(Second4Visible: Boolean);
begin
  DisplayMemo5.Visible := Second4Visible;
  DisplayMemo6.Visible := Second4Visible;
  DisplayMemo7.Visible := Second4Visible;
  DisplayMemo8.Visible := Second4Visible;
  if Second4Visible then
  begin
    CBPanel.Height := 115;
    CBPanel.Top := PingChart.Height - (CBPanel.Height + 3);
  end
  else
  begin
    CBPanel.Height := 60;
    CBPanel.Top := PingChart.Height - (CBPanel.Height + 3);
  end;
  CheckBox5.Visible := Second4Visible;
  CheckBox6.Visible := Second4Visible;
  CheckBox7.Visible := Second4Visible;
  CheckBox8.Visible := Second4Visible;
end;

procedure TMainForm.PingThreadTermPing(Sender: TObject);
var
  TmpStr, LogIP, LogRTT: String;
  i: Integer;
  LowReplyRTT, HighReplyRTT, AverageReplyRTT, Total, TimeOuts: Integer;
  StatusLineCR: ShortString;
begin
  with Sender as TPingThread do
  begin
    case PingId of
      1: Ping1Active := False;
      2: Ping2Active := False;
      3: Ping3Active := False;
      4: Ping4Active := False;
      5: Ping5Active := False;
      6: Ping6Active := False;
      7: Ping7Active := False;
      8: Ping8Active := False;
    end;
  end;
  if Application.Terminated then Exit;
// this event is thread safe, all publics from the thread are available here
  with Sender as TPingThread do
  begin
    if ReplyTotal <> 0 then
    begin
      if ReplyIPAddr <> DnsHostIP then
      begin
        TmpStr := FormatDateTime('hh:nn:ss', Now) + ' IP Error ' + PingHostName + ' (' + DnsHostIP + ') ReplyIP ' + ReplyIPAddr;
        LogIP := DnsHostIP;
        LogRTT := '-2';
        ChartLineColorA[PingId] := clPingTimeout;
      end
      else
      begin
        TmpStr := FormatDateTime('hh:nn:ss', Now) + ' - Pinging ' + ReplyIPAddr + ' in ' + RPad(IntToStr(ReplyRTT) + ' msecs', 10, ' ');
        LogIP := ReplyIPAddr;
        LogRTT := IntToStr(ReplyRTT);
      end;
    end
    else
    begin
      TmpStr := FormatDateTime('hh:nn:ss', Now) + ' ' + PingHostName + ' (' + DnsHostIP + ') ' + IntToStr(ErrCode) + '-' + ErrString;
      LogIP := DnsHostIP;
      LogRTT := '-1';
      ChartLineColorA[PingId] := clPingTimeout;
    end;

    if ReplyTotal <> 0 then
    begin
      if ChartLineColorA[PingId] = clPingTimeout then
      begin
        case PingId of
          1: ChartLineColorA[1] := ContinuousPingSpdBtn1.Font.Color;
          2: ChartLineColorA[2] := ContinuousPingSpdBtn2.Font.Color;
          3: ChartLineColorA[3] := ContinuousPingSpdBtn3.Font.Color;
          4: ChartLineColorA[4] := ContinuousPingSpdBtn4.Font.Color;
          5: ChartLineColorA[5] := ContinuousPingSpdBtn5.Font.Color;
          6: ChartLineColorA[6] := ContinuousPingSpdBtn6.Font.Color;
          7: ChartLineColorA[7] := ContinuousPingSpdBtn7.Font.Color;
          8: ChartLineColorA[8] := ContinuousPingSpdBtn8.Font.Color;
        end;
      end;
      PingChart.Series[PingId-1].AddXY(Now, ReplyRTT, '', ChartLineColorA[PingId]);
    end
    else
    begin
      if PingChart.Series[PingId-1].Count > 1 then
        PingChart.Series[PingId-1].AddXY(Now, PingChart.Series[PingId-1].YValue[PingChart.Series[PingId-1].Count-1], '', ChartLineColorA[PingId])
      else
        PingChart.Series[PingId-1].AddXY(Now, -1, '', ChartLineColorA[PingId]);
    end;

    for i := 0 to PingChart.SeriesCount-1 do
    begin
      if PingChart.Series[i].Count > 0 then
      begin
        while (PingChart.Series[i].XValue[0] <= IncSecond(Now,SecondsToShow)) and (PingChart.Series[i].Count > 0) do
        begin
          PingChart.Series[i].Delete(0);
        end;
      end;
    end;

    if LogChkBox.Checked then
    begin
      StatusLineCR := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now) + ',' + LogIP + ',' + LogRTT + #13 + #10;
      AddToLog(StatusLineCR);
    end;

    LowReplyRTT := $FFFF; HighReplyRTT := 0; Total := 0;
    for i := 0 to PingChart.Series[PingId-1].Count - 1 do
    begin
      if PingChart.Series[PingId-1].YValue[i] < LowReplyRTT then LowReplyRTT := Trunc(PingChart.Series[PingId-1].YValue[i]);
      if PingChart.Series[PingId-1].YValue[i] > HighReplyRTT then HighReplyRTT := Trunc(PingChart.Series[PingId-1].YValue[i]);
      Total := Total + Trunc(PingChart.Series[PingId-1].YValue[i]);
    end;

    case PingId of
      1: Display1(TmpStr);
      2: Display2(TmpStr);
      3: Display3(TmpStr);
      4: Display4(TmpStr);
      5: Display5(TmpStr);
      6: Display6(TmpStr);
      7: Display7(TmpStr);
      8: Display8(TmpStr);
    end;

    // Set color of memo based on timeout
    case PingId of
      1: MemoBGColor(DisplayMemo1, ContinuousPingSpdBtn1.Font.Color);
      2: MemoBGColor(DisplayMemo2, ContinuousPingSpdBtn2.Font.Color);
      3: MemoBGColor(DisplayMemo3, ContinuousPingSpdBtn3.Font.Color);
      4: MemoBGColor(DisplayMemo4, ContinuousPingSpdBtn4.Font.Color);
      5: MemoBGColor(DisplayMemo5, ContinuousPingSpdBtn5.Font.Color);
      6: MemoBGColor(DisplayMemo6, ContinuousPingSpdBtn6.Font.Color);
      7: MemoBGColor(DisplayMemo7, ContinuousPingSpdBtn7.Font.Color);
      8: MemoBGColor(DisplayMemo8, ContinuousPingSpdBtn8.Font.Color);
    end;

    // Update timeout count display
    case PingId of
      1: if DisplayMemo1.Color <> clWhite then Label1T.Caption := 'T-' + IntToStr(Occurrences('timed out', DisplayMemo1.Text)) else Label1T.Caption := 'T-0';
      2: if DisplayMemo2.Color <> clWhite then Label2T.Caption := 'T-' + IntToStr(Occurrences('timed out', DisplayMemo2.Text)) else Label2T.Caption := 'T-0';
      3: if DisplayMemo3.Color <> clWhite then Label3T.Caption := 'T-' + IntToStr(Occurrences('timed out', DisplayMemo3.Text)) else Label3T.Caption := 'T-0';
      4: if DisplayMemo4.Color <> clWhite then Label4T.Caption := 'T-' + IntToStr(Occurrences('timed out', DisplayMemo4.Text)) else Label4T.Caption := 'T-0';
      5: if DisplayMemo5.Color <> clWhite then Label5T.Caption := 'T-' + IntToStr(Occurrences('timed out', DisplayMemo5.Text)) else Label5T.Caption := 'T-0';
      6: if DisplayMemo6.Color <> clWhite then Label6T.Caption := 'T-' + IntToStr(Occurrences('timed out', DisplayMemo6.Text)) else Label6T.Caption := 'T-0';
      7: if DisplayMemo7.Color <> clWhite then Label7T.Caption := 'T-' + IntToStr(Occurrences('timed out', DisplayMemo7.Text)) else Label7T.Caption := 'T-0';
      8: if DisplayMemo8.Color <> clWhite then Label8T.Caption := 'T-' + IntToStr(Occurrences('timed out', DisplayMemo8.Text)) else Label8T.Caption := 'T-0';
    end;

    // Update latest time of timeout
    case PingId of
      1: if DisplayMemo1.Color <> clWhite then
         begin
           for i := DisplayMemo1.Lines.Count - 1 downto 0 do
             if Pos('timed out', DisplayMemo1.Lines[i]) > 0 then
             begin
               Label1LTT.Caption := Copy(DisplayMemo1.Lines[i], 1, 8);
               Break;
             end;
         end;
      2: if DisplayMemo2.Color <> clWhite then
         begin
           for i := DisplayMemo2.Lines.Count - 1 downto 0 do
             if Pos('timed out', DisplayMemo2.Lines[i]) > 0 then
             begin
               Label2LTT.Caption := Copy(DisplayMemo2.Lines[i], 1, 8);
               Break;
             end;
         end;
      3: if DisplayMemo3.Color <> clWhite then
         begin
           for i := DisplayMemo3.Lines.Count - 1 downto 0 do
             if Pos('timed out',DisplayMemo3.Lines[i]) > 0 then
             begin
               Label3LTT.Caption := Copy(DisplayMemo3.Lines[i], 1, 8);
               Break;
             end;
         end;
      4: if DisplayMemo4.Color <> clWhite then
         begin
           for i := DisplayMemo4.Lines.Count - 1 downto 0 do
             if Pos('timed out',DisplayMemo4.Lines[i]) > 0 then
             begin
               Label4LTT.Caption := Copy(DisplayMemo4.Lines[i], 1, 8);
               Break;
             end;
         end;
      5: if DisplayMemo5.Color <> clWhite then
         begin
           for i := DisplayMemo5.Lines.Count - 1 downto 0 do
             if Pos('timed out',DisplayMemo5.Lines[i]) > 0 then
             begin
               Label5LTT.Caption := Copy(DisplayMemo5.Lines[i], 1, 8);
               Break;
             end;
         end;
      6: if DisplayMemo6.Color <> clWhite then
         begin
           for i := DisplayMemo6.Lines.Count - 1 downto 0 do
             if Pos('timed out',DisplayMemo6.Lines[i]) > 0 then
             begin
               Label6LTT.Caption := Copy(DisplayMemo6.Lines[i], 1, 8);
               Break;
             end;
         end;
      7: if DisplayMemo7.Color <> clWhite then
         begin
           for i := DisplayMemo7.Lines.Count - 1 downto 0 do
             if Pos('timed out',DisplayMemo7.Lines[i]) > 0 then
             begin
               Label7LTT.Caption := Copy(DisplayMemo7.Lines[i], 1, 8);
               Break;
             end;
         end;
      8: if DisplayMemo8.Color <> clWhite then
         begin
           for i := DisplayMemo8.Lines.Count - 1 downto 0 do
             if Pos('timed out',DisplayMemo8.Lines[i]) > 0 then
             begin
               Label8LTT.Caption := Copy(DisplayMemo8.Lines[i], 1, 8);
               Break;
             end;
         end;
    end;

    if PingChart.Series[PingId-1].Count > 0 then
    begin
      AverageReplyRTT := Total div PingChart.Series[PingId-1].Count;
      case PingId of
        1: begin
             Label1L.Caption := 'L-' + IntToStr(LowReplyRTT);
             Label1H.Caption := 'H-' + IntToStr(HighReplyRTT);
             Label1A.Caption := 'A-' + IntToStr(AverageReplyRTT);
           end;
        2: begin
             Label2L.Caption := 'L-' + IntToStr(LowReplyRTT);
             Label2H.Caption := 'H-' + IntToStr(HighReplyRTT);
             Label2A.Caption := 'A-' + IntToStr(AverageReplyRTT);
           end;
        3: begin
             Label3L.Caption := 'L-' + IntToStr(LowReplyRTT);
             Label3H.Caption := 'H-' + IntToStr(HighReplyRTT);
             Label3A.Caption := 'A-' + IntToStr(AverageReplyRTT);
           end;
        4: begin
             Label4L.Caption := 'L-' + IntToStr(LowReplyRTT);
             Label4H.Caption := 'H-' + IntToStr(HighReplyRTT);
             Label4A.Caption := 'A-' + IntToStr(AverageReplyRTT);
           end;
        5: begin
             Label5L.Caption := 'L-' + IntToStr(LowReplyRTT);
             Label5H.Caption := 'H-' + IntToStr(HighReplyRTT);
             Label5A.Caption := 'A-' + IntToStr(AverageReplyRTT);
           end;
        6: begin
             Label6L.Caption := 'L-' + IntToStr(LowReplyRTT);
             Label6H.Caption := 'H-' + IntToStr(HighReplyRTT);
             Label6A.Caption := 'A-' + IntToStr(AverageReplyRTT);
           end;
        7: begin
             Label7L.Caption := 'L-' + IntToStr(LowReplyRTT);
             Label7H.Caption := 'H-' + IntToStr(HighReplyRTT);
             Label7A.Caption := 'A-' + IntToStr(AverageReplyRTT);
           end;
        8: begin
             Label8L.Caption := 'L-' + IntToStr(LowReplyRTT);
             Label8H.Caption := 'H-' + IntToStr(HighReplyRTT);
             Label8A.Caption := 'A-' + IntToStr(AverageReplyRTT);
           end;
      end;
    end;

    Application.ProcessMessages;
    case PingId of
      1: if ContinuousPingSpdBtn1.Down then Timer1.Enabled := True;
      2: if ContinuousPingSpdBtn2.Down then Timer2.Enabled := True;
      3: if ContinuousPingSpdBtn3.Down then Timer3.Enabled := True;
      4: if ContinuousPingSpdBtn4.Down then Timer4.Enabled := True;
      5: if ContinuousPingSpdBtn5.Down then Timer5.Enabled := True;
      6: if ContinuousPingSpdBtn6.Down then Timer6.Enabled := True;
      7: if ContinuousPingSpdBtn7.Down then Timer7.Enabled := True;
      8: if ContinuousPingSpdBtn8.Down then Timer8.Enabled := True;
    end;

  end;
end;

procedure TMainForm.ResetTimeDisplay;
begin
  Label1LTT.Caption := 'Time';
  Label2LTT.Caption := 'Time';
  Label3LTT.Caption := 'Time';
  Label4LTT.Caption := 'Time';
  Label5LTT.Caption := 'Time';
  Label6LTT.Caption := 'Time';
  Label7LTT.Caption := 'Time';
  Label8LTT.Caption := 'Time';
end;

procedure TMainForm.ZipCsvBtnClick(Sender: TObject);
var
  TmpBool: Boolean;
begin
  TmpBool := LogChkBox.Checked;
  LogChkBox.Checked := False;
  UpdateLoggingState;
  CsvZipMgr;
  LogChkBox.Checked := TmpBool;
end;

procedure TMainForm.OpenLogDirBtnClick(Sender: TObject);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(LogDir), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

procedure TMainForm.ContinuousPingSpdBtn1Click(Sender: TObject);
begin
  if ContinuousPingSpdBtn1.Down then
  begin
    HostComboBox1.Enabled := False;
    ContinuousPingSpdBtn1.Caption := HostComboBox1.Text;
    DoPingThread(1, HostComboBox1.Text);
  end
  else
  begin
    ContinuousPingSpdBtn1.Caption := 'Ping 1';
    HostComboBox1.Enabled := True;
  end;
end;

procedure TMainForm.ContinuousPingSpdBtn2Click(Sender: TObject);
begin
  if ContinuousPingSpdBtn2.Down then
  begin
    HostComboBox2.Enabled := False;
    ContinuousPingSpdBtn2.Caption := HostComboBox2.Text;
    DoPingThread(2, HostComboBox2.Text);
  end
  else
  begin
    ContinuousPingSpdBtn2.Caption := 'Ping 2';
    HostComboBox2.Enabled := True;
  end;
end;

procedure TMainForm.ContinuousPingSpdBtn3Click(Sender: TObject);
begin
  if ContinuousPingSpdBtn3.Down then
  begin
    HostComboBox3.Enabled := False;
    ContinuousPingSpdBtn3.Caption := HostComboBox3.Text;
    DoPingThread(3, HostComboBox3.Text);
  end
  else
  begin
    ContinuousPingSpdBtn3.Caption := 'Ping 3';
    HostComboBox3.Enabled := True;
  end;
end;

procedure TMainForm.ContinuousPingSpdBtn4Click(Sender: TObject);
begin
  if ContinuousPingSpdBtn4.Down then
  begin
    HostComboBox4.Enabled := False;
    ContinuousPingSpdBtn4.Caption := HostComboBox4.Text;
    DoPingThread(4, HostComboBox4.Text);
  end
  else
  begin
    ContinuousPingSpdBtn4.Caption := 'Ping 4';
    HostComboBox4.Enabled := True;
  end;
end;

procedure TMainForm.ContinuousPingSpdBtn5Click(Sender: TObject);
begin
  if ContinuousPingSpdBtn5.Down then
  begin
    HostComboBox5.Enabled := False;
    ContinuousPingSpdBtn5.Caption := HostComboBox5.Text;
    DoPingThread(5, HostComboBox5.Text);
  end
  else
  begin
    ContinuousPingSpdBtn5.Caption := 'Ping 5';
    HostComboBox5.Enabled := True;
  end;
end;

procedure TMainForm.ContinuousPingSpdBtn6Click(Sender: TObject);
begin
  if ContinuousPingSpdBtn6.Down then
  begin
    HostComboBox6.Enabled := False;
    ContinuousPingSpdBtn6.Caption := HostComboBox6.Text;
    DoPingThread(6, HostComboBox6.Text);
  end
  else
  begin
    ContinuousPingSpdBtn6.Caption := 'Ping 6';
    HostComboBox6.Enabled := True;
  end;
end;

procedure TMainForm.ContinuousPingSpdBtn7Click(Sender: TObject);
begin
  if ContinuousPingSpdBtn7.Down then
  begin
    HostComboBox7.Enabled := False;
    ContinuousPingSpdBtn7.Caption := HostComboBox7.Text;
    DoPingThread(7, HostComboBox7.Text);
  end
  else
  begin
    ContinuousPingSpdBtn7.Caption := 'Ping 7';
    HostComboBox7.Enabled := True;
  end;
end;

procedure TMainForm.ContinuousPingSpdBtn8Click(Sender: TObject);
begin
  if ContinuousPingSpdBtn8.Down then
  begin
    HostComboBox8.Enabled := False;
    ContinuousPingSpdBtn8.Caption := HostComboBox8.Text;
    DoPingThread(8, HostComboBox8.Text);
  end
  else
  begin
    ContinuousPingSpdBtn8.Caption := 'Ping 8';
    HostComboBox8.Enabled := True;
  end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
var
  i: Integer;
  RegEx: TPerlRegEx;
  VerStr: String;
begin
  if not FInitialized then
  begin
    FInitialized := True;
    VerStr := 'PingGUI-v' + GetVersionInfoStr(ParamStr(0));
    MainMenu.Items.Find('About').Caption := VerStr;
    RightMenu;
    LclVerStr := VerStr;
    CBPanel.Top := PingChart.Height - (CBPanel.Height + 3);
    MainForm.Top := Screen.WorkAreaTop;
    MainForm.Height := Screen.WorkAreaHeight;
    MainForm.Left := Screen.WorkAreaLeft;
    MainForm.Width := Screen.WorkAreaWidth;
    Timer1.Interval := PingIntervalSpinEdit.Value * 1000;
    Timer2.Interval := PingIntervalSpinEdit.Value * 1000;
    Timer3.Interval := PingIntervalSpinEdit.Value * 1000;
    Timer4.Interval := PingIntervalSpinEdit.Value * 1000;
    Timer5.Interval := PingIntervalSpinEdit.Value * 1000;
    Timer6.Interval := PingIntervalSpinEdit.Value * 1000;
    Timer7.Interval := PingIntervalSpinEdit.Value * 1000;
    Timer8.Interval := PingIntervalSpinEdit.Value * 1000;

    SizeControls;

    ExeDir := ExtractFilePath(Application.ExeName);
    LclExeDir := ExeDir;
    DtaDir := GetAppdataFolder + '\MWB\PingGUI\'; SysUtils.ForceDirectories(DtaDir);
    LstDir := DtaDir + 'LST\'; SysUtils.ForceDirectories(LstDir);
    LclDtaDir := DtaDir;
    TmpDir := DtaDir + 'TMP\'; SysUtils.ForceDirectories(TmpDir);
    LclTmpDir := TmpDir;
    PgmUpdDir := TmpDir + 'PgmUpdates\'; SysUtils.ForceDirectories(PgmUpdDir);
    LclPgmUpdDir := PgmUpdDir;
    TmpRptDir := DtaDir + 'TMPRPT\'; SysUtils.ForceDirectories(TmpRptDir);
    LogDir := DtaDir + 'Logs\';
    LoadSettings;
    UpdateColors;
    SecondsToShow := StrToInt('-' + SecondsToShowComboBox.Items[SecondsToShowComboBox.ItemIndex]);
    SecondsToShowComboBox.DropDownCount := SecondsToShowComboBox.Items.Count;
    AutoZipJvClock.Hint := 'AutoZip enabled - Hour:' + IntToStr(AutoZipJvClock.AlarmHour) + ' Minute:' + IntToStr(AutoZipJvClock.AlarmMinute);
    AutoZipJvClock.ShowHint := True;
    Application.HintHidePause := 10000;
    Label1A.Hint := 'shift-left-click Color Dialog' + #10#13 +
                    'ctrl-shift-right-click Default Color' + #10#13 +
                    'shift-right-click Starting Color';
    Label1A.ShowHint := True;
    Label2A.Hint := Label1A.Hint;
    Label2A.ShowHint := True;
    Label3A.Hint := Label1A.Hint;
    Label3A.ShowHint := True;
    Label4A.Hint := Label1A.Hint;
    Label4A.ShowHint := True;
    Label5A.Hint := Label1A.Hint;
    Label5A.ShowHint := True;
    Label6A.Hint := Label1A.Hint;
    Label6A.ShowHint := True;
    Label7A.Hint := Label1A.Hint;
    Label7A.ShowHint := True;
    Label8A.Hint := Label1A.Hint;
    Label8A.ShowHint := True;

    if ParamCount > 0 then
    begin
      HostComboBox1.Text := '';
      HostComboBox2.Text := '';
      HostComboBox3.Text := '';
      HostComboBox4.Text := '';
      HostComboBox5.Text := '';
      HostComboBox6.Text := '';
      HostComboBox7.Text := '';
      HostComboBox8.Text := '';
      for i := 1 to ParamCount do
      begin
        if UpperCase(ParamStr(i)) = '/LOG' then LogChkBox.Checked := True;
        Regex := TPerlRegEx.Create;
        Regex.Options := [];
        Regex.Subject := ParamStr(i);
        RegEx.RegEx := '\b[1-8]-[A-Za-z0-9._%+-]+\b';
        if RegEx.Match then
        begin
          case StrToInt(ParamStr(i)[1]) of
            1: begin
                 HostComboBox1.Text := Copy(ParamStr(i), 3);
                 ContinuousPingSpdBtn1.Down := True;
                 ContinuousPingSpdBtn1.Click;
               end;
            2: begin
                 HostComboBox2.Text := Copy(ParamStr(i), 3);
                 ContinuousPingSpdBtn2.Down := True;
                 ContinuousPingSpdBtn2.Click;
               end;
            3: begin
                 HostComboBox3.Text := Copy(ParamStr(i), 3);
                 ContinuousPingSpdBtn3.Down := True;
                 ContinuousPingSpdBtn3.Click;
               end;
            4: begin
                 HostComboBox4.Text := Copy(ParamStr(i), 3);
                 ContinuousPingSpdBtn4.Down := True;
                 ContinuousPingSpdBtn4.Click;
               end;
            5: begin
                 HostComboBox5.Text := Copy(ParamStr(i), 3);
                 ContinuousPingSpdBtn5.Down := True;
                 ContinuousPingSpdBtn5.Click;
                 if not TopPanel2.Visible then mmi4or8.Click;
               end;
            6: begin
                 HostComboBox6.Text := Copy(ParamStr(i), 3);
                 ContinuousPingSpdBtn6.Down := True;
                 ContinuousPingSpdBtn6.Click;
                 if not TopPanel2.Visible then mmi4or8.Click;
               end;
            7: begin
                 HostComboBox7.Text := Copy(ParamStr(i), 3);
                 ContinuousPingSpdBtn7.Down := True;
                 ContinuousPingSpdBtn7.Click;
                 if not TopPanel2.Visible then mmi4or8.Click;
               end;
            8: begin
                 HostComboBox8.Text := Copy(ParamStr(i), 3);
                 ContinuousPingSpdBtn8.Down := True;
                 ContinuousPingSpdBtn8.Click;
                 if not TopPanel2.Visible then mmi4or8.Click;
               end;
          end;
        end;
        RegEx.Free;
      end;
    end;
    HostComboBoxChange(HostComboBox1);
    HostComboBoxChange(HostComboBox2);
    HostComboBoxChange(HostComboBox3);
    HostComboBoxChange(HostComboBox4);
    HostComboBoxChange(HostComboBox5);
    HostComboBoxChange(HostComboBox6);
    HostComboBoxChange(HostComboBox7);
    HostComboBoxChange(HostComboBox8);
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveSettings;
  repeat
    Application.ProcessMessages;
  until not (Ping1Active and Ping2Active and Ping3Active and Ping4Active and Ping5Active and Ping6Active and Ping7Active and Ping8Active);
  if FLogOpen then LogFileStream.Free;
  ClearDirectory(TmpDir);
  ClearDirectory(TmpRptDir);
  PruneEmptyLimbs(DtaDir);
  RemoveEmptyDirectory(LogDir);
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  ReportMemoryLeaksOnShutdown := (DebugHook <> 0); // Report if running debugger
//  ReportMemoryLeaksOnShutdown := True;
end;

procedure TMainForm.AutoZipJvClockAlarm(Sender: TObject);
begin
  ZipCsvBtnClick(Self);
  ResetTimeDisplay;
end;

procedure TMainForm.a4or8Execute(Sender: TObject);
begin
  TopPanel2.Visible := not TopPanel2.Visible;
  SetSecond4Visibility(TopPanel2.Visible);
end;

procedure TMainForm.aAboutExecute(Sender: TObject);
begin
  TAboutBox.Execute;
end;

procedure TMainForm.aClearGraphExecute(Sender: TObject);
begin
  if not ContinuousPingSpdBtn1.Down then
  begin
    DisplayMemo1.Color := clWhite;
    DisplayMemo1.Clear;
    PingChart.Series[0].Clear;
    Label1L.Caption := 'Low';
    Label1A.Caption := 'Average';
    Label1H.Caption := 'High';
    Label1T.Caption := 'Timeout';
    Label1LTT.Caption := 'Time';
  end;
  if not ContinuousPingSpdBtn2.Down then
  begin
    DisplayMemo2.Color := clWhite;
    DisplayMemo2.Clear;
    PingChart.Series[1].Clear;
    Label2L.Caption := 'Low';
    Label2A.Caption := 'Average';
    Label2H.Caption := 'High';
    Label2T.Caption := 'Timeout';
    Label2LTT.Caption := 'Time';
  end;
  if not ContinuousPingSpdBtn3.Down then
  begin
    DisplayMemo3.Color := clWhite;
    DisplayMemo3.Clear;
    PingChart.Series[2].Clear;
    Label3L.Caption := 'Low';
    Label3A.Caption := 'Average';
    Label3H.Caption := 'High';
    Label3T.Caption := 'Timeout';
    Label3LTT.Caption := 'Time';
  end;
  if not ContinuousPingSpdBtn4.Down then
  begin
    DisplayMemo4.Color := clWhite;
    DisplayMemo4.Clear;
    PingChart.Series[3].Clear;
    Label4L.Caption := 'Low';
    Label4A.Caption := 'Average';
    Label4H.Caption := 'High';
    Label4T.Caption := 'Timeout';
    Label4LTT.Caption := 'Time';
  end;
  if not ContinuousPingSpdBtn5.Down then
  begin
    DisplayMemo5.Color := clWhite;
    DisplayMemo5.Clear;
    PingChart.Series[4].Clear;
    Label5L.Caption := 'Low';
    Label5A.Caption := 'Average';
    Label5H.Caption := 'High';
    Label5T.Caption := 'Timeout';
    Label5LTT.Caption := 'Time';
  end;
  if not ContinuousPingSpdBtn6.Down then
  begin
    DisplayMemo6.Color := clWhite;
    DisplayMemo6.Clear;
    PingChart.Series[5].Clear;
    Label6L.Caption := 'Low';
    Label6A.Caption := 'Average';
    Label6H.Caption := 'High';
    Label6T.Caption := 'Timeout';
    Label6LTT.Caption := 'Time';
  end;
  if not ContinuousPingSpdBtn7.Down then
  begin
    DisplayMemo7.Color := clWhite;
    DisplayMemo7.Clear;
    PingChart.Series[6].Clear;
    Label7L.Caption := 'Low';
    Label7A.Caption := 'Average';
    Label7H.Caption := 'High';
    Label7T.Caption := 'Timeout';
    Label7LTT.Caption := 'Time';
  end;
  if not ContinuousPingSpdBtn8.Down then
  begin
    DisplayMemo8.Color := clWhite;
    DisplayMemo8.Clear;
    PingChart.Series[7].Clear;
    Label8L.Caption := 'Low';
    Label8A.Caption := 'Average';
    Label8H.Caption := 'High';
    Label8T.Caption := 'Timeout';
    Label8LTT.Caption := 'Time';
  end;
end;

procedure TMainForm.aClearHostsExecute(Sender: TObject);
begin
  if HostComboBox1.Enabled then
  begin
    HostComboBox1.Text := '';
    HostComboBoxChange(HostComboBox1);
  end;
  if HostComboBox2.Enabled then
  begin
    HostComboBox2.Text := '';
    HostComboBoxChange(HostComboBox2);
  end;
  if HostComboBox3.Enabled then
  begin
    HostComboBox3.Text := '';
    HostComboBoxChange(HostComboBox3);
  end;
  if HostComboBox4.Enabled then
  begin
    HostComboBox4.Text := '';
    HostComboBoxChange(HostComboBox4);
  end;
  if HostComboBox5.Enabled then
  begin
    HostComboBox5.Text := '';
    HostComboBoxChange(HostComboBox5);
  end;
  if HostComboBox6.Enabled then
  begin
    HostComboBox6.Text := '';
    HostComboBoxChange(HostComboBox6);
  end;
  if HostComboBox7.Enabled then
  begin
    HostComboBox7.Text := '';
    HostComboBoxChange(HostComboBox7);
  end;
  if HostComboBox8.Enabled then
  begin
    HostComboBox8.Text := '';
    HostComboBoxChange(HostComboBox8);
  end;
end;

procedure TMainForm.aLast7DaysSummaryReportExecute(Sender: TObject);
begin
  DaySummaryReport(7);
  Display('Done!');
end;

procedure TMainForm.aStopPingingAllHostsExecute(Sender: TObject);
begin
  if Length(Trim(HostComboBox1.Text)) > 0 then
  begin
    ContinuousPingSpdBtn1.Down := False;
    ContinuousPingSpdBtn1.Click;
  end;
  if Length(Trim(HostComboBox2.Text)) > 0 then
  begin
    ContinuousPingSpdBtn2.Down := False;
    ContinuousPingSpdBtn2.Click;
  end;
  if Length(Trim(HostComboBox3.Text)) > 0 then
  begin
    ContinuousPingSpdBtn3.Down := False;
    ContinuousPingSpdBtn3.Click;
  end;
  if Length(Trim(HostComboBox4.Text)) > 0 then
  begin
    ContinuousPingSpdBtn4.Down := False;
    ContinuousPingSpdBtn4.Click;
  end;
  if Length(Trim(HostComboBox5.Text)) > 0 then
  begin
    ContinuousPingSpdBtn5.Down := False;
    ContinuousPingSpdBtn5.Click;
  end;
  if Length(Trim(HostComboBox6.Text)) > 0 then
  begin
    ContinuousPingSpdBtn6.Down := False;
    ContinuousPingSpdBtn6.Click;
  end;
  if Length(Trim(HostComboBox7.Text)) > 0 then
  begin
    ContinuousPingSpdBtn7.Down := False;
    ContinuousPingSpdBtn7.Click;
  end;
  if Length(Trim(HostComboBox8.Text)) > 0 then
  begin
    ContinuousPingSpdBtn8.Down := False;
    ContinuousPingSpdBtn8.Click;
  end;
end;

procedure TMainForm.AddToLog(TextToLog: ShortString);
var
  StatusLineCR: ShortString;
begin
  if FlogOpen then
  begin
    if ((LogMinute <> GetMin(Time)) and ((GetMin(Time) mod 15) = 0)) then
    begin
      LogFileStream.Free;
      FLogOpen := False;
    end;
  end;
  if not FLogOpen then
  begin
    SysUtils.ForceDirectories(LogDir);
    FLogOpen := True;
    LogFileName := FmtDateToStr('FULL-YMD-HMS', Now) + '.csv';
    LogFileStream := TFileStream.Create(LogDir + LogFileName, fmCreate or fmShareDenyWrite);
    LogMinute := GetMin(Time);
    StatusLineCR := 'DateTime,IP Address,msec'#13#10;
    LogFileStream.Write(StatusLineCR[1], Length(StatusLineCR) * SizeOf(AnsiChar));
  end;
  LogFileStream.Write(TextToLog[1], Length(TextToLog) * SizeOf(AnsiChar));
end;

procedure TMainForm.aDisplayLogExecute(Sender: TObject);
begin
  DisplayLogForm.Show;
end;

procedure TMainForm.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.aHostListEditorExecute(Sender: TObject);
begin
  HLEDlg.ShowModal;
end;

procedure TMainForm.aMonthOfSummaryReportsExecute(Sender: TObject);
begin
  MonthOfSummaryReports(EncodeDate(2021, 12, 1));
end;

procedure TMainForm.aSaveToCmdFileExecute(Sender: TObject);
var
  CmdFileStrLst: TStringList;
  OkToCreate: Boolean;
  HostsToPingStr, LogStr, TmpFileExtStr, PathString, FileNameString, NewFileNameString: String;
begin
  SaveDialog.InitialDir := GetDesktopFolder;
  SaveDialog.Filter := 'Command Files (*.cmd)|*.cmd|All Files (*.*)|*.*';
  SaveDialog.FileName := 'PingGUI-1.cmd';
  if SaveDialog.Execute() then
  begin
    OkToCreate := True;
    if FileExists(SaveDialog.FileName) then
    begin
      if MessageDlg(SaveDialog.FileName + ' already exists, overwrite?', mtConfirmation, [mbYes, mbNo], 0, mbNo) = mrNo then
      begin
        OkToCreate := False;
      end;
    end;
    if OkToCreate then
    begin
      CmdFileStrLst := TStringList.Create;
      HostsToPingStr := '';
      if Length(HostComboBox1.Text) > 0 then HostsToPingStr := HostsToPingStr + ' 1-' + HostComboBox1.Text;
      if Length(HostComboBox2.Text) > 0 then HostsToPingStr := HostsToPingStr + ' 2-' + HostComboBox2.Text;
      if Length(HostComboBox3.Text) > 0 then HostsToPingStr := HostsToPingStr + ' 3-' + HostComboBox3.Text;
      if Length(HostComboBox4.Text) > 0 then HostsToPingStr := HostsToPingStr + ' 4-' + HostComboBox4.Text;
      if Length(HostComboBox5.Text) > 0 then HostsToPingStr := HostsToPingStr + ' 5-' + HostComboBox5.Text;
      if Length(HostComboBox6.Text) > 0 then HostsToPingStr := HostsToPingStr + ' 6-' + HostComboBox6.Text;
      if Length(HostComboBox7.Text) > 0 then HostsToPingStr := HostsToPingStr + ' 7-' + HostComboBox7.Text;
      if Length(HostComboBox8.Text) > 0 then HostsToPingStr := HostsToPingStr + ' 8-' + HostComboBox8.Text;
      if LogChkBox.Checked then LogStr := ' /LOG' else LogStr := '';
      CmdFileStrLst.Text := 'START ' + ExtractShortPathName(ExeDir) + ExtractFileNameOnly(Application.ExeName) + LogStr+HostsToPingStr;
      TmpFileExtStr := UpperCase(ExtractFileExt(SaveDialog.FileName));
      if TmpFileExtStr <> '.CMD' then
      begin
        PathString := ExtractFilePath(SaveDialog.FileName);
        FileNameString := ChangeFileExt(ExtractFileName(SaveDialog.FileName), '.cmd');
        NewFileNameString := PathString+FileNameString;
      end
      else
      begin
        NewFileNameString := SaveDialog.FileName;
      end;
      CmdFileStrLst.SaveToFile(NewFileNameString);
      CmdFileStrLst.Free;
    end;
  end;
end;

procedure TMainForm.aStartPingingAllHostsExecute(Sender: TObject);
begin
  if Length(Trim(HostComboBox1.Text)) > 0 then
  begin
    ContinuousPingSpdBtn1.Down := True;
    ContinuousPingSpdBtn1.Click;
  end;
  if Length(Trim(HostComboBox2.Text)) > 0 then
  begin
    ContinuousPingSpdBtn2.Down := True;
    ContinuousPingSpdBtn2.Click;
  end;
  if Length(Trim(HostComboBox3.Text)) > 0 then
  begin
    ContinuousPingSpdBtn3.Down := True;
    ContinuousPingSpdBtn3.Click;
  end;
  if Length(Trim(HostComboBox4.Text)) > 0 then
  begin
    ContinuousPingSpdBtn4.Down := True;
    ContinuousPingSpdBtn4.Click;
  end;
  if Length(Trim(HostComboBox5.Text)) > 0 then
  begin
    ContinuousPingSpdBtn5.Down := True;
    ContinuousPingSpdBtn5.Click;
  end;
  if Length(Trim(HostComboBox6.Text)) > 0 then
  begin
    ContinuousPingSpdBtn6.Down := True;
    ContinuousPingSpdBtn6.Click;
  end;
  if Length(Trim(HostComboBox7.Text)) > 0 then
  begin
    ContinuousPingSpdBtn7.Down := True;
    ContinuousPingSpdBtn7.Click;
  end;
  if Length(Trim(HostComboBox8.Text)) > 0 then
  begin
    ContinuousPingSpdBtn8.Down := True;
    ContinuousPingSpdBtn8.Click;
  end;
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
  PingChart.Series[0].Visible := CheckBox1.Checked;
end;

procedure TMainForm.CheckBox2Click(Sender: TObject);
begin
  PingChart.Series[1].Visible := CheckBox2.Checked;
end;

procedure TMainForm.CheckBox3Click(Sender: TObject);
begin
  PingChart.Series[2].Visible := CheckBox3.Checked;
end;

procedure TMainForm.CheckBox4Click(Sender: TObject);
begin
  PingChart.Series[3].Visible := CheckBox4.Checked;
end;

procedure TMainForm.CheckBox5Click(Sender: TObject);
begin
  PingChart.Series[4].Visible := CheckBox5.Checked;
end;

procedure TMainForm.CheckBox6Click(Sender: TObject);
begin
  PingChart.Series[5].Visible := CheckBox6.Checked;
end;

procedure TMainForm.CheckBox7Click(Sender: TObject);
begin
  PingChart.Series[6].Visible := CheckBox7.Checked;
end;

procedure TMainForm.CheckBox8Click(Sender: TObject);
begin
  PingChart.Series[7].Visible := CheckBox8.Checked;
end;

procedure TMainForm.PingChartResize(Sender: TObject);
begin
  SizeControls;
end;

procedure TMainForm.PingIntervalSpinEditChange(Sender: TObject);
begin
  Timer1.Interval := PingIntervalSpinEdit.Value * 1000;
  Timer2.Interval := PingIntervalSpinEdit.Value * 1000;
  Timer3.Interval := PingIntervalSpinEdit.Value * 1000;
  Timer4.Interval := PingIntervalSpinEdit.Value * 1000;
  Timer5.Interval := PingIntervalSpinEdit.Value * 1000;
  Timer6.Interval := PingIntervalSpinEdit.Value * 1000;
  Timer7.Interval := PingIntervalSpinEdit.Value * 1000;
  Timer8.Interval := PingIntervalSpinEdit.Value * 1000;
end;

procedure TMainForm.SecondsToShowComboBoxChange(Sender: TObject);
begin
  SecondsToShow := StrToInt('-' + SecondsToShowComboBox.Items[SecondsToShowComboBox.ItemIndex]);
end;

procedure TMainForm.HostComboBoxChange(Sender: TObject);
var
  TmpBool: Boolean;
begin
  TmpBool := (Length(Trim((Sender as TComboBox).Text)) > 0);
  case (Sender as TComboBox).Tag of
    1: ContinuousPingSpdBtn1.Enabled := TmpBool;
    2: ContinuousPingSpdBtn2.Enabled := TmpBool;
    3: ContinuousPingSpdBtn3.Enabled := TmpBool;
    4: ContinuousPingSpdBtn4.Enabled := TmpBool;
    5: ContinuousPingSpdBtn5.Enabled := TmpBool;
    6: ContinuousPingSpdBtn6.Enabled := TmpBool;
    7: ContinuousPingSpdBtn7.Enabled := TmpBool;
    8: ContinuousPingSpdBtn8.Enabled := TmpBool;
  end;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
begin
  case (Sender as TTimer).Tag of
    1: begin
         Timer1.Enabled := False;
         Ping1Active := True;
         DoPingThread(1, HostComboBox1.Text);
       end;
    2: begin
         Timer2.Enabled := False;
         Ping2Active := True;
         DoPingThread(2, HostComboBox2.Text);
       end;
    3: begin
         Timer3.Enabled := False;
         Ping3Active := True;
         DoPingThread(3, HostComboBox3.Text);
       end;
    4: begin
         Timer4.Enabled := False;
         Ping4Active := True;
         DoPingThread(4, HostComboBox4.Text);
       end;
    5: begin
         Timer5.Enabled := False;
         Ping5Active := True;
         DoPingThread(5, HostComboBox5.Text);
       end;
    6: begin
         Timer6.Enabled := False;
         Ping6Active := True;
         DoPingThread(6, HostComboBox6.Text);
       end;
    7: begin
         Timer7.Enabled := False;
         Ping7Active := True;
         DoPingThread(7, HostComboBox7.Text);
       end;
    8: begin
         Timer8.Enabled := False;
         Ping8Active := True;
         DoPingThread(8, HostComboBox8.Text);
       end;
  end;
end;

procedure TMainForm.CsvZipMgr;
var
  SearchRec: TSearchRec;
  ZipFileName, TmpStr: String;
  CsvFileList: TStringList;
  Zip: TZipFile;
  i: Integer;
begin
  CsvFileList := TStringList.Create;
  SysUtils.ForceDirectories(ZipDir);
  while FindFirst(LogDir + '*.CSV', faAnyFile, SearchRec) = 0 do
  begin
    CsvFileList.Clear;
    TmpStr := SearchRec.Name;
    FindClose(SearchRec);
    if FindFirst(LogDir + Copy(TmpStr, 1, 8) + '*.CSV', faAnyFile, SearchRec) = 0 then
    begin
      CsvFileList.Append(LogDir + SearchRec.Name);
      while FindNext(SearchRec) = 0 do
        CsvFileList.Append(LogDir + SearchRec.Name);
      FindClose(SearchRec);
    end;
    if CsvFileList.Count > 0 then
    begin
      ZipFileName := ZipDir + ComputerName + '-PingGUI-Logs-' + Copy(TmpStr, 1, 8) + '.ZIP';
      Zip := TZipFile.Create;
      try
        Zip.Open(ZipFileName, zmWrite);
        for i := 0 to CsvFileList.Count - 1 do
        begin
          Zip.Add(CsvFileList[i], ExtractFileName(CsvFileList[i]));
        end;
      finally
        Zip.Free;
      end;
      if FindFirst(LogDir + Copy(TmpStr, 1, 8) + '*.CSV', faAnyFile, SearchRec) = 0 then
      begin
        MyErase(LogDir + SearchRec.Name);
        while FindNext(SearchRec) = 0 do MyErase(LogDir + SearchRec.Name);
        FindClose(SearchRec);
      end;
    end;
  end;
  DeleteOldZips;
  CsvFileList.Free;
end;

procedure TMainForm.AverageLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  PGUIReg: TRegistry;
begin
  if ssShift in Shift then
  begin
    case Button of
      mbLeft: begin
                ColorDialog.Color := (Sender as TLabel).Font.Color;
                if ColorDialog.Execute then (Sender as TLabel).Font.Color := ColorDialog.Color;
              end;
      mbRight: begin
                 if ssCtrl in Shift then
                 begin
                   case (Sender as TLabel).Tag of
                     1: (Sender as TLabel).Font.Color := clPing1C;
                     2: (Sender as TLabel).Font.Color := clPing2C;
                     3: (Sender as TLabel).Font.Color := clPing3C;
                     4: (Sender as TLabel).Font.Color := clPing4C;
                     5: (Sender as TLabel).Font.Color := clPing5C;
                     6: (Sender as TLabel).Font.Color := clPing6C;
                     7: (Sender as TLabel).Font.Color := clPing7C;
                     8: (Sender as TLabel).Font.Color := clPing8C;
                   end;
                 end
                 else
                 begin
                   PGUIReg := TRegistry.Create;
                   try
                     with PGUIReg do
                     begin
                       RootKey := HKEY_CURRENT_USER;
                       OpenKey('\SOFTWARE\MWB\PingGUI', True);
                       case (Sender as TLabel).Tag of
                         1: (Sender as TLabel).Font.Color := ReadInteger('Ping1Color');
                         2: (Sender as TLabel).Font.Color := ReadInteger('Ping2Color');
                         3: (Sender as TLabel).Font.Color := ReadInteger('Ping3Color');
                         4: (Sender as TLabel).Font.Color := ReadInteger('Ping4Color');
                         5: (Sender as TLabel).Font.Color := ReadInteger('Ping5Color');
                         6: (Sender as TLabel).Font.Color := ReadInteger('Ping6Color');
                         7: (Sender as TLabel).Font.Color := ReadInteger('Ping7Color');
                         8: (Sender as TLabel).Font.Color := ReadInteger('Ping8Color');
                       end;
                     end;
                   finally
                     PGUIReg.Free;
                   end;
                 end;
               end;
    end;
    UpdateColors;
  end;
end;

procedure TMainForm.UpdateColors;
begin
  DisplayMemo1.Font.Color := Label1A.Font.Color;
  DisplayMemo2.Font.Color := Label2A.Font.Color;
  DisplayMemo3.Font.Color := Label3A.Font.Color;
  DisplayMemo4.Font.Color := Label4A.Font.Color;
  DisplayMemo5.Font.Color := Label5A.Font.Color;
  DisplayMemo6.Font.Color := Label6A.Font.Color;
  DisplayMemo7.Font.Color := Label7A.Font.Color;
  DisplayMemo8.Font.Color := Label8A.Font.Color;
  ChartLineColorA[1] := Label1A.Font.Color;
  ChartLineColorA[2] := Label2A.Font.Color;
  ChartLineColorA[3] := Label3A.Font.Color;
  ChartLineColorA[4] := Label4A.Font.Color;
  ChartLineColorA[5] := Label5A.Font.Color;
  ChartLineColorA[6] := Label6A.Font.Color;
  ChartLineColorA[7] := Label7A.Font.Color;
  ChartLineColorA[8] := Label8A.Font.Color;

  Label1L.Font.Color := Label1A.Font.Color;
  Label1H.Font.Color := Label1A.Font.Color;
  Label1T.Font.Color := Label1A.Font.Color;
  Label1LTT.Font.Color := Label1A.Font.Color;
  ContinuousPingSpdBtn1.Font.Color := Label1A.Font.Color;
  Label2L.Font.Color := Label2A.Font.Color;
  Label2H.Font.Color := Label2A.Font.Color;
  Label2T.Font.Color := Label2A.Font.Color;
  Label2LTT.Font.Color := Label2A.Font.Color;
  ContinuousPingSpdBtn2.Font.Color := Label2A.Font.Color;
  Label3L.Font.Color := Label3A.Font.Color;
  Label3H.Font.Color := Label3A.Font.Color;
  Label3T.Font.Color := Label3A.Font.Color;
  Label3LTT.Font.Color := Label3A.Font.Color;
  ContinuousPingSpdBtn3.Font.Color := Label3A.Font.Color;
  Label4L.Font.Color := Label4A.Font.Color;
  Label4H.Font.Color := Label4A.Font.Color;
  Label4T.Font.Color := Label4A.Font.Color;
  Label4LTT.Font.Color := Label4A.Font.Color;
  ContinuousPingSpdBtn4.Font.Color := Label4A.Font.Color;

  Label5L.Font.Color := Label5A.Font.Color;
  Label5H.Font.Color := Label5A.Font.Color;
  Label5T.Font.Color := Label5A.Font.Color;
  Label5LTT.Font.Color := Label5A.Font.Color;
  ContinuousPingSpdBtn5.Font.Color := Label5A.Font.Color;
  Label6L.Font.Color := Label6A.Font.Color;
  Label6H.Font.Color := Label6A.Font.Color;
  Label6T.Font.Color := Label6A.Font.Color;
  Label6LTT.Font.Color := Label6A.Font.Color;
  ContinuousPingSpdBtn6.Font.Color := Label6A.Font.Color;
  Label7L.Font.Color := Label7A.Font.Color;
  Label7H.Font.Color := Label7A.Font.Color;
  Label7T.Font.Color := Label7A.Font.Color;
  Label7LTT.Font.Color := Label7A.Font.Color;
  ContinuousPingSpdBtn7.Font.Color := Label7A.Font.Color;
  Label8L.Font.Color := Label8A.Font.Color;
  Label8H.Font.Color := Label8A.Font.Color;
  Label8T.Font.Color := Label8A.Font.Color;
  Label8LTT.Font.Color := Label8A.Font.Color;
  ContinuousPingSpdBtn8.Font.Color := Label8A.Font.Color;

  CheckBox1.Font.Color := Label1A.Font.Color;
  CheckBox2.Font.Color := Label2A.Font.Color;
  CheckBox3.Font.Color := Label3A.Font.Color;
  CheckBox4.Font.Color := Label4A.Font.Color;
  CheckBox5.Font.Color := Label5A.Font.Color;
  CheckBox6.Font.Color := Label6A.Font.Color;
  CheckBox7.Font.Color := Label7A.Font.Color;
  CheckBox8.Font.Color := Label8A.Font.Color;
end;

function MyCustomSort(List: TStringList; Index1, Index2: Integer): Integer;
var
  S1, S2 : String;
  Card1, Card2: Cardinal;
begin
  Result := 0; // 0  = Index1 = Index2
               // -1 = Index1 < Index2
               // 1  = Index1 > Index2
  S1 := List.Strings[Index1];  //Just to make it easier to read
  S2 := List.Strings[Index2];

  Card1 := StringToIPAddress(S1);
  Card2 := StringToIPAddress(S2);

  // Compare the first element ascending
  if Card1 < Card2 then
    Result := -1 //Less than
  else if Card1 > Card2 then
    Result := 1  //Greater than

end;

procedure TMainForm.ProcessCSVFiles(CSVPath, OutputFileName: String; IPSelectList: TStringList);
type
  TPingStats = record
    IPAddress: String;
    Count: Integer;
    Timeouts: Integer;
    TotalMsecs: Int64;
    Min: Integer;
    Max: Integer;
    Active: Boolean;
  end;
var
  Words, IPStringList, WorkList: TStringList;
  SearchRec: TSearchRec;
  Hour: Word;
  i, j, k, MinMsec, AvgMsec: Integer;
  IPInReport: Boolean;
  PingStatsA: array of array of TPingStats;
begin
  Words := TStringList.Create;
  IPStringList := TStringList.Create;
  WorkList := TStringList.Create;
  Display('Gathering IP addresses');
  if FindFirst(CSVPath + '*.CSV', faAnyFile, SearchRec) = 0 then
  begin
    repeat
      WorkList.LoadFromFile(CSVPath+SearchRec.Name);
      for i := 0 to WorkList.Count - 1 do
      begin
        Parse(WorkList[i], ',', Words);
        if Pos('IP Address', Words[1]) = 0 then
          if IPStringList.IndexOf(Words[1]) = - 1 then
          begin
            IPInReport := False;
            if IPSelectList.IndexOf('0.0.0.0') <> -1 then IPInReport := True;
            if IPSelectList.IndexOf(Words[1]) <> -1 then IPInReport := True;
            if IPInReport then IPStringList.Append(Words[1]);
          end;
      end;
    until FindNext(SearchRec) <> 0;
    FindClose(SearchRec);
  end;
  if IPStringList.Count > 0 then
  begin
    IPStringList.CustomSort(MyCustomSort);
    SetLength(PingStatsA, 24);
    for i := 0 to 23 do SetLength(PingStatsA[i], IPStringList.Count);
    for i := 0 to 23 do
    for j := 0 to IPStringList.Count - 1 do
    begin
      PingStatsA[i,j].IPAddress := IPStringList[j];
      PingStatsA[i,j].Count := 0;
      PingStatsA[i,j].Timeouts := 0;
      PingStatsA[i,j].TotalMsecs := 0;
      PingStatsA[i,j].Min := 23158;
      PingStatsA[i,j].Max := 0;
      PingStatsA[i,j].Active := False;
    end;
    Display('Summarizing data');
    if FindFirst(CSVPath+'*.CSV', faAnyFile, SearchRec) = 0 then
    begin
      repeat
        WorkList.LoadFromFile(CSVPath + SearchRec.Name);
        for i := 1 to WorkList.Count - 1 do
        begin
          Parse(WorkList[i], ',', Words);
          Hour := StrToInt(Copy(Words[0], 12, 2));
          for j := Low(PingStatsA[Hour]) to High(PingStatsA[Hour]) do
          begin
            if PingStatsA[Hour, j].IPAddress = Words[1] then
            begin
              PingStatsA[Hour, j].Active := True;
              k := StrToInt(Words[2]);
              if k = -1 then
              begin
                Inc(PingStatsA[Hour, j].Timeouts);
              end
              else
              begin
                Inc(PingStatsA[Hour, j].Count);
                PingStatsA[Hour, j].TotalMsecs := PingStatsA[Hour, j].TotalMsecs + k;
                if k < PingStatsA[Hour, j].Min then PingStatsA[Hour, j].Min := k;
                if k > PingStatsA[Hour, j].Max then PingStatsA[Hour, j].Max := k;
              end;
            end;
          end;
        end;
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;
    Display('Writing report');
    WorkList.Clear;
    for i := Low(PingStatsA[1]) to High(PingStatsA[1]) do
    begin
      WorkList.Append('IP Address,Hour,MinMsec,AvgMsec,MaxMsec,Timeouts');
      for j := 0 to 23 do
      begin
        if PingStatsA[j, i].Active then
        begin
          if PingStatsA[j, i].Min = 23158 then MinMsec := 0 else MinMsec := PingStatsA[j, i].Min;
          if (PingStatsA[j, i].Count > 0) and (PingStatsA[j, i].TotalMsecs > 0) then
            AvgMsec := (PingStatsA[j, i].TotalMsecs div PingStatsA[j, i].Count) else AvgMsec := 0;
          WorkList.Append(PingStatsA[j, i].IPAddress
            + ',' + IntToStr(j)
            + ',' + IntToStr(MinMsec)
            + ',' + IntToStr(AvgMsec)
            + ',' + IntToStr(PingStatsA[j, i].Max)
            + ',' + IntToStr(PingStatsA[j, i].Timeouts)
            );
        end;
      end;
    end;
    Display('Report filename - ' + OutputFileName);
    WorkList.SaveToFile(OutputFileName);
  end;
  WorkList.Free; IPStringList.Free; Words.Free;
end;

function TMainForm.SummaryReport(const ZipFileName: String; const IPSelectList: TStringList; const OutDir: String): String;
var
  OutputFileName: String;
  Zip: TZipFile;
begin
  OutputFileName := '';
  if FileExists(ZipFileName) then
  begin
    Display('Clearing temp directory');
    ClearDirectory(TmpDir);
    Display('Extracting CSV files');
    Zip := TZipFile.Create;
    try
      if Zip.IsValid(ZipFileName) then
      begin
        Zip.Open(ZipFileName, zmRead);
        Zip.ExtractAll(TmpDir);
      end;
    finally
      Zip.Free;
    end;
    OutputFileName := OutDir + ChangeFileExt(ExtractFileName(ZipFileName), '') + '-Report.csv';
    ProcessCSVFiles(TmpDir, OutputFileName, IPSelectList);
  end;
  Result := OutputFileName;
end;

procedure TMainForm.DaySummaryReport(const DaysToRpt: Integer);
var
  FileList, OutFileList: TStringList;
  IPSelectList: TStringList;
  SearchRec: TSearchRec;
  DaySumRptDir: String;
  i: Integer;
begin
  DaySumRptDir := RptDir;
  FileList := TStringList.Create;
  OutFileList := TStringList.Create;
  IPSelectList := TStringList.Create;
  IPSelectList.Append('0.0.0.0');
  for i := DaysToRpt downto 1 do
  begin
    if FindFirst(ZipDir + '*-PingGUI-Logs-' + FmtDateToStr('FULL-YMD', Now - i) + '.ZIP', faAnyFile, SearchRec) = 0 then
    begin
      repeat
        FileList.Append(SearchRec.Name);
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;
  end;
  OutFileList.Clear;
  if FileList.Count > 0 then
  begin
    for i := 0 to FileList.Count - 1 do
    begin
      OutFileList.Append(SummaryReport(ZipDir + FileList[i], IPSelectList, DaySumRptDir));
    end;
  end;
  IPSelectList.Free;
  FileList.Free;
  OutFileList.Free;
end;

procedure TMainForm.MonthOfSummaryReports(const YearMonth: TDate);
var
  FileList, OutFileList: TStringList;
  IPSelectList: TStringList;
  SearchRec: TSearchRec;
  SumRptDir: String;
  i, iDaysInMonth: Integer;
  Year, Month, Day, DayOfMonth: Word;
  TmpDate: TDate;
begin
  SumRptDir := RptDir;
  FileList := TStringList.Create;
  OutFileList := TStringList.Create;
  IPSelectList := TStringList.Create;
  IPSelectList.Append('0.0.0.0');
  DecodeDate(YearMonth,Year,Month,Day);
  iDaysInMonth := DaysInMonth(YearMonth);
  for DayOfMonth := 1 to iDaysInMonth do
  begin
    TmpDate := EncodeDate(Year, Month, DayOfMonth);
    if FindFirst(ZipDir + '*-PingGUI-Logs-' + FmtDateToStr('FULL-YMD', TmpDate) + '.ZIP', faAnyFile, SearchRec) = 0 then
    begin
      repeat
        FileList.Append(SearchRec.Name);
      until FindNext(SearchRec) <> 0;
      FindClose(SearchRec);
    end;
  end;
  OutFileList.Clear;
  if FileList.Count > 0 then
  begin
    for i := 0 to FileList.Count - 1 do
    begin
      OutFileList.Append(SummaryReport(ZipDir + FileList[i], IPSelectList, SumRptDir));
    end;
  end;
  IPSelectList.Free;
  FileList.Free;
  OutFileList.Free;
  Display('Done!');
end;

procedure TMainForm.Display(const Msg: String);
begin
  if PadForm.PadMemo.Lines.Count > 200 then PadForm.PadMemo.Lines.Delete(0);
  if Length(Trim(PadForm.PadMemo.Lines.Strings[0])) = 0 then PadForm.PadMemo.Lines.Delete(0);
  PadForm.PadMemo.Lines.Append(Msg);
  PadForm.Show;
end;

function TMainForm.GetLstDir: String;
begin
  Result := LstDir;
end;

end.
