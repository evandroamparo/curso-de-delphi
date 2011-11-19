unit UntUIFabricante;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ClsFabricante, StdCtrls;

type
  TUIFabricante = class(TForm)
    EdtNome: TEdit;
    Label1: TLabel;
    EdtDataUltimaCompra: TEdit;
    Label2: TLabel;
    EdtEndereco: TEdit;
    Label3: TLabel;
    EdtTelefone: TEdit;
    Label4: TLabel;
    EdtSite: TEdit;
    Label5: TLabel;
    EdtEmail: TEdit;
    Label6: TLabel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Fabricante : TFabricante;  //Declaração do objeto.

  end;

var
  UIFabricante: TUIFabricante;

implementation

{$R *.dfm}

procedure TUIFabricante.BtnSalvarClick(Sender: TObject);
begin
  if Fabricante = nil then
  begin
    Fabricante := TFabricante.Create;// cria o objeto.
  end;
  Fabricante.Nome := EdtNome.Text;
  Fabricante.Endereco:= EdtEndereco.Text;
  Fabricante.Telefone:= EdtTelefone.Text;
  Fabricante.Email:= EdtEmail.Text;
  Fabricante.Site:= EdtSite.Text;
end;

procedure TUIFabricante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;// Quando o form for fechado ele libera memória.
end;

procedure TUIFabricante.FormShow(Sender: TObject);
begin
  if Fabricante <> nil then
  begin
    EdtNome.Text := Fabricante.Nome;
    EdtEndereco.Text := Fabricante.Endereco;
    EdtTelefone.Text:= Fabricante.Telefone;
    EdtSite.Text := Fabricante.Site;
    EdtEmail.Text := Fabricante.Email;
  end;
end;

end.
