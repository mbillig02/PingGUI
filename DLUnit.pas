unit DLUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, JvExExtCtrls, JvExtComponent, JvClock, ComCtrls,
  StdCtrls, ExtCtrls, Spin, Buttons, TeeProcs, Chart, VclTee.TeeGDIPlus;

type
  TDisplayLogForm = class(TForm)
    PingChart: TChart;
    LoadCSVSpdBtn: TSpeedButton;
    PingSeries1: TLineSeries;
    PingSeries2: TLineSeries;
    PingSeries3: TLineSeries;
    PingSeries4: TLineSeries;
    PingSeries5: TLineSeries;
    PingSeries6: TLineSeries;
    PingSeries7: TLineSeries;
    PingSeries8: TLineSeries;
    OpenDialog: TOpenDialog;
    procedure LoadCSVSpdBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DisplayLogForm: TDisplayLogForm;

implementation

uses
  PerlRegEx, MFUnit, DateUtils, UtlUnit;

{$R *.dfm}
{========================================================================}
procedure TDisplayLogForm.LoadCSVSpdBtnClick(Sender: TObject);
var
  FileStream: TFileStream;
  LogFileStrLst: TStringList;
  i, j, SeriesToUse, ChartLineColor: Integer;
  Regex: TPerlRegEx;
  TmpDateTime, StartDateTime, EndDateTime: TDateTime;
  TmpSDF, TmpLTF: String;
  TmpDS: Char;
  Words: TStringList;
begin
  OpenDialog.InitialDir := LogDir;
  if OpenDialog.Execute then
  begin
    PingChart.Legend.Visible := True;
    PingChart.BottomAxis.AutomaticMaximum := False;
    Regex := TPerlRegEx.Create;
    Regex.RegEx := '(19|20)[0-9]{2}[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01]) ([01][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])';
    Regex.Options := [];
    Regex.State := [];
    LogFileStrLst := TStringList.Create;
    FileStream := TFileStream.Create(OpenDialog.FileName, fmShareDenyNone);
    LogFileStrLst.LoadFromStream(FileStream);
    FileStream.Free;
    Words := TStringList.Create;
    TmpSDF := GetSDF; SetSDF('yyyy-mm-dd');
    TmpDS := GetDS;  SetDS('-');
    TmpLTF := GetLTF; SetLTF('hh:nn:ss');
    for i := 0 to 7 do PingChart.Series[i].Clear;
    for i := 0 to 7 do PingChart.Series[i].Title := 'empty';
    StartDateTime := 0; EndDateTime := 0; PingChart.BottomAxis.Minimum := 0;
    for i := 1 to LogFileStrLst.Count - 1 do
    begin
      Regex.Subject := LogFileStrLst[i];
      if Regex.Match then
      begin
        TmpDateTime := StrToDateTime(Regex.MatchedText);
        if StartDateTime = 0 then
        begin
          StartDateTime := TmpDateTime;
        end;
        if EndDateTime = 0 then
        begin
          EndDateTime := IncMinute(StartDateTime,15);
          PingChart.BottomAxis.Maximum := IncMinute(StartDateTime,3);
        end;
        Parse(LogFileStrLst[i] , ',', Words);
        for j := 0 to 7 do
        begin
          if PingChart.Series[j].Title = Words[1] then
          begin
            SeriesToUse := j;
            break;
          end;
          if PingChart.Series[j].Title = 'empty' then
          begin
            SeriesToUse := j;
            PingChart.Series[j].Title := Words[1];
            break;
          end;
        end;
        case SeriesToUse of
          1: ChartLineColor := MainForm.ContinuousPingSpdBtn1.Font.Color;
          2: ChartLineColor := MainForm.ContinuousPingSpdBtn2.Font.Color;
          3: ChartLineColor := MainForm.ContinuousPingSpdBtn3.Font.Color;
          4: ChartLineColor := MainForm.ContinuousPingSpdBtn4.Font.Color;
          5: ChartLineColor := MainForm.ContinuousPingSpdBtn5.Font.Color;
          6: ChartLineColor := MainForm.ContinuousPingSpdBtn6.Font.Color;
          7: ChartLineColor := MainForm.ContinuousPingSpdBtn7.Font.Color;
          8: ChartLineColor := MainForm.ContinuousPingSpdBtn8.Font.Color;
        end;
        if TmpDateTime < EndDateTime then
          PingChart.Series[SeriesToUse].AddXY(TmpDateTime, StrToInt(Words[2]), '', ChartLineColor);
      end;
      PingChart.BottomAxis.Maximum := StrToDateTime(Regex.MatchedText);
    end;
    SetLTF(TmpLTF);
    SetDS(TmpDS);
    SetSDF(TmpSDF);
    Words.Free;
    LogFileStrLst.Free;
    Regex.Free;
  end;
end;
{========================================================================}
end.
