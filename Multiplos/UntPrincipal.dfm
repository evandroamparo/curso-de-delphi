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
    Left = 72
    Top = 13
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object LblMult: TLabel
    Left = 72
    Top = 64
    Width = 41
    Height = 13
    Caption = 'M'#250'ltiplos'
  end
  object EdtNum: TEdit
    Left = 72
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BtnCalc: TButton
    Left = 320
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 1
    OnClick = BtnCalcClick
  end
  object BtnLimpar: TButton
    Left = 320
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 2
    OnClick = BtnLimparClick
  end
  object MemoMult: TMemo
    Left = 72
    Top = 83
    Width = 185
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object BtnSair: TButton
    Left = 320
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 4
    OnClick = BtnSairClick
  end
end
