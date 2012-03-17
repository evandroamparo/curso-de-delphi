unit UntVeiculo;

interface
uses UntIVeiculo;
type
  TVeiculo = class abstract(tinterfacedobject, IVeiculo)
  private
    FVelocidadeMaxima: integer;
    FCor: string;
    FPeso: Double;
    FQtdPassageiros: integer;
    FLargura: double;
    procedure SetCor(const Value: string);
    procedure SetLargura(const Value: double);
    procedure SetPeso(const Value: Double);
    procedure SetQtdPassageiros(const Value: integer);
    procedure SetVelocidadeMaxima(const Value: integer);
  published
    property Peso : Double read FPeso write SetPeso;
    property Cor : string read FCor write SetCor;
    property VelocidadeMaxima: integer read FVelocidadeMaxima write SetVelocidadeMaxima;
    property QtdPassageiros: integer read FQtdPassageiros write SetQtdPassageiros;
    property Largura: double read FLargura write SetLargura;
  public
    procedure Acelerar; virtual; abstract;
    procedure Freiar; virtual; abstract;
    procedure TrocarMarcha; virtual; abstract;
    procedure Curvar; virtual; abstract;
  end;
implementation

{ TVeiculo }

procedure TVeiculo.SetCor(const Value: string);
begin
  FCor := Value;
end;

procedure TVeiculo.SetLargura(const Value: double);
begin
  FLargura := Value;
end;

procedure TVeiculo.SetPeso(const Value: Double);
begin
  FPeso := Value;
end;

procedure TVeiculo.SetQtdPassageiros(const Value: integer);
begin
  FQtdPassageiros := Value;
end;

procedure TVeiculo.SetVelocidadeMaxima(const Value: integer);
begin
  FVelocidadeMaxima := Value;
end;

end.
