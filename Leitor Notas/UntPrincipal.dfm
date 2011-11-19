object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = EdtNome
  Caption = 'Form1'
  ClientHeight = 331
  ClientWidth = 658
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object LblNome: TLabel
    Left = 48
    Top = 13
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object LblNota: TLabel
    Left = 48
    Top = 69
    Width = 23
    Height = 13
    Caption = 'Nota'
  end
  object LblMostrar: TLabel
    Left = 264
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Mostrar'
  end
  object BtnSalvar: TButton
    Left = 48
    Top = 128
    Width = 121
    Height = 25
    Caption = 'Salvar'
    TabOrder = 2
    OnClick = BtnSalvarClick
  end
  object BtnMaiorMenor: TButton
    Left = 48
    Top = 159
    Width = 121
    Height = 25
    Caption = 'Maior e Menor'
    Enabled = False
    TabOrder = 3
    OnClick = BtnMaiorMenorClick
  end
  object EdtNome: TEdit
    Left = 48
    Top = 32
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnChange = EdtNomeChange
    OnKeyPress = EdtNomeKeyPress
  end
  object EdtNota: TEdit
    Left = 48
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 1
    OnKeyPress = EdtNomeKeyPress
  end
  object MemoMostrar: TMemo
    Left = 264
    Top = 40
    Width = 329
    Height = 249
    TabOrder = 4
  end
  object BtnMaiorNota: TButton
    Left = 48
    Top = 190
    Width = 121
    Height = 25
    Caption = 'Maior'
    Enabled = False
    TabOrder = 5
    OnClick = BtnMaiorNotaClick
  end
  object BtnMenorNota: TButton
    Left = 48
    Top = 221
    Width = 121
    Height = 25
    Caption = 'Menor'
    Enabled = False
    TabOrder = 6
    OnClick = BtnMenorNotaClick
  end
  object BtnAprovado: TButton
    Left = 48
    Top = 252
    Width = 121
    Height = 25
    Caption = 'Aprovado'
    Enabled = False
    TabOrder = 7
    OnClick = BtnAprovadoClick
  end
  object BtnReprovado: TButton
    Left = 48
    Top = 283
    Width = 121
    Height = 25
    Caption = 'Reprovado'
    Enabled = False
    TabOrder = 8
    OnClick = BtnReprovadoClick
  end
end
