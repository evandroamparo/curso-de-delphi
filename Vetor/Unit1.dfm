object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Adicionando ao Vetor'
  ClientHeight = 212
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object EdtAdd: TEdit
    Left = 48
    Top = 50
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object BtnSalvar: TButton
    Left = 256
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 1
    OnClick = BtnSalvarClick
  end
  object MemoNomes: TMemo
    Left = 48
    Top = 96
    Width = 185
    Height = 89
    TabOrder = 2
  end
  object BtnPesq: TButton
    Left = 256
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Pesquisar'
    TabOrder = 3
    OnClick = BtnPesqClick
  end
end
