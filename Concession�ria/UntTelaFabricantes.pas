unit UntTelaFabricantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TUIFabricantes = class(TForm)
    edtNome: TEdit;
    edtEndereço: TEdit;
    edtTelefone: TEdit;
    edtEmail: TEdit;
    edtSite: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UIFabricantes: TUIFabricantes;
implementation


 uses UntUIListaFabricantes, ClsFabricante;

{$R *.dfm}


procedure TUIFabricantes.btnCancelarClick(Sender: TObject);
begin
  close;
end;



end.
