object FrmConsultaContasPagar: TFrmConsultaContasPagar
  Left = 0
  Top = 0
  Caption = 'FrmConsultaContasPagar'
  ClientHeight = 382
  ClientWidth = 701
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
    Width = 701
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
  object StgContasPagar: TStringGrid
    Left = 0
    Top = 42
    Width = 701
    Height = 340
    Align = alClient
    ColCount = 7
    FixedCols = 0
    RowCount = 2
    TabOrder = 1
    ExplicitLeft = 56
    ExplicitTop = 120
    ExplicitWidth = 320
    ExplicitHeight = 120
    ColWidths = (
      64
      64
      64
      64
      64
      64
      64)
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = ActInserir
            Caption = '&Inserir'
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
    Left = 48
    Top = 312
    StyleName = 'Platform Default'
    object ActInserir: TAction
      Caption = 'Inserir'
      ImageIndex = 0
    end
    object ActAlterar: TAction
      Caption = 'Alterar'
      ImageIndex = 1
    end
    object ActExcluir: TAction
      Caption = 'Excluir'
      ImageIndex = 2
    end
  end
end
