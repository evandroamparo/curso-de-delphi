unit UntUICarro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ExtCtrls, clsCarro;

type
  TUICarro = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdtModelo: TEdit;
    Label4: TLabel;
    EdtCor: TEdit;
    Label5: TLabel;
    EdtMotor: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    MskEdtPlaca: TMaskEdit;
    Panel1: TPanel;
    RbtnHidraulica: TRadioButton;
    RbtnEletrica: TRadioButton;
    RbtnNormal: TRadioButton;
    Label8: TLabel;
    cboListaFabricantes: TComboBox;
    Label9: TLabel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    EdtAnofabricacao: TEdit;
    EdtAnoModelo: TEdit;
    cboPortas: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
   Carro : TCarro;
  end;

var
  UICarro: TUICarro;

implementation

uses ClsFabricante;

{$R *.dfm}

procedure TUICarro.BtnSalvarClick(Sender: TObject);
var
  Fabricante: TFabricante;
  CodigoFab: Integer;
begin
  if Carro = nil then
  begin
    Carro := TCarro.Create;
  end;
    Carro.AnoFabricacao:=  StrToInt(EdtAnofabricacao.Text) ;
    Carro.AnoModelo:= StrToInt(EdtAnoModelo.Text);
    Carro.Modelo:= EdtModelo.Text;
    Carro.Cor:= EdtCor.Text;
    Carro.Motor:= StrToFloat(StringReplace(EdtMotor.Text, '.',',', []));
    if RbtnHidraulica.Checked then
    begin
      Carro.Direcao:= tdHidraulica;
    end
    else if RbtnEletrica.Checked then
    begin
      Carro.Direcao := tdEletrica;
    end
    else
    begin
    Carro.Direcao:= tdNormal;
    end;
    carro.Placa := MskEdtPlaca.Text;
    carro.Portas:= StrToInt(cboPortas.Text);
    Fabricante := TFabricante(cboListaFabricantes.Items.Objects[cboListaFabricantes.ItemIndex]);
    CodigoFab := Fabricante.Codigo;
//    carro.CodigoFabricante:= TFabricante(cboListaFabricantes.Items.Objects[cboListaFabricantes.ItemIndex]).Codigo;
    Carro.CodigoFabricante := CodigoFab;
end;

procedure TUICarro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TUICarro.FormShow(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to TFabricante.ListaFabricantes.Count - 1 do
  begin
    cboListaFabricantes.Items.AddObject(TFabricante(TFabricante.ListaFabricantes[i]).Nome,
     TFabricante.ListaFabricantes[i]);
  end;

  if Carro <> nil then
  begin
    EdtAnofabricacao.Text := IntToStr(Carro.AnoFabricacao);
    EdtModelo.Text := Carro.Modelo;
    EdtMotor.Text:= StringReplace(Format('%.1f', [Carro.Motor]), ',', '.', []);//substitui vírgula por ponto
    //e formata o texto.
    EdtAnoModelo.Text := IntToStr(Carro.AnoModelo);
    cboPortas.Text := IntToStr(Carro.Portas);
    EdtCor.Text := Carro.Cor;
    case Carro.Direcao of
      tdHidraulica:RbtnHidraulica.Checked := true ;
      tdEletrica: RbtnEletrica.Checked := true ;
      tdNormal: RbtnNormal.Checked := true;
    end;
    for i := 0 to cboListaFabricantes.Items.Count - 1 do
      begin
      if TFabricante(cboListaFabricantes.Items.Objects[i]).Codigo = Carro.CodigoFabricante then
        cboListaFabricantes.ItemIndex := i;
      end;
      MskEdtPlaca.Text := Carro.Placa;
  end;
end;

end.
