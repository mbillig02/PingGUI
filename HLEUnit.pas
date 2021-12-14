unit HLEUnit;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Dialogs;

type
  THLEDlg = class(TForm)
    HLECloseBtn: TButton;
    HLELoadListBtn: TButton;
    HLESendListBtn: TButton;
    LoadFromComboBoxesBtn: TButton;
    HLESortBtn: TButton;
    LoadFromFileBtn: TButton;
    SaveToFileBtn: TButton;
    SaveListDialog: TSaveDialog;
    OpenListDialog: TOpenDialog;
    EditListFileBtn: TButton;
    HLEClearBtn: TButton;
    SendToCBTextBTN: TButton;
    HLEMemo: TMemo;
    RightPanel: TPanel;
    procedure HLELoadListBtnClick(Sender: TObject);
    procedure HLESendListBtnClick(Sender: TObject);
    procedure LoadFromComboBoxesBtnClick(Sender: TObject);
    procedure HLESortBtnClick(Sender: TObject);
    procedure SaveToFileBtnClick(Sender: TObject);
    procedure LoadFromFileBtnClick(Sender: TObject);
    procedure EditListFileBtnClick(Sender: TObject);
    procedure HLEClearBtnClick(Sender: TObject);
    procedure SendToCBTextBTNClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HLEDlg: THLEDlg;

implementation

uses MFUnit, ShellAPI;

var
  StartingPoint: TPoint;

{$R *.dfm}

procedure THLEDlg.HLELoadListBtnClick(Sender: TObject);
var
  i: Integer;
begin
  HLEMemo.Clear;
  for i := 0 to MainForm.HostComboBox1.Items.Count-1 do
  begin
    HLEMemo.Lines.Append(MainForm.HostComboBox1.Items[i]);
  end;
end;

procedure THLEDlg.LoadFromComboBoxesBtnClick(Sender: TObject);
begin
  if HLEMemo.Lines.IndexOf(MainForm.HostComboBox1.Text) = -1 then
    if Length(Trim(MainForm.HostComboBox1.Text)) > 0 then
      HLEMemo.Lines.Append(MainForm.HostComboBox1.Text);
  if HLEMemo.Lines.IndexOf(MainForm.HostComboBox2.Text) = -1 then
    if Length(Trim(MainForm.HostComboBox2.Text)) > 0 then
      HLEMemo.Lines.Append(MainForm.HostComboBox2.Text);
  if HLEMemo.Lines.IndexOf(MainForm.HostComboBox3.Text) = -1 then
    if Length(Trim(MainForm.HostComboBox3.Text)) > 0 then
      HLEMemo.Lines.Append(MainForm.HostComboBox3.Text);
  if HLEMemo.Lines.IndexOf(MainForm.HostComboBox4.Text) = -1 then
    if Length(Trim(MainForm.HostComboBox4.Text)) > 0 then
      HLEMemo.Lines.Append(MainForm.HostComboBox4.Text);
  if HLEMemo.Lines.IndexOf(MainForm.HostComboBox5.Text) = -1 then
    if Length(Trim(MainForm.HostComboBox5.Text)) > 0 then
      HLEMemo.Lines.Append(MainForm.HostComboBox5.Text);
  if HLEMemo.Lines.IndexOf(MainForm.HostComboBox6.Text) = -1 then
    if Length(Trim(MainForm.HostComboBox6.Text)) > 0 then
      HLEMemo.Lines.Append(MainForm.HostComboBox6.Text);
  if HLEMemo.Lines.IndexOf(MainForm.HostComboBox7.Text) = -1 then
    if Length(Trim(MainForm.HostComboBox7.Text)) > 0 then
      HLEMemo.Lines.Append(MainForm.HostComboBox7.Text);
  if HLEMemo.Lines.IndexOf(MainForm.HostComboBox8.Text) = -1 then
    if Length(Trim(MainForm.HostComboBox8.Text)) > 0 then
      HLEMemo.Lines.Append(MainForm.HostComboBox8.Text);
end;

procedure THLEDlg.HLESortBtnClick(Sender: TObject);
var
  SortStrLst: TStringList;
begin
  SortStrLst := TStringList.Create;
  SortStrLst.Text := HLEMemo.Text;
  SortStrLst.Sort;
  HLEMemo.Text := SortStrLst.Text;
  SortStrLst.Free;
end;

procedure THLEDlg.LoadFromFileBtnClick(Sender: TObject);
begin
  OpenListDialog.InitialDir := MainForm.GetLstDir;
  OpenListDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  if OpenListDialog.Execute then HLEMemo.Lines.LoadFromFile(OpenListDialog.FileName);
