object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 386
  ClientWidth = 573
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
    Top = 28
    Width = 23
    Height = 13
    Caption = 'Cep:'
  end
  object Label2: TLabel
    Left = 16
    Top = 55
    Width = 82
    Height = 13
    Caption = 'Tipo Logradouro:'
  end
  object Label3: TLabel
    Left = 16
    Top = 82
    Width = 55
    Height = 13
    Caption = 'Logradouro'
  end
  object Label4: TLabel
    Left = 16
    Top = 109
    Width = 28
    Height = 13
    Caption = 'Bairro'
  end
  object Label5: TLabel
    Left = 16
    Top = 136
    Width = 50
    Height = 13
    Caption = 'Localidade'
  end
  object Label6: TLabel
    Left = 16
    Top = 163
    Width = 37
    Height = 13
    Caption = 'Estado:'
  end
  object MskCep: TMaskEdit
    Left = 104
    Top = 24
    Width = 118
    Height = 21
    EditMask = '00000\-999;0; '
    MaxLength = 9
    TabOrder = 0
  end
  object EdtTipoLogradouro: TEdit
    Left = 104
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object EdtLogradouro: TEdit
    Left = 104
    Top = 78
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object EdtLocalidade: TEdit
    Left = 104
    Top = 132
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object EdtEstado: TEdit
    Left = 104
    Top = 159
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object EdtBairro: TEdit
    Left = 104
    Top = 105
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object BtnConsultar: TButton
    Left = 150
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 6
    OnClick = BtnConsultarClick
  end
end
