object FrmConsultaFornecedores: TFrmConsultaFornecedores
  Left = 0
  Top = 0
  Caption = 'FrmConsultaFornecedores'
  ClientHeight = 461
  ClientWidth = 747
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
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 747
    Height = 42
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.HighlightColor = clWhite
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Spacing = 0
  end
  object StgFornecedores: TStringGrid
    Left = 0
    Top = 42
    Width = 747
    Height = 419
    Align = alClient
    ColCount = 4
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    ExplicitTop = 23
    ExplicitHeight = 438
    ColWidths = (
      72
      263
      170
      204)
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActIncluir
            Caption = '&Incluir'
            ImageIndex = 0
          end
          item
            Action = ActAlterar
            Caption = '&Alterar'
            ImageIndex = 1
          end
          item
            Action = ActExcluir
            Caption = '&Excluir'
            ImageIndex = 2
          end>
        ActionBar = ActionToolBar1
      end>
    Images = DataModule1.ILstAcoes
    Left = 40
    Top = 384
    StyleName = 'Platform Default'
    object ActIncluir: TAction
      Caption = 'Incluir'
      ImageIndex = 0
      OnExecute = ActIncluirExecute
    end
    object ActAlterar: TAction
      Caption = 'Alterar'
      ImageIndex = 1
      OnExecute = ActAlterarExecute
    end
    object ActExcluir: TAction
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = ActExcluirExecute
    end
  end
end
