program ControleDeAcesso;

uses
  Forms,
  UntFormularioPrincipal in 'UntFormularioPrincipal.pas' {Form1},
  UntPerfilUsuario in 'UntPerfilUsuario.pas',
  UntAcao in 'UntAcao.pas',
  UntUsuario in 'UntUsuario.pas',
  UntUIListaPerfis in 'UntUIListaPerfis.pas' {UIListaPerfis},
  UntAcessoDados in 'UntAcessoDados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
