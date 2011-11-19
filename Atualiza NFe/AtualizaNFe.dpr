program AtualizaNFe;

uses
  Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {Form1},
  UntAcessoDados in 'Acesso Dados\UntAcessoDados.pas',
  UArquivoIni in 'Arquivo INI\UArquivoIni.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
