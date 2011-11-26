object FrmCadastroCliente: TFrmCadastroCliente
  Left = 0
  Top = 0
  Caption = 'Cadastro de Cliente'
  ClientHeight = 218
  ClientWidth = 447
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
    Left = 8
    Top = 28
    Width = 95
    Height = 13
    Caption = 'Raz'#227'o Social/Nome:'
  end
  object Label2: TLabel
    Left = 8
    Top = 51
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
  end
  object Label3: TLabel
    Left = 8
    Top = 150
    Width = 32
    Height = 13
    Caption = 'E-mail:'
  end
  object EdtRazaoSocialNome: TEdit
    Left = 109
    Top = 24
    Width = 330
    Height = 21
    TabOrder = 0
  end
  object EdtEmail: TEdit
    Left = 109
    Top = 146
    Width = 330
    Height = 21
    TabOrder = 1
  end
  object MemoEndereco: TMemo
    Left = 109
    Top = 51
    Width = 330
    Height = 89
    TabOrder = 2
  end
  object BtnSalvar: TButton
    Left = 283
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = BtnSalvarClick
  end
  object BtnCancelar: TButton
    Left = 364
    Top = 185
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = BtnCancelarClick
  end
end
