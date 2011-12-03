unit UFornecedor;

interface

uses Generics.Collections, UntAcessoDados;

  Type
    TFornecedor = class
  private
    FEmail: string;
    FCodigo: integer;
    FRazaoSocial: string;
    FEndereco: string;
    Class var FAcessoDados : TAcessoDados;
    procedure SetCodigo(const Value: integer);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetRazaoSocial(const Value: string);
  published

    property Codigo : integer read FCodigo write SetCodigo;
    Property RazaoSocial : string read FRazaoSocial write SetRazaoSocial;
    property Endereco : string read FEndereco write SetEndereco;
    property Email : string read FEmail write SetEmail;

  public
    Class function Inserir (Fornecedor : TFornecedor) : Boolean;
    Class Function Alterar (Fornecedor : TFornecedor) : Boolean;
    Class Function Excluir (Codigo : integer) : Boolean;
    Class Function Listar : TList<TFornecedor>;
    Class Function ObterDetalhes (Codigo : integer) : TFornecedor;
  end;

implementation

{ TFornecedor }
uses
  SysUtils, DB, SqlExpr, RegExpr, UConstantes;
class function TFornecedor.Alterar(Fornecedor: TFornecedor): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCALTERARFORNECEDOR';
    Procedimento.ParamByName('INCODIGOFORNECEDOR').AsInteger := Fornecedor.Codigo;
    Procedimento.ParamByName('INRAZAOSOCIAL').AsString := Fornecedor.RazaoSocial;
    Procedimento.ParamByName('INENDERECO').AsString := Fornecedor.Endereco;
    Procedimento.ParamByName('INEMAIL').AsString := Fornecedor.Email;
    Procedimento.ExecProc;
    Result := True;
  except
  Result := false;
  end;
end;

class function TFornecedor.Excluir(Codigo: integer): Boolean;
var
  Procedimento : TSQLStoredProc;//Cria uma variável para trabalhar com procedimentos do banco de dados.
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCEXCLUIRFORNECEDOR';
    Procedimento.ParamByName('INCODIGOFORNECEDOR').AsInteger := Codigo;
    Procedimento.ExecProc;
    Result := True;
  Except
    Result := False;
  end;
end;

class function TFornecedor.Inserir(Fornecedor: TFornecedor): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCINSERIRFORNECEDOR';
    Procedimento.ParamByName('INRAZAOSOCIAL').AsString := Fornecedor.RazaoSocial;
    Procedimento.ParamByName('INENDERECO').AsString := Fornecedor.Endereco;
    Procedimento.ParamByName('INEMAIL').AsString := Fornecedor.Email;
    Procedimento.ExecProc;
    Result := true;
  Except
    Result := False;
  End;
end;

class function TFornecedor.Listar: TList<TFornecedor>;
var
  Lista : TList<TFornecedor>;
  Fornecedor : TFornecedor;
  Consulta : TSQLQuery;
begin
  Lista := TList<TFornecedor>.Create;
  Consulta := FAcessoDados.ExecutaConsulta('SELECT * FROM FORNECEDOR ORDER BY RAZAOSOCIAL');
  while not Consulta.Eof do begin
    Fornecedor := TFornecedor.Create;
    Fornecedor.Codigo := Consulta.FieldByName('CODIGOFORNECEDOR').AsInteger;
    Fornecedor.RazaoSocial := Consulta.FieldByName('RAZAOSOCIAL').AsString;
    Fornecedor.Endereco := Consulta.FieldByName('ENDERECO').AsString;
    Fornecedor.Email := Consulta.FieldByName('EMAIL').AsString;
    Lista.Add(Fornecedor);
    Consulta.Next;
  end;
  Result := Lista;
end;

class function TFornecedor.ObterDetalhes(Codigo: integer): TFornecedor;
var
  Procedimento : TSQLStoredProc;
  Fornecedor : TFornecedor;
begin
  Procedimento := FAcessoDados.NovoProcedimento;
  Procedimento.StoredProcName := 'PROCRECUPERARFORNECEDOR';
  Procedimento.ParamByName('INCODIGOFORNECEDOR').AsInteger := Codigo;
  Procedimento.ExecProc;
  Fornecedor := TFornecedor.Create;
  Fornecedor.RazaoSocial := Procedimento.ParamByName('OUTRAZAOSOCIAL').AsString;
  Fornecedor.Endereco := Procedimento.ParamByName('OUTENDERECO').AsString;
  Fornecedor.Email := Procedimento.ParamByName('OUTEMAIL').AsString;
  Result := Fornecedor;
end;

procedure TFornecedor.SetCodigo(const Value: integer);
begin
  if Value <> FCodigo then begin
    if Value <= 0 then begin
      raise Exception.Create('O Código do Fornecedor não pode ser menor igual a zero.');
    end;
  FCodigo := Value;
  end;
end;

procedure TFornecedor.SetEmail(const Value: string);
var
  ExpRegular : TRegExpr;
  const ExpEmail = '[A-Za-z0-9\._-]+@[A-Za-z]+\.[A-Za-z\.]+';
begin
  if Value <> '' then begin
    try
      ExpRegular := TRegExpr.Create;
      ExpRegular.Expression := ExpEmail;
      if ExpRegular.Exec(Value) = false then begin
        raise Exception.Create('O e-mail informado é inválido.'); //Sai do método por conta do Finally (Exception)
      end;
    finally
      ExpRegular.Free;
    end;
  end;
  FEmail := Value;
end;

procedure TFornecedor.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TFornecedor.SetRazaoSocial(const Value: string);
begin
   if Value = '' then raise exception.Create(MSG_RAZAO_SOCIAL_VAZIO);
   FRazaoSocial := Value;
end;

end.
