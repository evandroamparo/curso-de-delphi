object FrmCadastroPlanoContas: TFrmCadastroPlanoContas
  Left = 0
  Top = 0
  Caption = 'FrmCadastroPlanoContas'
  ClientHeight = 206
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    459
    206)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object EdtDescricao: TEdit
    Left = 8
    Top = 27
    Width = 443
    Height = 21
    MaxLength = 60
    TabOrder = 0
  end
  object GrbTipoOperacao: TGroupBox
    Left = 8
    Top = 54
    Width = 185
    Height = 105
    Caption = 'Tipo de Opera'#231#227'o:'
    TabOrder = 1
    object RbtCredito: TRadioButton
      Left = 24
      Top = 32
      Width = 113
      Height = 17
      Caption = 'Cr'#233'dito'
      TabOrder = 0
    end
    object RbtDebito: TRadioButton
      Left = 24
      Top = 55
      Width = 113
      Height = 17
      Caption = 'D'#233'bito'
      TabOrder = 1
    end
  end
  object BtnSalvar: TButton
    Left = 295
    Top = 173
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Salvar'
    ModalResult = 1
    TabOrder = 2
    OnClick = BtnSalvarClick
  end
  object BtnCancelar: TButton
    Left = 376
    Top = 173
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 3
  end
end
