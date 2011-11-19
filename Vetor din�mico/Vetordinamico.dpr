program Vetordinamico;

uses
  Forms,
  Vetor_Dinamico in 'Vetor_Dinamico.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
