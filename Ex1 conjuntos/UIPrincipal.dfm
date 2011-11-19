object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Usando conjuntos'
  ClientHeight = 328
  ClientWidth = 491
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
    Top = 287
    Width = 86
    Height = 13
    Caption = 'Estilos escolhidos:'
  end
  object LblEstilos: TLabel
    Left = 8
    Top = 306
    Width = 4
    Height = 13
    Caption = '.'
  end
  object ChkNegrito: TCheckBox
    Left = 16
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Negrito'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ChkNegritoClick
  end
  object ChkItalico: TCheckBox
    Left = 119
    Top = 8
    Width = 97
    Height = 17
    Caption = 'It'#225'lico'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
    TabOrder = 1
    OnClick = ChkNegritoClick
  end
  object ChkSublinhado: TCheckBox
    Left = 222
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Sublinhado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    TabOrder = 2
    OnClick = ChkNegritoClick
  end
  object ChkTachado: TCheckBox
    Left = 325
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Tachado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsStrikeOut]
    ParentFont = False
    TabOrder = 3
    OnClick = ChkNegritoClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 44
    Width = 475
    Height = 237
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'Este '#233' o texto a ser formatado com as op'#231#245'es acima.'
      'Exemplo de uso de conjuntos no Delphi.')
    ParentFont = False
    TabOrder = 4
  end
end
