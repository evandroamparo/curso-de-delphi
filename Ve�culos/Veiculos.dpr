program Veiculos;

uses
  Forms,
  UntUIVeiculos in 'UntUIVeiculos.pas' {Form1},
  UntIVeiculo in 'UntIVeiculo.pas',
  UntVeiculo in 'UntVeiculo.pas',
  UntCarro in 'UntCarro.pas',
  UntCarroPasseio in 'UntCarroPasseio.pas',
  UntCarroEsportivo in 'UntCarroEsportivo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
