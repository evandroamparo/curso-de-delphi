object UIListaPerfis: TUIListaPerfis
  Left = 0
  Top = 0
  Caption = 'UIListaPerfis'
  ClientHeight = 532
  ClientWidth = 794
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
    Left = 16
    Top = 61
    Width = 27
    Height = 13
    Caption = 'Perfis'
  end
  object Label2: TLabel
    Left = 16
    Top = 205
    Width = 29
    Height = 13
    Caption = 'A'#231#245'es'
  end
  object ClbAcoes: TCheckListBox
    Left = 16
    Top = 224
    Width = 505
    Height = 201
    ItemHeight = 13
    TabOrder = 0
  end
  object LbPerfis: TListBox
    Left = 16
    Top = 80
    Width = 505
    Height = 97
    ItemHeight = 13
    TabOrder = 1
    OnClick = LbPerfisClick
  end
  object ActionManager1: TActionManager
    Left = 40
    Top = 16
    StyleName = 'Platform Default'
    object ActIncluirPerfil: TAction
      Caption = 'Incluir'
    end
    object ActExcluirPerfil: TAction
      Caption = 'Excluir'
    end
    object ActAlterarPerfil: TAction
      Caption = 'Alterar '
    end
    object ActIncluirAcoes: TAction
      Caption = 'Incluir Acoes'
    end
  end
end
