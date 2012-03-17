unit UntCarroEsportivo;

interface

uses
  UntCarro;
type
  TCarroEsportivo = class(TCarro)
    procedure Acelerar; override;
    procedure Freiar; override;
    procedure TrocarMarcha; reintroduce;
    procedure Curvar; override;
  end;
implementation

{ TCarroEsportivo }

procedure TCarroEsportivo.Acelerar;
begin
  inherited;

end;

procedure TCarroEsportivo.Curvar;
begin
  inherited;

end;

procedure TCarroEsportivo.Freiar;
begin
  inherited;

end;

procedure TCarroEsportivo.TrocarMarcha;
begin
  inherited;

end;

end.
