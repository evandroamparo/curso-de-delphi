unit UntProdutos;

interface

type Produto = record
  codigo:integer;
  nome:string;
  decricao:string;
  valor:double;
  quantEstoque:integer;
end;
  Produtos = Array of Produto;

  procedure IncluirProduto(p:Produto);
  procedure ExcluirProduto(codigo:integer);
  procedure AlterarProduto(a:Produto);

  function ObterProdutos: Produtos;
 // function ObterDetalhesProduto(codigo:integer):Produto;


implementation
var
  VetorProdutos : Produtos;

function ObterCodigo:integer;
var
  maior, i: integer;
begin
  maior:=0;
  for i := 0 to Length(VetorProdutos) - 1 do
    if VetorProdutos[i].codigo > maior then
      maior:=VetorProdutos[i].codigo;
  result:= maior + 1;
end;

Procedure IncluirProduto(p:Produto);
begin
  SetLength(VetorProdutos,Length(VetorProdutos)+1);
  p.codigo:= ObterCodigo;
  VetorProdutos[Length(VetorProdutos)-1]:=p;
end;

procedure ExcluirProduto(codigo:integer);
var
  i, pos:integer;
begin
  for i := 0 to Length(VetorProdutos) - 1 do
    if VetorProdutos[i].codigo = codigo then
      begin
      pos:=i;
      end;
  for i := pos+1  to Length(VetorProdutos) - 1 do
    VetorProdutos[i-1]:= VetorProdutos[i];
  SetLength(VetorProdutos,Length(VetorProdutos)-1);
end;

Procedure AlterarProduto(a:Produto);
var
  i, pos: integer;
begin
  for i := 0 to Length(VetorProdutos) - 1 do
    if VetorProdutos[i].codigo = a.codigo then
      pos:= i;

  VetorProdutos[pos]:=a;
end;

function ObterProdutos: Produtos;
begin
  result := VetorProdutos;
end;
end.
