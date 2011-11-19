unit UntCliente;

interface
//Tipo enumerado.
  type StatusCliente = (scAtivo, scInativo);
  //Declaração de um tipo estruturado registro.
  type Cliente = record
    Codigo: integer;
    Nome: string;
    Email: string;
    Telefone: string;
    Status: StatusCliente;
  end;
  Clientes = Array of Cliente;

  procedure InserirCliente(c:Cliente);
  procedure AlterarCliente(a:Cliente);
  procedure ExcluirCliente(Codigo: integer);
  function ObterDetalhesCliente(Codigo: Integer): Cliente;
  function ObterClientes: Clientes;

implementation

var
  VetorCliente: Clientes;

function ObterCodigo:Integer;
var
  maior, i: Integer;

begin
  maior:= 0;
  for i := 0 to Length(VetorCliente) - 1 do
    if VetorCliente[i].Codigo > maior then
      maior:= VetorCliente[i].Codigo;
  result := maior +1;
end;
function ObterDetalhesCliente(Codigo: Integer): Cliente;
begin

end;

procedure InserirCliente(c:Cliente);
begin
  SetLength(VetorCliente,Length(VetorCliente)+1);
  c.Codigo:= ObterCodigo;
  VetorCliente[Length(VetorCliente)-1]:=c;
end;

procedure AlterarCliente(a:Cliente);
var
  i, pos: Integer;
begin
  for i := 0 to Length(VetorCliente) - 1 do
    if VetorCliente[i].Codigo = a.Codigo then
      pos:= i;

  VetorCliente[pos] := a;

end;
procedure ExcluirCliente(Codigo: integer);
var
  i, pos: Integer;
begin
  for i := 0 to Length(VetorCliente) - 1 do
    if VetorCliente[i].Codigo = Codigo then
      pos:= i;
  for i := pos+1 to Length(VetorCliente) - 1 do
    VetorCliente[i-1]:= VetorCliente[i];
  SetLength(VetorCliente,Length(VetorCliente)-1);//Diminui o tamanho do vetor
end;
function ObterClientes: Clientes;
begin
  result:= VetorCliente;
end;

end.

