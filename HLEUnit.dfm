object HLEDlg: THLEDlg
  Left = 227
  Top = 108
  Caption = 'Host List Edit'
  ClientHeight = 306
  ClientWidth = 395
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 13
  object HLEMemo: TMemo
    Left = 0
    Top = 0
    Width = 256
    Height = 306
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
    ExplicitLeft = 3
  end
  object RightPanel: TPanel
    Left = 256
    Top = 0
    Width = 139
    Height = 306
    Align = alRight
    TabOrder = 1
    object EditListFileBtn: TButton
      Left = 10
      Top = 231
      Width = 120
      Height = 25
      Caption = 'Edit List File'
      TabOrder = 0
      OnClick = EditListFileBtnClick
    end
    object HLEClearBtn: TButton
      Left = 75
      Top = 7
      Width = 55
      Height = 25
      Caption = 'Clear'
      TabOrder = 1
      OnClick = HLEClearBtnClick
    end
    object HLECloseBtn: TButton
      Left = 10
      Top = 270
      Width = 120
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Close'
      Default = True
      ModalResult = 1
      TabOrder = 2
    end
    object SaveToFileBtn: TButton
      Left = 10
      Top = 201
      Width = 120
      Height = 25
      Caption = 'Save To File'
      TabOrder = 3
      OnClick = SaveToFileBtnClick
    end
    object HLELoadListBtn: TButton
      Left = 10
      Top = 99
      Width = 120
      Height = 25
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Load from Drop Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = HLELoadListBtnClick
    end
    object HLESendListBtn: TButton
      Left = 10
      Top = 129
      Width = 120
      Height = 25
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'Send to Drop Down'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = HLESendListBtnClick
    end
    object HLESortBtn: TButton
      Left = 10
      Top = 7
      Width = 55
      Height = 25
      Hint = 'Sort ListBox entries'
      Caption = 'Sort'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = HLESortBtnClick
    end
    object LoadFromFileBtn: TButton
      Left = 10
      Top = 171
      Width = 120
      Height = 25
      Caption = 'Load From File'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
      OnClick = LoadFromFileBtnClick
    end
    object LoadFromComboBoxesBtn: TButton
      Left = 10
      Top = 39
      Width = 120
      Height = 25
      Hint = 'Add from Combo Boxes Text'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Load From CB Text'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = LoadFromComboBoxesBtnClick
    end
    object SendToCBTextBTN: TButton
      Left = 10
      Top = 69
      Width = 120
      Height = 25
      Caption = 'Send To CB Text'
      TabOrder = 9
      OnClick = SendToCBTextBTNClick
    end
  end
  object SaveListDialog: TSaveDialog
    Left = 160
    Top = 96
  end
  object OpenListDialog: TOpenDialog
    Left = 160
    Top = 48
  end
end
