unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EdtNome: TEdit;
    EdtEmail: TEdit;
    EdtTelefone: TEdit;
    RbtAtivo: TRadioButton;
    RbtInativo: TRadioButton;
    BtnIncluir: TButton;
    BtnAlterar: TButton;
    BtnExcluir: TButton;
    LblNome: TLabel;
    LblEmail: TLabel;
    LblTelefone: TLabel;
    procedure BtnIncluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UntCliente;

{$R *.dfm}

procedure TForm1.BtnIncluirClick(Sender: TObject);
Var
 NovoCliente: Cliente;
begin
 NovoCliente.Nome:= EdtNome.Text;
 NovoCliente.Email:= EdtEmail.Text;
 NovoCliente.Telefone:= EdtTelefone.Text;
 if RbtAtivo.Checked then
 NovoCliente.Status:= scAtivo
 else
 NovoCliente.Status:= scInativo;
 InserirCliente(NovoCliente);
end;

end.
