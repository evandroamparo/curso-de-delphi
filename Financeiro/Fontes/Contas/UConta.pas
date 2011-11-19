unit UConta;

interface

uses Generics.Collections, UntAcessoDados, UPlanoContas;

  Type
    TConta = class
  private
    FValorTitulo: Double;
    FDescricao: string;
    FCodigo: integer;
    FDataVencimento: TDateTime;
    FDataEmissao: TDateTime;
    FPlanoDeContas: TPlanoContas;
    FValorRecebido: Double;
    FDataRecebimento: TDateTime;

    procedure SetCodigo(const Value: integer);
    procedure SetDataEmissao(const Value: TDateTime);
    procedure SetDataRecebimento(const Value: TDateTime);
    procedure SetDataVencimento(const Value: TDateTime);
    procedure SetDescricao(const Value: string);
    procedure SetPlanoDeContas(const Value: TPlanoContas);
    procedure SetValorRecebido(const Value: Double);
    procedure SetValorTitulo(const Value: Double);
  published
      property Codigo : integer read FCodigo write SetCodigo;
      property Descricao : string read FDescricao write SetDescricao;
      property DataEmissao : TDateTime read FDataEmissao write SetDataEmissao;
      property DataVencimento : TDateTime read FDataVencimento write SetDataVencimento;
      property ValorTitulo : Double read FValorTitulo write SetValorTitulo;
      property DataRecebimento : TDateTime read FDataRecebimento write SetDataRecebimento;
      property ValorRecebido : Double read FValorRecebido write SetValorRecebido;
      Property PlanoDeContas : TPlanoContas read FPlanoDeContas write SetPlanoDeContas;
  protected
    Class var FAcessoDados : TAcessoDados;
  public

  end;
implementation

{ TConta }


procedure TConta.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TConta.SetDataEmissao(const Value: TDateTime);
begin
  FDataEmissao := Value;
end;

procedure TConta.SetDataRecebimento(const Value: TDateTime);
begin
  FDataRecebimento := Value;
end;

procedure TConta.SetDataVencimento(const Value: TDateTime);
begin
  FDataVencimento := Value;
end;

procedure TConta.SetDescricao(const Value: string);
begin
  FDescricao := Value;
end;

procedure TConta.SetPlanoDeContas(const Value: TPlanoContas);
begin
  FPlanoDeContas := Value;
end;

procedure TConta.SetValorRecebido(const Value: Double);
begin
  FValorRecebido := Value;
end;

procedure TConta.SetValorTitulo(const Value: Double);
begin
  FValorTitulo := Value;
end;

end.
