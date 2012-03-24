unit UntEndereco;

interface

type
  TEndereco = class
  private
    FLogradouro: string;
    FBairro: string;
    FCep: string;
    FLocalidade: string;
    FTipoLogradouro: string;
    FEstado: string;
    procedure SetBairro(const Value: string);
    procedure SetCep(const Value: string);
    procedure SetEstado(const Value: string);
    procedure SetLocalidade(const Value: string);
    procedure SetLogradouro(const Value: string);
    procedure SetTipoLogradouro(const Value: string);
  published
    property Cep: string read FCep write SetCep;
    property TipoLogradouro: string read FTipoLogradouro write SetTipoLogradouro;
    property Logradouro: string read FLogradouro write SetLogradouro;
    property Bairro: string read FBairro write SetBairro;
    property Localidade: string read FLocalidade write SetLocalidade;
    property Estado: string read FEstado write SetEstado;
  end;
implementation

{ TEndereco }

procedure TEndereco.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TEndereco.SetCep(const Value: string);
begin
  FCep := Value;
end;

procedure TEndereco.SetEstado(const Value: string);
begin
  FEstado := Value;
end;

procedure TEndereco.SetLocalidade(const Value: string);
begin
  FLocalidade := Value;
end;

procedure TEndereco.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TEndereco.SetTipoLogradouro(const Value: string);
begin
  FTipoLogradouro := Value;
end;

end.
