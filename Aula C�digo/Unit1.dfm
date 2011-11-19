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
  object EdtNum1: TEdit
    Left = 24
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EdtNum2: TEdit
    Left = 272
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object BtnCalcular: TButton
    Left = 56
    Top = 166
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = BtnCalcularClick
  end
  object EdtResultado: TEdit
    Left = 248
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object RbtSoma: TRadioButton
    Left = 72
    Top = 64
    Width = 41
    Height = 17
    Caption = ' +'
    TabOrder = 4
  end
  object Rbtsubtracao: TRadioButton
    Left = 72
    Top = 112
    Width = 41
    Height = 17
    Caption = ' -'
    TabOrder = 5
  end
  object RbtMultiplicacao: TRadioButton
    Left = 248
    Top = 64
    Width = 41
    Height = 17
    Caption = ' *'
    TabOrder = 6
  end
  object RbtDivisao: TRadioButton
    Left = 248
    Top = 112
    Width = 41
    Height = 17
    Caption = ' /'
    TabOrder = 7
  end
end
