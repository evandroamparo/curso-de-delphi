program Concessionaria;

uses
  Forms,
  UntPrincipal in 'UntPrincipal.pas' {Form1},
  ClsCarro in 'ClsCarro.pas',
  ClsFabricante in 'ClsFabricante.pas',
  UntUIListaFabricantes in 'UntUIListaFabricantes.pas' {UIListaFabricantes},
  UntUIFabricante in 'UntUIFabricante.pas' {UIFabricante},
  UntUIListaCarros in 'UntUIListaCarros.pas' {UIListaCarros},
  UntUICarro in 'UntUICarro.pas' {UICarro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TUIListaCarros, UIListaCarros);
  Application.CreateForm(TUICarro, UICarro);
  Application.Run;
end.
