object UntListaProdutos: TUntListaProdutos
  Left = 0
  Top = 0
  Caption = 'UntListaProdutos'
  ClientHeight = 591
  ClientWidth = 795
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
    Left = 32
    Top = 24
    Width = 114
    Height = 16
    Caption = 'Lista de Produtos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 368
    Width = 103
    Height = 16
    Caption = 'Lista de Vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object SGListaProdutos: TStringGrid
    Left = 32
    Top = 56
    Width = 705
    Height = 225
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 0
    ColWidths = (
      82
      147
      258
      99
      91)
  end
  object BtnIncluir: TButton
    Left = 32
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 1
    OnClick = BtnIncluirClick
  end
  object BtnAlterar: TButton
    Left = 152
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 2
    OnClick = BtnAlterarClick
  end
  object BtnExcluir: TButton
    Left = 280
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 3
    OnClick = BtnExcluirClick
  end
  object BtnVender: TButton
    Left = 400
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Vender'
    TabOrder = 4
    OnClick = BtnVenderClick
  end
  object SGListaVendaProdutos: TStringGrid
    Left = 32
    Top = 400
    Width = 702
    Height = 120
    ColCount = 6
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 5
    ColWidths = (
      79
      154
      219
      71
      78
      72)
  end
end
