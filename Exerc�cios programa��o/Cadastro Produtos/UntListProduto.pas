unit UntListProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TUntListaProdutos = class(TForm)
    SGListaProdutos: TStringGrid;
    BtnIncluir: TButton;
    BtnAlterar: TButton;
    BtnExcluir: TButton;
    BtnVender: TButton;
    SGListaVendaProdutos: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnVenderClick(Sender: TObject);

  private
    Procedure Atualizar;
    Procedure AtualizarVendas;

  public
    { Public declarations }
  end;

var
  UntListaProdutos: TUntListaProdutos;

implementation

uses UntProdutos, UntCadastroProdutos, UntVenda, UntVendas;

{$R *.dfm}

procedure TUntListaProdutos.AtualizarVendas;
var
  i:integer;
  lista: Vendas;
begin
  SGListaVendaProdutos.RowCount:= 2;
  lista:= ObterVendas;
  for i := 0 to Length(lista) - 1 do
  begin
    SGListaVendaProdutos.Cells[0,i+1]:=IntToStr(lista[i].Codigo);
    SGListaVendaProdutos.Cells[1,i+1]:=lista[i].nome;
    SGListaVendaProdutos.Cells[2,i+1]:=lista[i].descricao;
    SGListaVendaProdutos.Cells[3,i+1]:= FloatToStr(lista[i].valor);
    SGListaVendaProdutos.Cells[4,i+1]:=IntToStr(lista[i].quantidade);
    SGListaVendaProdutos.Cells[5,i+1]:=FloatToStr(lista[i].valorTotal);
    SGListaVendaProdutos.RowCount:= SGListaVendaProdutos.RowCount +1;
  end;
  if SGListaVendaProdutos.RowCount > 2 then
    SGListaVendaProdutos.RowCount:= SGListaVendaProdutos.RowCount - 1;

end;

procedure TUntListaProdutos.Atualizar;
var
  i:integer;
  lista: Produtos;
begin
  SGListaProdutos.RowCount:=2;
  SGListaProdutos.Rows[1].Clear;
  lista:= ObterProdutos;
  for i := 0 to Length(lista) -1 do
  begin
    SGListaProdutos.Cells[0,i+1]:=IntToStr(lista[i].Codigo);
    SGListaProdutos.Cells[1,i+1]:=lista[i].nome;
    SGListaProdutos.Cells[2,i+1]:=lista[i].decricao;
    SGListaProdutos.Cells[3,i+1]:=FloatToStr(lista[i].valor);
    SGListaProdutos.Cells[4,i+1]:=IntToStr(lista[i].quantEstoque);
    SGListaProdutos.RowCount:= SGListaProdutos.RowCount +1;
  end;
  if SGListaProdutos.RowCount > 2 then
  begin
    SGListaProdutos.RowCount:= SGListaProdutos.RowCount - 1;
  end;

end;

procedure TUntListaProdutos.BtnAlterarClick(Sender: TObject);
Var
  AltProduto: Produto;
  linha: integer;
begin
  linha:= SGListaProdutos.Row;
  UICadastro.EdtNome.Text:= SGListaProdutos.Cells[1,linha];
  UICadastro.EdtDescricao.Text:= SGListaProdutos.Cells[2,linha];
  UICadastro.EdtValor.Text:= SGListaProdutos.Cells[3,linha];
  UICadastro.EdtEstoque.Text:= SGListaProdutos.Cells[4,linha];
  if UICadastro.ShowModal = mrOk then
    AltProduto.codigo:= StrToInt(SGListaProdutos.Cells[0,linha]);
    AltProduto.nome:= UICadastro.EdtNome.Text;
    AltProduto.decricao:= UICadastro.EdtDescricao.Text;
    AltProduto.valor:= StrToFloat(UICadastro.EdtValor.Text);
    AltProduto.quantEstoque:= StrToInt(UICadastro.EdtEstoque.Text);
    AlterarProduto(AltProduto);
    Atualizar;
end;

procedure TUntListaProdutos.BtnExcluirClick(Sender: TObject);
var
  linha, codigo: integer;
begin
  linha:= SGListaProdutos.Row;
  codigo:= StrToInt(SGListaProdutos.Cells[0, linha]);
  ExcluirProduto(codigo);
  Atualizar;
end;

procedure TUntListaProdutos.BtnIncluirClick(Sender: TObject);
var
  NovoProduto: Produto;
begin
  UICadastro.EdtNome.Clear;
  UICadastro.EdtDescricao.Clear;
  UICadastro.EdtValor.Clear;
  UICadastro.EdtEstoque.Clear;
  if UICadastro.ShowModal = mrOk then
  begin
    NovoProduto.nome:= UICadastro.EdtNome.Text;
    NovoProduto.decricao:= UICadastro.EdtDescricao.Text;
    NovoProduto.valor:=StrToFloat (UICadastro.EdtValor.Text);
    NovoProduto.quantEstoque:= StrToInt(UICadastro.EdtEstoque.Text);
    IncluirProduto(NovoProduto);
    Atualizar;
  end;

end;

procedure TUntListaProdutos.BtnVenderClick(Sender: TObject);
var
  linha:integer;
  NovaVenda:Venda;
begin
  linha:= SGListaProdutos.Row;
  UIVenda.EdtNome.Text:= SGListaProdutos.Cells[1,linha];
  UIVenda.EdtDescricao.Text:= SGListaProdutos.Cells[2,linha];
  UIVenda.EdtValorUnitario.Text:= SGListaProdutos.Cells[3,linha];
  UIVenda.EdtQuantidade.Clear;
  if UIVenda.ShowModal = mrOk then
  begin
  NovaVenda.nome:= UIVenda.EdtNome.Text;
  NovaVenda.descricao:= UIVenda.EdtDescricao.Text;
  NovaVenda.valor:= StrToFloat(UIVenda.EdtValorUnitario.Text);
  NovaVenda.quantidade:= StrToInt(UIVenda.EdtQuantidade.Text);
  NovaVenda.valorTotal:= StrToFloat(UIVenda.EdtValorTotal.Text);
  IncluirVendas(NovaVenda);
  AtualizarVendas;
  end;
end;

procedure TUntListaProdutos.FormCreate(Sender: TObject);
begin
  SGListaProdutos.Cells[0,0]:= 'CÓDIGO';
  SGListaProdutos.Cells[1,0]:= 'NOME';
  SGListaProdutos.Cells[2,0]:= 'DESCRIÇÃO';
  SGListaProdutos.Cells[3,0]:= 'VALOR';
  SGListaProdutos.Cells[4,0]:= 'QUANT ESTOQUE';

  SGListaVendaProdutos.Cells[0,0]:= 'CÓDIGO';
  SGListaVendaProdutos.Cells[1,0]:= 'NOME';
  SGListaVendaProdutos.Cells[2,0]:= 'DESCRIÇÃO';
  SGListaVendaProdutos.Cells[3,0]:= 'VALOR';
  SGListaVendaProdutos.Cells[4,0]:= 'QUANTIDADE';
  SGListaVendaProdutos.Cells[5,0]:= 'VALOR TOTAL';
end;

end.
