unit UntCarro;

interface
uses UntVeiculo, UntIVeiculo;
type
  TCarro = class(TVeiculo)
    procedure Acelerar; override;
    procedure Freiar; override;
    procedure TrocarMarcha; override;
    procedure Curvar; override;
  end;
implementation

{ TCarro }

procedure TCarro.Acelerar;
begin
  inherited;

end;

procedure TCarro.Curvar;
begin
  inherited;

end;

procedure TCarro.Freiar;
begin
  inherited;

end;

procedure TCarro.TrocarMarcha;
begin
  inherited;

end;

end.
