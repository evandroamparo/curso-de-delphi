unit UFornecedores;

interface

uses Generics.Collections, UntAcessoDados;

  Type
    TFornecedores = class
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
    Class function Inserir (Fornecedor : TFornecedores) : Boolean;
    Class Function Alterar (Fornecedor : TFornecedores) : Boolean;
    Class Function Excluir (Codigo : integer) : Boolean;
    Class Function Listar : TList<TFornecedores>;
    Class Function ObterDetalhes (Codigo : integer) : TFornecedores;
  end;

implementation

{ TFornecedores }

class function TFornecedores.Alterar(Fornecedor: TFornecedores): Boolean;
begin

end;

class function TFornecedores.Excluir(Codigo: integer): Boolean;
begin

end;

class function TFornecedores.Inserir(Fornecedor: TFornecedores): Boolean;
begin

end;

class function TFornecedores.Listar: TList<TFornecedores>;
begin

end;

class function TFornecedores.ObterDetalhes(Codigo: integer): TFornecedores;
begin

end;

procedure TFornecedores.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TFornecedores.SetEmail(const Value: string);
begin
  FEmail := Value;
end;

procedure TFornecedores.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TFornecedores.SetRazaoSocial(const Value: string);
begin
  FRazaoSocial := Value;
end;

end.
