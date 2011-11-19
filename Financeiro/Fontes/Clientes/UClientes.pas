unit UClientes;

interface

uses Generics.Collections, UntAcessoDados;

  Type

    TClientes = class
  private

    FEmail: String;
    FCodigo: integer;
    FRazaoSocial: String;
    FEndereco: string;
    Class var FAcessoDados : TAcessoDados;
    procedure SetCodigo(const Value: integer);
    procedure SetEmail(const Value: String);
    procedure SetEndereco(const Value: string);
    procedure SetRazaoSocial(const Value: String);


  published
    property Codigo : integer read FCodigo write SetCodigo;
    property RazaoSocial : String read FRazaoSocial write SetRazaoSocial;
    property Endereco : string read FEndereco write SetEndereco;
    property Email : String read FEmail write SetEmail;


  public
    Constructor Create;
    Class Function Inserir (Cliente : TClientes) : Boolean;
    Class Function Alterar (Cliente : TClientes) : Boolean;
    Class Function Excluir (Codigo : integer) : Boolean;
    Class Function Listar : TList<TClientes>;
    Class Function ObterDetalhes (Codigo : integer) : TClientes;
  end;

implementation

uses
  SysUtils, DB, SQLExpr;

class function TClientes.Alterar(Cliente: TClientes): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCALTERARCLIENTE';
    Procedimento.ParamByName('INCODIGOCLIENTE').AsInteger := Cliente.Codigo;
    Procedimento.ParamByName('INRAZAOSOCIAL').AsString := Cliente.RazaoSocial;
    Procedimento.ParamByName('INENDERECO').AsString := Cliente.Endereco;
    Procedimento.ParamByName('INEMAIL').AsString := Cliente.Email;
    Procedimento.ExecProc;
    Result := true;
  Except
    Result := false;
  end;
end;

constructor TClientes.Create;
begin
  inherited;//Chama o método derivado da classe ancestral.
    FAcessoDados := TAcessoDados.Create;
end;

class function TClientes.Excluir(Codigo: integer): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCEXCLUIRCLIENTE';
    Procedimento.ParamByName('INCODIGOCLIENTE').AsInteger := Codigo;
    Procedimento.ExecProc;
    Result := true;
  Except
    Result := False;
  End;
end;

class function TClientes.Inserir(Cliente: TClientes): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'INSERIRCLIENTE';
    Procedimento.ParamByName('INRAZAOSOCIAL').AsString := Cliente.RazaoSocial;
    Procedimento.ParamByName('INENDERECO').AsString := Cliente.Endereco;
    Procedimento.ParamByName('INEMAIL').AsString := Cliente.Email;
    Procedimento.ExecProc;
    Result := True;
  Except
    Result := False;
  End;
end;

class function TClientes.Listar: TList<TClientes>;
var
  Lista : TList<TClientes>;//Declaração de uma lista tipada.
  Cliente : TClientes;//Declaração do Objeto a ser criado na execução do método.
  Consulta : TSQLQuery;//Declaração da variável de consulta.
begin
  //Crio a lista.
  Lista := TList<TClientes>.Create;

  //Executo a Consulta que recupera os valores no banco.
  Consulta := FAcessoDados.ExecutaConsulta('select * from clientes order by razaosocial');

  while Consulta.Eof do begin//Executa enquanto não chegar ao fim dos dados da consulta.
    Cliente := TClientes.Create;//Cria o Objeto.
    Cliente.Codigo := Consulta.FieldByName('CODIGOCLIENTE').AsInteger;//Adiciona ao objeto.
    Cliente.RazaoSocial := Consulta.FieldByName('RAZAOSOCIAL').AsString;//Adiciona ao objeto.
    Cliente.Endereco := Consulta.FieldByName('ENDERECO').AsString;//Adiciona ao objeto.
    Cliente.Email := Consulta.FieldByName('EMAIL').AsString;//Adiciona ao objeto.
    Lista.Add(Cliente);//Adiciona o objeto a Lista Tipada.
    Consulta.Next;//Avança a consulta.
  end;
  result := Lista;//Retorna a Lista de objetos.
end;

class function TClientes.ObterDetalhes(Codigo: integer): TClientes;
var
  Procedimento : TSQLStoredProc;//Declara a variável para acesso ao procedimento no banco.
  Cliente : TClientes;//Declara o objeto.
begin
  Procedimento := FAcessoDados.NovoProcedimento;//Cria um novo objeto para executar o procedimento armazenado.
  Procedimento.StoredProcName := 'PROCREUPERACLIENTES';//Menciona o nome do procedimento armazenado.
  Procedimento.ParamByName('INCODIGOCLIENTE').AsInteger := Codigo;//Passa o parâmetro de entrada no proc.
  Procedimento.ExecProc;//Executa o procedimento.

  Cliente := TClientes.Create;//Cria o Objeto em tempo de execução.
  Cliente.Codigo := Codigo;//Adiciona o Código ao Objeto.
  Cliente.RazaoSocial := Procedimento.FieldByName('OUTRAZAOSOCIAL').AsString;//Adiciona a saída do procedimento ao objeto.
  Cliente.Endereco := Procedimento.FieldByName('OUTENDERECO').AsString;//Adiciona a saída do procedimento ao objeto.
  Cliente.Email := Procedimento.FieldByName('OUTEMAIL').AsString;//Adiciona a saída do procedimento ao objeto.

  Result := Cliente;//Retorna o objeto.
end;

procedure TClientes.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TClientes.SetEmail(const Value: String);
begin
  FEmail := Value;
end;

procedure TClientes.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TClientes.SetRazaoSocial(const Value: String);
begin
  FRazaoSocial := Value;
end;

end.


