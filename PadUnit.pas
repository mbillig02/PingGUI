unit PadUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TPadForm = class(TForm)
    PadMemo: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PadForm: TPadForm;

implementation

{$R *.dfm}

end.
