object fGeometrie: TfGeometrie
  Left = 228
  Top = 127
  Width = 581
  Height = 500
  BorderWidth = 4
  Caption = 'Rotation and symmetry of the polygon'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 562
    Height = 464
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 2
    Color = clHighlight
    TabOrder = 0
    object pb: TPaintBox
      Left = 2
      Top = 2
      Width = 558
      Height = 460
      Align = alClient
      OnPaint = pbPaint
    end
  end
end
