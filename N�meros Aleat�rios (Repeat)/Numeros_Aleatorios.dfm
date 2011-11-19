object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 212
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LblNum: TLabel
    Left = 136
    Top = 32
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object EdtNum: TEdit
    Left = 136
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BtnTestar: TButton
    Left = 136
    Top = 112
    Width = 121
    Height = 25
    Caption = 'Testar'
    TabOrder = 1
    OnClick = BtnTestarClick
  end
end
