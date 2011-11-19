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
  object EdtTamanho: TEdit
    Left = 32
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BtnInicial: TButton
    Left = 248
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Inicializar'
    TabOrder = 1
    OnClick = BtnInicialClick
  end
  object BtnTamanho: TButton
    Left = 248
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Tamanho'
    TabOrder = 2
    OnClick = BtnTamanhoClick
  end
  object MemoMostrar: TMemo
    Left = 32
    Top = 64
    Width = 185
    Height = 140
    ScrollBars = ssVertical
    TabOrder = 3
  end
end
