object UIListaClientes: TUIListaClientes
  Left = 0
  Top = 0
  Caption = 'UIListaClientes'
  ClientHeight = 332
  ClientWidth = 522
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
  object Label1: TLabel
    Left = 24
    Top = 53
    Width = 61
    Height = 13
    Caption = 'Lista clientes'
  end
  object SGClientes: TStringGrid
    Left = 8
    Top = 72
    Width = 506
    Height = 120
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
    ColWidths = (
      114
      130
      98
      79
      76)
  end
  object BtnIncluir: TButton
    Left = 24
    Top = 224
    Width = 75
    Height = 25
    Caption = 'Incluir'
    ModalResult = 1
    TabOrder = 1
    OnClick = BtnIncluirClick
  end
  object BtnAlterar: TButton
    Left = 24
    Top = 255
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = BtnAlterarClick
  end
  object BtnExcluir: TButton
    Left = 24
    Top = 286
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = BtnExcluirClick
  end
end
