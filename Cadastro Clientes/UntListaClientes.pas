unit UntListaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TUIListaClientes = class(TForm)
    SGClientes: TStringGrid;
    Label1: TLabel;
    BtnIncluir: TButton;
    BtnAlterar: TButton;
    BtnExcluir: TButton;
    procedure BtnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    Procedure Atualizar;
  public
    { Public declarations }
  end;

var
  UIListaClientes: TUIListaClientes;

implementation

uses UntCliente, UntCadastroCliente;

{$R *.dfm}

procedure TUIListaClientes.Atualizar;
var
  i: Integer;
  lista: Clientes;
begin
  SGClientes.RowCount:= 2;
  SGClientes.Rows[1].Clear;
  lista := ObterClientes;
  for i := 0 to Length(lista) - 1 do
  begin
    SGClientes.Cells[0,i+1] := IntToStr(lista[i].Codigo);
    SGClientes.Cells[1,i+1] := lista[i].Nome;
    SGClientes.Cells[2,i+1] := lista[i].Email;
    SGClientes.Cells[3,i+1] := lista[i].Telefone;
    if lista[i].Status = scAtivo then
    SGClientes.Cells[4,i+1] := 'ATIVO'
    else
    SGClientes.Cells[4,i+1]:= 'INATIVO';
    SGClientes.RowCount:= SGClientes.RowCount + 1;
  end;
  if SGClientes.RowCount > 2 then
    SGClientes.RowCount:= SGClientes.RowCount - 1;
end;

procedure TUIListaClientes.BtnAlterarClick(Sender: TObject);
Var
 AltCliente: Cliente;
 linha: integer;
begin
  linha:= SGClientes.Row;
  UICadastroClientes.EdtNome.text:= SGClientes.Cells[1,linha];
  UICadastroClientes.EdtEmail.text:= SGClientes.Cells[2,linha];
  UICadastroClientes.EdtTelefone.text:= SGClientes.Cells[3,linha];
  if SGClientes.Cells[4,linha] = 'ATIVO' then
    UICadastroClientes.RbtAtivo.Checked:= true
  else
    UICadastroClientes.RbtInativo.Checked:= true;

  if UICadastroClientes.ShowModal = mrOk then
  begin
    AltCliente.Codigo:= StrToInt(SGClientes.Cells[0,linha]);
    AltCliente.Nome:= UICadastroClientes.EdtNome.Text;
    AltCliente.Email:= UICadastroClientes.EdtEmail.Text;
    AltCliente.Telefone:= UICadastroClientes.EdtTelefone.Text;
    if UICadastroClientes.RbtAtivo.Checked then
      AltCliente.Status:= scAtivo
    else
      AltCliente.Status:= scInativo;
    AlterarCliente(AltCliente);
    Atualizar;
   end;
end;

procedure TUIListaClientes.BtnExcluirClick(Sender: TObject);
var
  linha, codigo: integer;
begin
 try
  linha:= SGClientes.Row;
  codigo:=StrToInt(SGClientes.Cells[0, linha]);
  ExcluirCliente(codigo);
  Atualizar;
 Except
    Application.MessageBox('Nenhum Cliente cadastrado','Alerta');
 end;

end;

procedure TUIListaClientes.BtnIncluirClick(Sender: TObject);
Var
 NovoCliente: Cliente;
begin
  UICadastroClientes.EdtNome.Clear;
  UICadastroClientes.EdtEmail.Clear;
  UICadastroClientes.EdtTelefone.Clear;
  if UICadastroClientes.ShowModal = mrOk then
  begin
    NovoCliente.Nome:= UICadastroClientes.EdtNome.Text;
    NovoCliente.Email:= UICadastroClientes.EdtEmail.Text;
    NovoCliente.Telefone:= UICadastroClientes.EdtTelefone.Text;
    if UICadastroClientes.RbtAtivo.Checked then
      NovoCliente.Status:= scAtivo
    else
      NovoCliente.Status:= scInativo;
    InserirCliente(NovoCliente);
    Atualizar;
   end;

end;

procedure TUIListaClientes.FormCreate(Sender: TObject);
begin
  SGClientes.Cells[0,0]:= 'CÓDIGO';
  SGClientes.Cells[1,0]:= 'NOME';
  SGClientes.Cells[2,0]:= 'E-MAIL';
  SGClientes.Cells[3,0]:= 'TELEFONE';
  SGClientes.Cells[4,0]:= 'STATUS';
end;

end.
