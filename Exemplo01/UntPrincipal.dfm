object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Exemplo_1'
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
  object BtnOk: TButton
    Left = 32
    Top = 88
    Width = 75
    Height = 25
    Caption = '&ok'
    Enabled = False
    TabOrder = 0
    OnClick = BtnOkClick
  end
  object EdtNome: TEdit
    Left = 32
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    OnChange = EdtNomeChange
  end
  object ChkStatus: TCheckBox
    Left = 240
    Top = 26
    Width = 97
    Height = 17
    Caption = 'Ativo'
    Enabled = False
    TabOrder = 2
  end
end
