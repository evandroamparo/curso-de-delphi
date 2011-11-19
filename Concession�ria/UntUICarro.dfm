object UICarro: TUICarro
  Left = 0
  Top = 0
  Caption = 'UICarro'
  ClientHeight = 364
  ClientWidth = 518
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 29
    Width = 74
    Height = 13
    Caption = 'Ano Fabrica'#231#227'o'
  end
  object Label2: TLabel
    Left = 16
    Top = 77
    Width = 56
    Height = 13
    Caption = 'Ano Modelo'
  end
  object Label3: TLabel
    Left = 16
    Top = 136
    Width = 34
    Height = 13
    Caption = 'Modelo'
  end
  object Label4: TLabel
    Left = 16
    Top = 184
    Width = 17
    Height = 13
    Caption = 'Cor'
  end
  object Label5: TLabel
    Left = 16
    Top = 232
    Width = 28
    Height = 13
    Caption = 'Motor'
  end
  object Label6: TLabel
    Left = 16
    Top = 288
    Width = 31
    Height = 13
    Caption = 'Portas'
  end
  object Label7: TLabel
    Left = 120
    Top = 288
    Width = 25
    Height = 13
    Caption = 'Placa'
  end
  object Label8: TLabel
    Left = 328
    Top = 29
    Width = 73
    Height = 13
    Caption = 'Tipo de dire'#231#227'o'
  end
  object Label9: TLabel
    Left = 328
    Top = 160
    Width = 96
    Height = 13
    Caption = 'Lista de Fabricantes'
  end
  object EdtModelo: TEdit
    Left = 16
    Top = 155
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object EdtCor: TEdit
    Left = 16
    Top = 203
    Width = 113
    Height = 21
    TabOrder = 1
  end
  object EdtMotor: TEdit
    Left = 16
    Top = 251
    Width = 113
    Height = 21
    TabOrder = 2
  end
  object MskEdtPlaca: TMaskEdit
    Left = 120
    Top = 307
    Width = 54
    Height = 21
    EditMask = '>LLL-0000;1;_'
    MaxLength = 8
    TabOrder = 3
    Text = '   -    '
  end
  object Panel1: TPanel
    Left = 328
    Top = 50
    Width = 129
    Height = 87
    TabOrder = 4
    object RbtnHidraulica: TRadioButton
      Left = 16
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Hidr'#225'ulica'
      TabOrder = 0
    end
    object RbtnEletrica: TRadioButton
      Left = 16
      Top = 39
      Width = 97
      Height = 17
      Caption = 'El'#233'trica'
      TabOrder = 1
    end
    object RbtnNormal: TRadioButton
      Left = 16
      Top = 62
      Width = 97
      Height = 17
      Caption = 'Normal'
      TabOrder = 2
    end
  end
  object cboListaFabricantes: TComboBox
    Left = 328
    Top = 184
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
  end
  object BtnSalvar: TButton
    Left = 296
    Top = 305
    Width = 75
    Height = 25
    Caption = 'Salvar'
    ModalResult = 1
    TabOrder = 6
    OnClick = BtnSalvarClick
  end
  object BtnCancelar: TButton
    Left = 398
    Top = 307
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 7
  end
  object EdtAnofabricacao: TEdit
    Left = 16
    Top = 50
    Width = 74
    Height = 21
    TabOrder = 8
  end
  object EdtAnoModelo: TEdit
    Left = 16
    Top = 96
    Width = 74
    Height = 21
    TabOrder = 9
  end
  object cboPortas: TComboBox
    Left = 16
    Top = 307
    Width = 74
    Height = 21
    ItemHeight = 13
    TabOrder = 10
    Items.Strings = (
      '2'
      '4')
  end
end
