object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 394
  ClientWidth = 585
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 13
    Width = 53
    Height = 13
    Caption = 'Conjunto 1'
  end
  object Label2: TLabel
    Left = 144
    Top = 13
    Width = 53
    Height = 13
    Caption = 'Conjunto 2'
  end
  object Label3: TLabel
    Left = 432
    Top = 13
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object Memo1: TMemo
    Left = 32
    Top = 32
    Width = 81
    Height = 337
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 144
    Top = 32
    Width = 81
    Height = 337
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object RbtUniao: TRadioButton
    Left = 296
    Top = 88
    Width = 113
    Height = 17
    Caption = 'Uniao'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object RbtDiferenca: TRadioButton
    Left = 296
    Top = 128
    Width = 113
    Height = 17
    Caption = 'Diferenca'
    TabOrder = 3
  end
  object BtnCalcular: TButton
    Left = 288
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 4
    OnClick = BtnCalcularClick
  end
  object Memo3: TMemo
    Left = 432
    Top = 32
    Width = 97
    Height = 337
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object Rbtintercecao: TRadioButton
    Left = 296
    Top = 168
    Width = 113
    Height = 17
    Caption = 'Interce'#231#227'o'
    TabOrder = 6
  end
end
