object DisplayLogForm: TDisplayLogForm
  Left = 0
  Top = 0
  Caption = 'Display Log'
  ClientHeight = 570
  ClientWidth = 850
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object PingChart: TChart
    Left = 0
    Top = 0
    Width = 850
    Height = 570
    AllowPanning = pmNone
    Legend.Visible = False
    Title.Text.Strings = (
      'Ping Time Chart')
    BottomAxis.DateTimeFormat = 'h:mm:ss'
    BottomAxis.Increment = 0.000011574074074074
    BottomAxis.LabelsAngle = 90
    View3D = False
    Zoom.Allow = False
    Align = alClient
    TabOrder = 0
    DesignSize = (
      850
      570)
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object LoadCSVSpdBtn: TSpeedButton
      Left = 809
      Top = 2
      Width = 37
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Load'
      Flat = True
      OnClick = LoadCSVSpdBtnClick
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
  object OpenDialog: TOpenDialog
    Left = 104
    Top = 88
  end
end
