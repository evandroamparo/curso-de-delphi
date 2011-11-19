unit UntCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TUICadastroClientes = class(TForm)
    EdtNome: TEdit;
    EdtEmail: TEdit;
    EdtTelefone: TEdit;
    RbtAtivo: TRadioButton;
    RbtInativo: TRadioButton;
    LblNome: TLabel;
    LblEmail: TLabel;
    LblTelefone: TLabel;
    BtnCancelar: TButton;
    BtnSalvar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UICadastroClientes: TUICadastroClientes;

implementation

uses UntCliente;

{$R *.dfm}



end.
