program TiposGenericos;

uses
  Forms,
  UntPrincipal in 'UntPrincipal.pas' {Form1},
  UntVariantes in 'UntVariantes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
