object UIVenda: TUIVenda
  Left = 0
  Top = 0
  Caption = 'UIVenda'
  ClientHeight = 261
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 32
    Top = 29
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
    Left = 32
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
    Left = 342
    Top = 29
    Width = 74
    Height = 16
    Caption = 'Quantidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 342
    Top = 162
    Width = 70
    Height = 16
    Caption = 'Valor Total'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 342
    Top = 93
    Width = 88
    Height = 16
    Caption = 'Valor Unit'#225'rio'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtNome: TEdit
    Left = 32
    Top = 48
    Width = 137
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object EdtDescricao: TEdit
    Left = 32
    Top = 144
    Width = 185
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object EdtQuantidade: TEdit
    Left = 342
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 2
    OnChange = EdtQuantidadeChange
  end
  object EdtValorTotal: TEdit
    Left = 342
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object BtnVender: TButton
    Left = 32
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Vender'
    ModalResult = 1
    TabOrder = 4
  end
  object BtnCancelar: TButton
    Left = 160
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
  end
  object EdtValorUnitario: TEdit
    Left = 342
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 6
  end
end
