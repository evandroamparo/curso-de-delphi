unit UntVenda;

interface

type Venda = record
  codigo:integer;
  nome:string;
  descricao:string;
  valor:double;
  quantidade:integer;
  valorTotal: double;
end;

  Vendas = Array of Venda;

  procedure IncluirVendas(i:Venda);
  function ObterVendas: Vendas;
  function ObterCodigoVenda:integer;

implementation
var
  VetorVendas: Vendas;

function ObterCodigoVenda:integer;
var
  maior, i: integer;
begin
  maior:=0;
  for i := 0 to Length(VetorVendas) - 1 do
    if VetorVendas[i].codigo > maior then
      maior:=VetorVendas[i].codigo;
  result:= maior + 1;
end;

procedure IncluirVendas(i:Venda);
begin
 SetLength(VetorVendas,Length(VetorVendas)+1);
 i.codigo:= ObterCodigoVenda;
 VetorVendas[Length(VetorVendas)-1]:=i;
end;

function ObterVendas : Vendas;
Begin
  result:= VetorVendas;
end;
end.
