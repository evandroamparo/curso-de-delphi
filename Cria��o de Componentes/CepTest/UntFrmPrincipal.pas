unit UntFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UntEndereco, UntServicoCep, StdCtrls, Mask;

type
  TForm1 = class(TForm)
    MskCep: TMaskEdit;
    EdtTipoLogradouro: TEdit;
    EdtLogradouro: TEdit;
    EdtLocalidade: TEdit;
    EdtEstado: TEdit;
    EdtBairro: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnConsultar: TButton;
    procedure BtnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnConsultarClick(Sender: TObject);
var
  ServicoCep : TServicoCep;
  Endereco: TEndereco;
begin
  Endereco := TEndereco.Create;
  ServicoCep := TServicoCep.Create('leandrobelge', '88030696');
  try
    try
      Endereco.Cep := '';//MskCep.Text;
      Endereco.TipoLogradouro := EdtTipoLogradouro.Text;
      Endereco.Logradouro := EdtLogradouro.Text;
      Endereco.Bairro := EdtBairro.Text;
      Endereco.Localidade := EdtLocalidade.Text;
      Endereco.Estado := EdtEstado.Text;
      if ServicoCep.ConsultaCep(Endereco) = true then begin
        MskCep.Text := Endereco.Cep;
        EdtTipoLogradouro.Text := Endereco.TipoLogradouro;
        EdtLogradouro.Text := Endereco.Logradouro;
        EdtBairro.Text := Endereco.Bairro;
        EdtLocalidade.Text := Endereco.Localidade;
        EdtEstado.Text := Endereco.Estado;
      end
      else begin
        ShowMessage('Não foi possível consultar o Cep.');
      end;
    finally
      Endereco.Free;
      ServicoCep.Free;
    end;
  Except
    on e: exception do
      Application.MessageBox(PWideChar(e.Message), 'Erro', MB_OK + MB_ICONERROR);
  end;
end;

end.
