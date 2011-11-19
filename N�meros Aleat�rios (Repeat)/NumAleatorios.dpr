program NumAleatorios;

uses
  Forms,
  Numeros_Aleatorios in 'Numeros_Aleatorios.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
