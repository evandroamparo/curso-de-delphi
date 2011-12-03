object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 480
  ClientWidth = 780
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ActionManager1: TActionManager
    ActionBars = <
      item
      end>
    Left = 112
    Top = 40
    StyleName = 'Platform Default'
    object ActPlanoContas: TAction
      Category = 'Cadastros'
      Caption = 'Plano de Contas'
      OnExecute = ActPlanoContasExecute
    end
    object ActContasPagar: TAction
      Category = 'Cadastros'
      Caption = 'Contas a Pagar'
    end
    object ActContasReceber: TAction
      Category = 'Cadastros'
      Caption = 'Contas a Receber'
    end
    object ActClientes: TAction
      Category = 'Cadastros'
      Caption = 'Clientes'
      OnExecute = ActClientesExecute
    end
    object ActFornecedores: TAction
      Category = 'Cadastros'
      Caption = 'Fornecedores'
    end
    object ActMovimentacoes: TAction
      Category = 'Cadastros'
      Caption = 'Movimenta'#231#245'es do Plano de Contas'
    end
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 40
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object PlanodeContas1: TMenuItem
        Action = ActPlanoContas
      end
      object Clientes1: TMenuItem
        Action = ActClientes
      end
    end
  end
end
