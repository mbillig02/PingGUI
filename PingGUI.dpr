program PingGUI;

uses
  Forms,
  Windows,
  Classes,
  SysUtils,
  MFUnit in 'MFUnit.pas' {MainForm},
  UtlUnit in '..\UTL\UtlUnit.pas',
  About in 'About.pas' {AboutBox},
  HLEUnit in 'HLEUnit.pas' {HLEDlg},
  PadUnit in 'PadUnit.pas' {PadForm},
  DLUnit in 'DLUnit.pas' {DisplayLogForm},
  Vcl.Themes,
  Vcl.Styles;

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
