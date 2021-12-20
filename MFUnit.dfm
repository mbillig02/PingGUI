object MainForm: TMainForm
  Left = 258
  Top = 147
  Caption = 'PingGUI'
  ClientHeight = 598
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 0
    Top = 274
    Width = 743
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object ContinuousPingSpdBtn1: TSpeedButton
      Tag = 1
      Left = 1
      Top = 3
      Width = 125
      Height = 25
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Ping 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtn1Click
    end
    object ContinuousPingSpdBtn2: TSpeedButton
      Tag = 2
      Left = 358
      Top = 3
      Width = 125
      Height = 25
      AllowAllUp = True
      GroupIndex = 2
      Caption = 'Ping 2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtn2Click
    end
    object ContinuousPingSpdBtn3: TSpeedButton
      Tag = 3
      Left = 488
      Top = 3
      Width = 125
      Height = 25
      AllowAllUp = True
      GroupIndex = 3
      Caption = 'Ping 3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 33023
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtn3Click
    end
    object ContinuousPingSpdBtn4: TSpeedButton
      Tag = 4
      Left = 619
      Top = 3
      Width = 125
      Height = 25
      AllowAllUp = True
      GroupIndex = 4
      Caption = 'Ping 4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clFuchsia
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtn4Click
    end
    object Label1L: TLabel
      Tag = 1
      Left = 130
      Top = 6
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low'
    end
    object Label1H: TLabel
      Tag = 1
      Left = 130
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'High'
    end
    object Label1A: TLabel
      Tag = 1
      Left = 130
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Average'
      OnMouseDown = AverageLabelMouseDown
    end
    object Label1LTT: TLabel
      Tag = 1
      Left = 130
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time'
    end
    object Label2L: TLabel
      Tag = 2
      Left = 183
      Top = 6
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low'
    end
    object Label2H: TLabel
      Tag = 2
      Left = 183
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'High'
    end
    object Label2A: TLabel
      Tag = 2
      Left = 183
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Average'
      OnMouseDown = AverageLabelMouseDown
    end
    object Label2LTT: TLabel
      Tag = 1
      Left = 183
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time'
    end
    object Label3L: TLabel
      Tag = 3
      Left = 240
      Top = 6
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low'
    end
    object Label3H: TLabel
      Tag = 3
      Left = 240
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'High'
    end
    object Label3A: TLabel
      Tag = 3
      Left = 240
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Average'
      OnMouseDown = AverageLabelMouseDown
    end
    object Label3LTT: TLabel
      Tag = 1
      Left = 240
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time'
    end
    object Label4L: TLabel
      Left = 297
      Top = 6
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low'
    end
    object Label4H: TLabel
      Left = 297
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'High'
    end
    object Label4A: TLabel
      Tag = 4
      Left = 297
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Average'
      OnMouseDown = AverageLabelMouseDown
    end
    object Label4LTT: TLabel
      Tag = 1
      Left = 297
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time'
    end
    object Label1T: TLabel
      Tag = 1
      Left = 130
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Timeouts'
      OnMouseDown = LabelxTMouseDown
      OnMouseUp = LabelxTMouseUp
    end
    object Label4T: TLabel
      Tag = 4
      Left = 297
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Timeouts'
      OnMouseDown = LabelxTMouseDown
      OnMouseUp = LabelxTMouseUp
    end
    object Label2T: TLabel
      Tag = 2
      Left = 183
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Timeouts'
      OnMouseDown = LabelxTMouseDown
      OnMouseUp = LabelxTMouseUp
    end
    object Label3T: TLabel
      Tag = 3
      Left = 240
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Timeouts'
      OnMouseDown = LabelxTMouseDown
      OnMouseUp = LabelxTMouseUp
    end
    object HostComboBox1: TComboBox
      Tag = 1
      Left = 1
      Top = 32
      Width = 125
      Height = 21
      TabOrder = 0
      Text = 'www.yahoo.com'
      OnChange = HostComboBoxChange
    end
    object HostComboBox2: TComboBox
      Tag = 2
      Left = 358
      Top = 32
      Width = 125
      Height = 21
      TabOrder = 1
      Text = 'www.yahoo.com'
      OnChange = HostComboBoxChange
    end
    object HostComboBox3: TComboBox
      Tag = 3
      Left = 488
      Top = 32
      Width = 125
      Height = 21
      TabOrder = 2
      Text = 'www.yahoo.com'
      OnChange = HostComboBoxChange
    end
    object HostComboBox4: TComboBox
      Tag = 4
      Left = 619
      Top = 32
      Width = 125
      Height = 21
      TabOrder = 3
      Text = 'www.yahoo.com'
      OnChange = HostComboBoxChange
    end
  end
  object PingChart: TChart
    Left = 0
    Top = 277
    Width = 743
    Height = 321
    AllowPanning = pmNone
    Legend.Visible = False
    Title.Text.Strings = (
      'Ping Time Graph')
    BottomAxis.DateTimeFormat = 'h:mm:ss'
    BottomAxis.Increment = 0.000011574074074074
    BottomAxis.LabelsAngle = 90
    View3D = False
    Zoom.Allow = False
    Align = alClient
    TabOrder = 1
    OnResize = PingChartResize
    DesignSize = (
      743
      321)
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object ClearMemosAndLinesBtn: TSpeedButton
      Left = 656
      Top = 3
      Width = 78
      Height = 25
      Action = aClearGraph
      Anchors = [akTop, akRight]
      Flat = True
      ParentShowHint = False
      ShowHint = True
    end
    object SecondsToShowComboBox: TComboBox
      Left = 5
      Top = 6
      Width = 45
      Height = 21
      Hint = 'Seconds to show'
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnChange = SecondsToShowComboBoxChange
      Items.Strings = (
        '5'
        '10'
        '15'
        '30'
        '45'
        '60'
        '120'
        '180'
        '240'
        '300')
    end
    object PingIntervalSpinEdit: TSpinEdit
      Left = 55
      Top = 6
      Width = 45
      Height = 22
      Hint = 'Ping interval seconds'
      MaxValue = 10
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Value = 1
      OnChange = PingIntervalSpinEditChange
    end
    object LogPanel: TPanel
      Left = 106
      Top = 3
      Width = 189
      Height = 29
      AutoSize = True
      BevelInner = bvLowered
      TabOrder = 2
      object SelectLogDirBtn: TSpeedButton
        Left = 147
        Top = 2
        Width = 40
        Height = 25
        Hint = 'Select Log Directory'
        Caption = 'Select'
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = SelectLogDirBtnClick
      end
      object OpenLogDirBtn: TSpeedButton
        Left = 101
        Top = 2
        Width = 40
        Height = 25
        Hint = 'Open Log Directory'
        Caption = 'Open'
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = OpenLogDirBtnClick
      end
      object ZipCsvBtn: TSpeedButton
        Left = 55
        Top = 2
        Width = 40
        Height = 25
        Hint = 'Zip CSV Files'
        Caption = 'Zip'
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = ZipCsvBtnClick
      end
      object LogChkBox: TCheckBox
        Left = 2
        Top = 7
        Width = 45
        Height = 17
        Hint = 'Create Log File'
        Caption = 'Log ?'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = LogChkBoxClick
      end
    end
    object AutoZipJvClock: TJvClock
      Left = 85
      Top = 302
      Width = 57
      Height = 17
      DateFormat = 'M/d/yyyy'
      Anchors = [akLeft, akBottom]
      Visible = False
      OnAlarm = AutoZipJvClockAlarm
    end
    object CBPanel: TPanel
      Left = 3
      Top = 239
      Width = 35
      Height = 60
      Anchors = [akLeft, akBottom]
      BevelInner = bvLowered
      TabOrder = 4
      object CheckBox1: TCheckBox
        Left = 4
        Top = 2
        Width = 28
        Height = 17
        Caption = '1'
        Checked = True
        State = cbChecked
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 4
        Top = 15
        Width = 28
        Height = 17
        Caption = '2'
        Checked = True
        State = cbChecked
        TabOrder = 1
        OnClick = CheckBox2Click
      end
      object CheckBox3: TCheckBox
        Left = 4
        Top = 29
        Width = 28
        Height = 17
        Caption = '3'
        Checked = True
        State = cbChecked
        TabOrder = 2
        OnClick = CheckBox3Click
      end
      object CheckBox4: TCheckBox
        Left = 4
        Top = 42
        Width = 28
        Height = 17
        Caption = '4'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CheckBox4Click
      end
      object CheckBox5: TCheckBox
        Left = 4
        Top = 56
        Width = 28
        Height = 17
        Caption = '5'
        Checked = True
        State = cbChecked
        TabOrder = 4
        Visible = False
        OnClick = CheckBox5Click
      end
      object CheckBox6: TCheckBox
        Left = 4
        Top = 69
        Width = 28
        Height = 17
        Caption = '6'
        Checked = True
        State = cbChecked
        TabOrder = 5
        Visible = False
        OnClick = CheckBox6Click
      end
      object CheckBox7: TCheckBox
        Left = 4
        Top = 83
        Width = 28
        Height = 17
        Caption = '7'
        Checked = True
        State = cbChecked
        TabOrder = 6
        Visible = False
        OnClick = CheckBox7Click
      end
      object CheckBox8: TCheckBox
        Left = 4
        Top = 97
        Width = 28
        Height = 17
        Caption = '8'
        Checked = True
        State = cbChecked
        TabOrder = 7
        Visible = False
        OnClick = CheckBox8Click
      end
    end
    object PingSeries1: TLineSeries
      SeriesColor = clGreen
      Title = 'PingSeries1'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object PingSeries2: TLineSeries
      SeriesColor = clBlue
      Title = 'PingSeries2'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object PingSeries3: TLineSeries
      SeriesColor = 33023
      Title = 'PingSeries3'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object PingSeries4: TLineSeries
      SeriesColor = clAqua
      Title = 'PingSeries4'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object PingSeries5: TLineSeries
      SeriesColor = clBlack
      Title = 'PingSeries5'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object PingSeries6: TLineSeries
      Title = 'PingSeries6'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object PingSeries7: TLineSeries
      Title = 'PingSeries7'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object PingSeries8: TLineSeries
      SeriesColor = clPurple
      Title = 'PingSeries8'
      Brush.BackColor = clDefault
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object MemoPanel: TPanel
    Left = 0
    Top = 114
    Width = 743
    Height = 160
    Align = alTop
    Caption = 'MemoPanel'
    TabOrder = 2
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 150
      Height = 158
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 1
        Top = 114
        Width = 148
        Height = 2
        Cursor = crVSplit
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        ExplicitTop = 115
        ExplicitWidth = 149
      end
      object DisplayMemo1: TMemo
        Left = 1
        Top = 1
        Width = 148
        Height = 113
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object DisplayMemo5: TMemo
        Left = 1
        Top = 116
        Width = 148
        Height = 41
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        ScrollBars = ssBoth
        TabOrder = 1
        Visible = False
      end
    end
    object Panel2: TPanel
      Left = 151
      Top = 1
      Width = 150
      Height = 158
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      TabOrder = 1
      object Splitter2: TSplitter
        Left = 1
        Top = 114
        Width = 148
        Height = 2
        Cursor = crVSplit
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        ExplicitTop = 115
      end
      object DisplayMemo2: TMemo
        Left = 1
        Top = 1
        Width = 148
        Height = 113
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object DisplayMemo6: TMemo
        Left = 1
        Top = 116
        Width = 148
        Height = 41
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        ScrollBars = ssBoth
        TabOrder = 1
        Visible = False
      end
    end
    object Panel3: TPanel
      Left = 301
      Top = 1
      Width = 151
      Height = 158
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      TabOrder = 2
      object Splitter3: TSplitter
        Left = 1
        Top = 114
        Width = 149
        Height = 2
        Cursor = crVSplit
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        ExplicitTop = 115
      end
      object DisplayMemo3: TMemo
        Left = 1
        Top = 1
        Width = 149
        Height = 113
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object DisplayMemo7: TMemo
        Left = 1
        Top = 116
        Width = 149
        Height = 41
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        ScrollBars = ssBoth
        TabOrder = 1
        Visible = False
      end
    end
    object Panel4: TPanel
      Left = 452
      Top = 1
      Width = 150
      Height = 158
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alLeft
      TabOrder = 3
      object Splitter4: TSplitter
        Left = 1
        Top = 114
        Width = 148
        Height = 2
        Cursor = crVSplit
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        ExplicitTop = 115
        ExplicitWidth = 149
      end
      object DisplayMemo4: TMemo
        Left = 1
        Top = 1
        Width = 148
        Height = 113
        Align = alClient
        ScrollBars = ssBoth
        TabOrder = 0
      end
      object DisplayMemo8: TMemo
        Left = 1
        Top = 116
        Width = 148
        Height = 41
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        ScrollBars = ssBoth
        TabOrder = 1
        Visible = False
      end
    end
  end
  object TopPanel2: TPanel
    Left = 0
    Top = 57
    Width = 743
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    Visible = False
    object ContinuousPingSpdBtn5: TSpeedButton
      Tag = 5
      Left = 1
      Top = 3
      Width = 125
      Height = 25
      AllowAllUp = True
      GroupIndex = 5
      Caption = 'Ping 5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtn5Click
    end
    object ContinuousPingSpdBtn6: TSpeedButton
      Tag = 6
      Left = 358
      Top = 3
      Width = 125
      Height = 25
      AllowAllUp = True
      GroupIndex = 6
      Caption = 'Ping 6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtn6Click
    end
    object ContinuousPingSpdBtn7: TSpeedButton
      Tag = 7
      Left = 488
      Top = 3
      Width = 125
      Height = 25
      AllowAllUp = True
      GroupIndex = 7
      Caption = 'Ping 7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clYellow
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtn7Click
    end
    object ContinuousPingSpdBtn8: TSpeedButton
      Tag = 8
      Left = 619
      Top = 3
      Width = 125
      Height = 25
      AllowAllUp = True
      GroupIndex = 8
      Caption = 'Ping 8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clPurple
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtn8Click
    end
    object Label5L: TLabel
      Left = 130
      Top = 6
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low'
    end
    object Label5H: TLabel
      Left = 130
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'High'
    end
    object Label5A: TLabel
      Tag = 5
      Left = 130
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Average'
      OnMouseDown = AverageLabelMouseDown
    end
    object Label6L: TLabel
      Left = 183
      Top = 6
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low'
    end
    object Label6H: TLabel
      Left = 183
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'High'
    end
    object Label6A: TLabel
      Tag = 6
      Left = 183
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Average'
      OnMouseDown = AverageLabelMouseDown
    end
    object Label7L: TLabel
      Left = 240
      Top = 6
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low'
    end
    object Label7H: TLabel
      Left = 240
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'High'
    end
    object Label7A: TLabel
      Tag = 7
      Left = 240
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Average'
      OnMouseDown = AverageLabelMouseDown
    end
    object Label8L: TLabel
      Left = 297
      Top = 6
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low'
    end
    object Label8H: TLabel
      Left = 297
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'High'
    end
    object Label8A: TLabel
      Tag = 8
      Left = 297
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Average'
      OnMouseDown = AverageLabelMouseDown
    end
    object Label5T: TLabel
      Tag = 5
      Left = 130
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Timeouts'
      OnMouseDown = LabelxTMouseDown
      OnMouseUp = LabelxTMouseUp
    end
    object Label5LTT: TLabel
      Tag = 1
      Left = 130
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time'
    end
    object Label6T: TLabel
      Tag = 6
      Left = 183
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Timeouts'
      OnMouseDown = LabelxTMouseDown
      OnMouseUp = LabelxTMouseUp
    end
    object Label6LTT: TLabel
      Tag = 1
      Left = 183
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time'
    end
    object Label7T: TLabel
      Tag = 7
      Left = 240
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Timeouts'
      OnMouseDown = LabelxTMouseDown
      OnMouseUp = LabelxTMouseUp
    end
    object Label7LTT: TLabel
      Tag = 1
      Left = 240
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time'
    end
    object Label8T: TLabel
      Tag = 8
      Left = 297
      Top = 22
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Timeouts'
      OnMouseDown = LabelxTMouseDown
      OnMouseUp = LabelxTMouseUp
    end
    object Label8LTT: TLabel
      Tag = 1
      Left = 297
      Top = 38
      Width = 45
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'Time'
    end
    object HostComboBox5: TComboBox
      Tag = 5
      Left = 1
      Top = 32
      Width = 125
      Height = 21
      TabOrder = 0
      Text = 'www.yahoo.com'
      OnChange = HostComboBoxChange
    end
    object HostComboBox6: TComboBox
      Tag = 6
      Left = 358
      Top = 32
      Width = 125
      Height = 21
      TabOrder = 1
      Text = 'www.yahoo.com'
      OnChange = HostComboBoxChange
    end
    object HostComboBox7: TComboBox
      Tag = 7
      Left = 488
      Top = 32
      Width = 125
      Height = 21
      TabOrder = 2
      Text = 'www.yahoo.com'
      OnChange = HostComboBoxChange
    end
    object HostComboBox8: TComboBox
      Tag = 8
      Left = 619
      Top = 32
      Width = 125
      Height = 21
      TabOrder = 3
      Text = 'www.yahoo.com'
      OnChange = HostComboBoxChange
    end
  end
  object Timer1: TTimer
    Tag = 1
    Enabled = False
    OnTimer = TimerTimer
    Left = 32
    Top = 240
  end
  object Timer2: TTimer
    Tag = 2
    Enabled = False
    OnTimer = TimerTimer
    Left = 80
    Top = 240
  end
  object Timer3: TTimer
    Tag = 3
    Enabled = False
    OnTimer = TimerTimer
    Left = 128
    Top = 240
  end
  object Timer4: TTimer
    Tag = 4
    Enabled = False
    OnTimer = TimerTimer
    Left = 176
    Top = 240
  end
  object Timer5: TTimer
    Tag = 5
    Enabled = False
    OnTimer = TimerTimer
    Left = 232
    Top = 240
  end
  object Timer6: TTimer
    Tag = 6
    Enabled = False
    OnTimer = TimerTimer
    Left = 280
    Top = 240
  end
  object Timer7: TTimer
    Tag = 7
    Enabled = False
    OnTimer = TimerTimer
    Left = 328
    Top = 240
  end
  object Timer8: TTimer
    Tag = 8
    Enabled = False
    OnTimer = TimerTimer
    Left = 376
    Top = 240
  end
  object ColorDialog: TColorDialog
    Left = 624
    Top = 224
  end
  object OpenDialog: TOpenDialog
    Left = 696
    Top = 224
  end
  object SaveDialog: TSaveDialog
    Left = 696
    Top = 120
  end
  object MainMenu: TMainMenu
    Left = 25
    Top = 131
    object mmiFile: TMenuItem
      Caption = 'File'
      OnClick = aExitExecute
      object mmiSaveToCmdFile: TMenuItem
        Action = aSaveToCmdFile
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mmiOpenDtaDirInExplorer: TMenuItem
        Action = aOpenDtaDirInExplorer
      end
      object mmiCopyDtaDirPathToClipboard: TMenuItem
        Action = aCopyDtaDirPathToClipboard
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mmiOpenLstDirInExplorer: TMenuItem
        Action = aOpenLstDirInExplorer
      end
      object mmiCopyLstDirPathToClipboard: TMenuItem
        Action = aCopyLstDirPathToClipboard
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mmiExit: TMenuItem
        Action = aExit
      end
    end
    object mmiManageHosts: TMenuItem
      Caption = 'Manage Hosts'
      object mmiHostListEditor: TMenuItem
        Action = aHostListEditor
      end
      object mmiClearHosts: TMenuItem
        Action = aClearHosts
      end
    end
    object mmiStartPingingAllHosts: TMenuItem
      Action = aStartPingingAllHosts
    end
    object mmiStopPingingAllHosts: TMenuItem
      Action = aStopPingingAllHosts
    end
    object mmi4or8: TMenuItem
      Action = a4or8
    end
    object mmiMisc: TMenuItem
      Caption = 'Misc'
      object mmiClearGraph: TMenuItem
        Action = aClearGraph
      end
      object mmiDisplayLog: TMenuItem
        Action = aDisplayLog
      end
      object mmiReports: TMenuItem
        Caption = 'Reports'
        object mmiLast7DaysSummaryReport: TMenuItem
          Action = aLast7DaysSummaryReport
        end
        object mmiMonthOfSummaryReports: TMenuItem
          Action = aMonthOfSummaryReports
        end
      end
    end
    object mmiVersionAbout: TMenuItem
      Action = aAbout
    end
  end
  object ActionList: TActionList
    Left = 89
    Top = 131
    object aClearHosts: TAction
      Caption = 'Clear Hosts'
      OnExecute = aClearHostsExecute
    end
    object aHostListEditor: TAction
      Caption = 'Host List Editor'
      OnExecute = aHostListEditorExecute
    end
    object aStartPingingAllHosts: TAction
      Caption = 'Ping All'
      OnExecute = aStartPingingAllHostsExecute
    end
    object aStopPingingAllHosts: TAction
      Caption = 'Ping None'
      OnExecute = aStopPingingAllHostsExecute
    end
    object aSaveToCmdFile: TAction
      Caption = 'Save To Cmd File'
      Hint = 'Save current selections to CMD file'
      OnExecute = aSaveToCmdFileExecute
    end
    object aOpenDtaDirInExplorer: TAction
      Caption = 'Open DtaDir In Explorer'
      OnExecute = aOpenDtaDirInExplorerExecute
    end
    object aCopyDtaDirPathToClipboard: TAction
      Caption = 'Copy DtaDir Path To Clipboard'
      OnExecute = aCopyDtaDirPathToClipboardExecute
    end
    object aOpenLstDirInExplorer: TAction
      Caption = 'Open LstDir In Explorer'
      OnExecute = aOpenLstDirInExplorerExecute
    end
    object aCopyLstDirPathToClipboard: TAction
      Caption = 'Copy LstDir Path To Clipboard'
      OnExecute = aCopyLstDirPathToClipboardExecute
    end
    object aClearGraph: TAction
      Caption = 'Clear Graph'
      Hint = 'Clear inactive Memos and Graph Lines'
      OnExecute = aClearGraphExecute
    end
    object aAbout: TAction
      Caption = 'About'
      OnExecute = aAboutExecute
    end
    object aDisplayLog: TAction
      Caption = 'Display Log'
      OnExecute = aDisplayLogExecute
    end
    object a4or8: TAction
      Caption = '4or8'
      OnExecute = a4or8Execute
    end
    object aLast7DaysSummaryReport: TAction
      Caption = 'Last 7 Days Summary Report'
      OnExecute = aLast7DaysSummaryReportExecute
    end
    object aMonthOfSummaryReports: TAction
      Caption = 'Month Of Summary Reports'
      Enabled = False
      OnExecute = aMonthOfSummaryReportsExecute
    end
    object aExit: TAction
      Caption = 'Exit'
      OnExecute = aExitExecute
    end
  end
end
