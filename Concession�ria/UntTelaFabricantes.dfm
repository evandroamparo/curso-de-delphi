object UIFabricantes: TUIFabricantes
  Left = 0
  Top = 0
  Caption = 'Fabricantes'
  ClientHeight = 304
  ClientWidth = 527
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
    Top = 21
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 8
    Top = 85
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label3: TLabel
    Left = 368
    Top = 21
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label4: TLabel
    Left = 8
    Top = 157
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object Label5: TLabel
    Left = 306
    Top = 157
    Width = 18
    Height = 13
    Caption = 'Site'
  end
  object edtNome: TEdit
    Left = 8
    Top = 40
    Width = 225
    Height = 21
    TabOrder = 0
  end
  object edtEndereço: TEdit
    Left = 8
    Top = 104
    Width = 329
    Height = 21
    TabOrder = 1
  end
  object edtTelefone: TEdit
    Left = 368
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtEmail: TEdit
    Left = 8
    Top = 176
    Width = 177
    Height = 21
    TabOrder = 3
  end
  object edtSite: TEdit
    Left = 304
    Top = 176
    Width = 185
    Height = 21
    TabOrder = 4
  end
  object btnSalvar: TButton
    Left = 304
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 5
  end
  object btnCancelar: TButton
    Left = 414
    Top = 271
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 6
    OnClick = btnCancelarClick
  end
end
