object UIListaCarros: TUIListaCarros
  Left = 0
  Top = 0
  Caption = 'UIListaCarros'
  ClientHeight = 297
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    549
    297)
  PixelsPerInch = 96
  TextHeight = 13
  object sgCarros: TStringGrid
    Left = 24
    Top = 16
    Width = 494
    Height = 199
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeftNoAlign
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ParentBiDiMode = False
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      64
      87
      131
      85
      89)
  end
  object btnIncluir: TButton
    Left = 24
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akRight]
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = btnIncluirClick
  end
  object btnAlterar: TButton
    Left = 157
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akRight]
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = btnAlterarClick
  end
  object btnExcluir: TButton
    Left = 293
    Top = 250
    Width = 75
    Height = 25
    Anchors = [akRight]
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = btnExcluirClick
  end
  object btnSair: TButton
    Left = 436
    Top = 250
    Width = 82
    Height = 25
    Anchors = [akRight]
    Caption = 'Sair'
    TabOrder = 4
  end
end
