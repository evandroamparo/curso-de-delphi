unit Produto;

interface
type
  TProduto = class
  private
    FValor: Double;
    FDescricao: string;
    FUnidadeMedida: string;
    FCategoria: string;
    procedure SetCategoria(const Value: string);
    procedure SetDescricao(const Value: string);
    procedure SetUnidadeMedida(const Value: string);
    procedure SetValor(const Value: Double);
  published
    property Descricao : string read FDescricao write SetDescricao;
    property Valor : Double read FValor write SetValor;
    property Categoria : string read FCategoria write SetCategoria;
    property UnidadeMedida : string read FUnidadeMedida write SetUnidadeMedida;
  end;
implementation

{ TProduto }

procedure TProduto.SetCategoria(const Value: string);
begin
  FCategoria := Value;
end;

procedure TProduto.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TProduto.SetUnidadeMedida(const Value: string);
begin
  FUnidadeMedida := Value;
end;

procedure TProduto.SetValor(const Value: Double);
begin
  FValor := Value;
end;

end.
