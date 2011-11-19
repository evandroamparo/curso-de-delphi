object UICadastro: TUICadastro
  Left = 0
  Top = 0
  Caption = 'UICadastro'
  ClientHeight = 344
  ClientWidth = 645
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
    Left = 40
    Top = 37
    Width = 35
    Height = 16
    Caption = 'Nome'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 125
    Width = 63
    Height = 16
    Caption = 'Descri'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 424
    Top = 37
    Width = 34
    Height = 16
    Caption = 'Valor'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 424
    Top = 125
    Width = 52
    Height = 16
    Caption = 'Estoque'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtNome: TEdit
    Left = 40
    Top = 56
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object EdtDescricao: TEdit
    Left = 40
    Top = 144
    Width = 257
    Height = 21
    TabOrder = 1
  end
  object EdtValor: TEdit
    Left = 424
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
    OnKeyPress = EdtValorKeyPress
  end
  object EdtEstoque: TEdit
    Left = 424
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 3
    OnKeyPress = EdtEstoqueKeyPress
  end
  object BtnSalvar: TButton
    Left = 40
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Salvar'
    ModalResult = 1
    TabOrder = 4
  end
  object BtnCancelar: TButton
    Left = 168
    Top = 272
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
  end
end
