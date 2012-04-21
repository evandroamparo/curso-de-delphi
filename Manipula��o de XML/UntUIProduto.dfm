object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 202
  ClientWidth = 246
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 40
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object Label2: TLabel
    Left = 16
    Top = 59
    Width = 51
    Height = 13
    Caption = 'Categoria:'
  end
  object Label3: TLabel
    Left = 16
    Top = 89
    Width = 80
    Height = 13
    Caption = 'Unidade Medida:'
  end
  object Label4: TLabel
    Left = 16
    Top = 116
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object EdtDescricao: TEdit
    Left = 102
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object EdtCategoria: TEdit
    Left = 102
    Top = 59
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object EdtUnidadeMedida: TEdit
    Left = 102
    Top = 86
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object EdtValor: TEdit
    Left = 102
    Top = 113
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object BtnSalvar: TButton
    Left = 67
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 4
    OnClick = BtnSalvarClick
  end
  object Button2: TButton
    Left = 148
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 5
  end
end
