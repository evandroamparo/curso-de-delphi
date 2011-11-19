object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 236
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    447
    236)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 392
    Top = 24
    Width = 23
    Height = 22
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 392
    Top = 64
    Width = 23
    Height = 22
    OnClick = SpeedButton2Click
  end
  object Label1: TLabel
    Left = 8
    Top = 27
    Width = 73
    Height = 13
    Caption = 'Caminho Banco'
  end
  object Label2: TLabel
    Left = 8
    Top = 72
    Width = 56
    Height = 13
    Caption = 'Caminho Ini'
  end
  object Label3: TLabel
    Left = 8
    Top = 107
    Width = 55
    Height = 13
    Caption = 'C'#243'digo NFe'
  end
  object Label4: TLabel
    Left = 8
    Top = 163
    Width = 68
    Height = 13
    Caption = 'Chave Acesso'
  end
  object EdtCaminhoBanco: TEdit
    Left = 87
    Top = 24
    Width = 281
    Height = 21
    TabOrder = 0
  end
  object EdtCaminhoIni: TEdit
    Left = 87
    Top = 69
    Width = 281
    Height = 21
    TabOrder = 1
  end
  object BtnAcertarNFe: TButton
    Left = 283
    Top = 203
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Acertar NFe'
    TabOrder = 2
    ExplicitTop = 169
  end
  object BtnSair: TButton
    Left = 364
    Top = 203
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Sair'
    TabOrder = 3
    OnClick = BtnSairClick
    ExplicitTop = 169
  end
  object EdtCodigoNFe: TEdit
    Left = 87
    Top = 104
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object EdtChaveAcesso: TEdit
    Left = 87
    Top = 160
    Width = 281
    Height = 21
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 24
    Top = 192
  end
end