end;

procedure THLEDlg.SaveToFileBtnClick(Sender: TObject);
var
  TempFileName: String;
begin
  SaveListDialog.InitialDir := MainForm.GetLstDir;
  SaveListDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  if SaveListDialog.Execute then
  begin
    TempFileName := SaveListDialog.FileName;
    if ExtractFileExt(TempFileName) = '' then TempFileName := TempFileName + '.txt';
    HLEMemo.Lines.SaveToFile(TempFileName) ;
  end;
end;

procedure THLEDlg.SendToCBTextBTNClick(Sender: TObject);
begin
  if HLEMemo.Lines.Count >= 1 then MainForm.HostComboBox1.Text := HLEMemo.Lines[0] else MainForm.HostComboBox1.Text := '';
  if HLEMemo.Lines.Count >= 2 then MainForm.HostComboBox2.Text := HLEMemo.Lines[1] else MainForm.HostComboBox2.Text := '';
  if HLEMemo.Lines.Count >= 3 then MainForm.HostComboBox3.Text := HLEMemo.Lines[2] else MainForm.HostComboBox3.Text := '';
  if HLEMemo.Lines.Count >= 4 then MainForm.HostComboBox4.Text := HLEMemo.Lines[3] else MainForm.HostComboBox4.Text := '';
  if HLEMemo.Lines.Count >= 5 then MainForm.HostComboBox5.Text := HLEMemo.Lines[4] else MainForm.HostComboBox5.Text := '';
  if HLEMemo.Lines.Count >= 6 then MainForm.HostComboBox6.Text := HLEMemo.Lines[5] else MainForm.HostComboBox6.Text := '';
  if HLEMemo.Lines.Count >= 7 then MainForm.HostComboBox7.Text := HLEMemo.Lines[6] else MainForm.HostComboBox7.Text := '';
  if HLEMemo.Lines.Count >= 8 then MainForm.HostComboBox8.Text := HLEMemo.Lines[7] else MainForm.HostComboBox8.Text := '';
  MainForm.HostComboBoxChange(MainForm.HostComboBox1);
  MainForm.HostComboBoxChange(MainForm.HostComboBox2);
  MainForm.HostComboBoxChange(MainForm.HostComboBox3);
  MainForm.HostComboBoxChange(MainForm.HostComboBox4);
  MainForm.HostComboBoxChange(MainForm.HostComboBox5);
  MainForm.HostComboBoxChange(MainForm.HostComboBox6);
  MainForm.HostComboBoxChange(MainForm.HostComboBox7);
  MainForm.HostComboBoxChange(MainForm.HostComboBox8);
end;

procedure THLEDlg.EditListFileBtnClick(Sender: TObject);
begin
  OpenListDialog.InitialDir := MainForm.GetLstDir;
  OpenListDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  if OpenListDialog.Execute then
  begin
    ShellExecute(Handle, 'open', PChar(OpenListDialog.FileName), nil, nil, SW_SHOWNORMAL); // Open file in default text editor
  end;
end;

procedure THLEDlg.HLEClearBtnClick(Sender: TObject);
begin
  HLEMemo.Clear;
end;

procedure THLEDlg.HLESendListBtnClick(Sender: TObject);
var
  i: Integer;
begin
  MainForm.HostComboBox1.Items.Clear;
  MainForm.HostComboBox2.Items.Clear;
  MainForm.HostComboBox3.Items.Clear;
  MainForm.HostComboBox4.Items.Clear;
  MainForm.HostComboBox5.Items.Clear;
  MainForm.HostComboBox6.Items.Clear;
  MainForm.HostComboBox7.Items.Clear;
  MainForm.HostComboBox8.Items.Clear;
  for i := 0 to HLEMemo.Lines.Count-1 do
  begin
    MainForm.HostComboBox1.Items.Append(HLEMemo.Lines[i]);
    MainForm.HostComboBox2.Items.Append(HLEMemo.Lines[i]);
    MainForm.HostComboBox3.Items.Append(HLEMemo.Lines[i]);
    MainForm.HostComboBox4.Items.Append(HLEMemo.Lines[i]);
    MainForm.HostComboBox5.Items.Append(HLEMemo.Lines[i]);
    MainForm.HostComboBox6.Items.Append(HLEMemo.Lines[i]);
    MainForm.HostComboBox7.Items.Append(HLEMemo.Lines[i]);
    MainForm.HostComboBox8.Items.Append(HLEMemo.Lines[i]);
  end;
end;

end.
