object UIListaFabricantes: TUIListaFabricantes
  Left = 0
  Top = 0
  Caption = 'UIListaFabricantes'
  ClientHeight = 322
  ClientWidth = 526
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    526
    322)
  PixelsPerInch = 96
  TextHeight = 13
  object sgFabricantes: TStringGrid
    Left = 8
    Top = 8
    Width = 510
    Height = 261
    Anchors = [akLeft, akTop, akRight, akBottom]
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      111
      110
      119
      136)
  end
  object BtnIncluir: TButton
    Left = 8
    Top = 289
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = BtnIncluirClick
  end
  object BtnExcluir: TButton
    Left = 257
    Top = 289
    Width = 75
    Height = 25
    Anchors = [akLeft]
    Caption = 'Excluir'
    TabOrder = 2
    OnClick = BtnExcluirClick
  end
  object BtnAlterar: TButton
    Left = 128
    Top = 289
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Alterar'
    TabOrder = 3
    OnClick = BtnAlterarClick
  end
  object BtnSair: TButton
    Left = 392
    Top = 289
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Sair'
    TabOrder = 4
  end
end
