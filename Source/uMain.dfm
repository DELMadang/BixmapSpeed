object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = #51060#48120#51648' '#49373#49457#49549#46020' '#48708#44368
  ClientHeight = 706
  ClientWidth = 896
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Image1: TImage
    Left = 8
    Top = 16
    Width = 800
    Height = 600
  end
  object eMemo: TMemo
    Left = 8
    Top = 624
    Width = 801
    Height = 81
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnPixel: TButton
    Left = 816
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Pixel'
    TabOrder = 1
    OnClick = btnPixelClick
  end
  object btnScanline: TButton
    Left = 816
    Top = 47
    Width = 75
    Height = 25
    Caption = 'ScanLine'
    TabOrder = 2
    OnClick = btnScanlineClick
  end
  object btnGrey: TButton
    Left = 816
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Grey'
    TabOrder = 3
    OnClick = btnGreyClick
  end
end
