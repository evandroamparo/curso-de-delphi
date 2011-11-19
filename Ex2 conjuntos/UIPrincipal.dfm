object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = Memo1
  Caption = 'Opera'#231#245'es com conjuntos'
  ClientHeight = 323
  ClientWidth = 560
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
    Left = 8
    Top = 8
    Width = 58
    Height = 13
    Caption = 'Conjunto A:'
  end
  object Label2: TLabel
    Left = 127
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Conjunto B:'
  end
  object Label4: TLabel
    Left = 439
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object Label3: TLabel
    Left = 249
    Top = 8
    Width = 51
    Height = 13
    Caption = 'Opera'#231#227'o:'
  end
  object Memo1: TMemo
    Left = 8
    Top = 27
    Width = 113
    Height = 288
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Memo2: TMemo
    Left = 127
    Top = 27
    Width = 113
    Height = 288
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object Memo3: TMemo
    Left = 439
    Top = 27
    Width = 113
    Height = 288
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 246
    Top = 27
    Width = 184
    Height = 79
    TabOrder = 2
    object RbtUniao: TRadioButton
      Left = 16
      Top = 16
      Width = 113
      Height = 17
      Caption = 'Uni'#227'o'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RbtDiferenca: TRadioButton
      Left = 16
      Top = 47
      Width = 113
      Height = 17
      Caption = 'Diferen'#231'a'
      TabOrder = 1
    end
  end
  object BtnCalcular: TButton
    Left = 303
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = BtnCalcularClick
  end
end
