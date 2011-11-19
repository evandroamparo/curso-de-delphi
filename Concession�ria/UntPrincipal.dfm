object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 249
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 24
    Top = 40
    object mnuFabricantes: TMenuItem
      Caption = 'Fabricantes'
      OnClick = mnuFabricantesClick
    end
    object mnuCarros: TMenuItem
      Caption = 'Carros'
      OnClick = mnuCarrosClick
    end
  end
end
