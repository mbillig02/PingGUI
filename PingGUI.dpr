program PingGUI;

uses
//  FastMM4, // FastMM4 or SysUtils
  Forms,
  Windows,
  Classes,
  SysUtils, // FastMM4 or SysUtils
  MFUnit in 'MFUnit.pas' {MainForm},
  UtlUnit in '..\UTL\UtlUnit.pas',
  About in 'About.pas' {AboutBox},
  HLEUnit in 'HLEUnit.pas' {HLEDlg},
  PingThrd in 'PingThrd.pas',
  PadUnit in 'PadUnit.pas' {PadForm},
  DLUnit in 'DLUnit.pas' {DisplayLogForm};

{$R *.res}

begin
//  TObject.Create; // Used to test memory leaks
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(THLEDlg, HLEDlg);
  Application.CreateForm(TPadForm, PadForm);
  Application.CreateForm(TDisplayLogForm, DisplayLogForm);
  Application.Run;
end.