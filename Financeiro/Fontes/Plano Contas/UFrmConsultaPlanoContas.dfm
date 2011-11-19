object FrmConsultaPlanoContas: TFrmConsultaPlanoContas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Planos de Contas'
  ClientHeight = 455
  ClientWidth = 736
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 736
    Height = 23
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
  object StgPlanoContas: TStringGrid
    Left = 0
    Top = 23
    Width = 736
    Height = 432
    Align = alClient
    ColCount = 3
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 1
    ExplicitTop = 57
    ExplicitHeight = 398
    ColWidths = (
      64
      295
      143)
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActIncluir
            Caption = '&Incluir'
          end
          item
            Action = ActAlterar
            Caption = '&Alterar'
          end
          item
            Action = ActExcluir
            Caption = '&Excluir'
          end>
        ActionBar = ActionToolBar1
      end>
    Left = 32
    Top = 400
    StyleName = 'Platform Default'
    object ActIncluir: TAction
      Caption = 'Incluir'
      OnExecute = ActIncluirExecute
    end
    object ActAlterar: TAction
      Caption = 'Alterar'
      OnExecute = ActAlterarExecute
    end
    object ActExcluir: TAction
      Caption = 'Excluir'
      OnExecute = ActExcluirExecute
    end
  end
end
