unit UntCadastroProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TUICadastro = class(TForm)
    EdtNome: TEdit;
    EdtDescricao: TEdit;
    EdtValor: TEdit;
    EdtEstoque: TEdit;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure EdtValorKeyPress(Sender: TObject; var Key: Char);
    procedure EdtEstoqueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UICadastro: TUICadastro;

implementation

uses UntProdutos;

{$R *.dfm}

procedure TUICadastro.EdtEstoqueKeyPress(Sender: TObject; var Key: Char);
begin
//#13 = Enter   #8 = Backspace.
  if not (key in ['0'..'9', #13, #8]) then//Captura a tecla pressionada para teste.
    key := #0;//Comando que zera a tecla.
end;

procedure TUICadastro.EdtValorKeyPress(Sender: TObject; var Key: Char);
begin
//#13 = Enter   #8 = Backspace.
  if not (key in ['0'..'9', '.', ',', #13, #8]) then//Captura a tecla pressionada para teste.
    key := #0;//Comando que zera a tecla.
  if key = '.' then
    key := ','; //Troca ponto por vírgula
  if (pos(',', EdtValor.Text) > 0) and (key = ',')  then//Testa se já existe uma
                                                        //vírgula para não permitir outra
    key := #0;


end;

end.
