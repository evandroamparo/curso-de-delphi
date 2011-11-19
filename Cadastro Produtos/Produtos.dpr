program Produtos;

uses
  Forms,
  UntListaProdutos in 'UntListaProdutos.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
