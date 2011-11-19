object UIFabricante: TUIFabricante
  Left = 0
  Top = 0
  Caption = 'UIFabricante'
  ClientHeight = 316
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    467
    316)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 21
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 16
    Top = 69
    Width = 95
    Height = 13
    Caption = 'Data '#218'ltima Compra'
  end
  object Label3: TLabel
    Left = 16
    Top = 133
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label4: TLabel
    Left = 16
    Top = 197
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label5: TLabel
    Left = 320
    Top = 69
    Width = 18
    Height = 13
    Caption = 'Site'
  end
  object Label6: TLabel
    Left = 320
    Top = 21
    Width = 28
    Height = 13
    Caption = 'E-mail'
  end
  object EdtNome: TEdit
    Left = 16
    Top = 40
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object EdtDataUltimaCompra: TEdit
    Left = 16
    Top = 88
    Width = 95
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object EdtEndereco: TEdit
    Left = 16
    Top = 152
    Width = 249
    Height = 21
    TabOrder = 2
  end
  object EdtTelefone: TEdit
    Left = 16
    Top = 216
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object EdtSite: TEdit
    Left = 320
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object EdtEmail: TEdit
    Left = 320
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object BtnSalvar: TButton
    Left = 244
    Top = 272
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Salvar'
    ModalResult = 1
    TabOrder = 6
    OnClick = BtnSalvarClick
    ExplicitLeft = 256
  end
  object BtnCancelar: TButton
    Left = 354
    Top = 273
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 7
    ExplicitLeft = 366
    ExplicitTop = 272
  end
end
