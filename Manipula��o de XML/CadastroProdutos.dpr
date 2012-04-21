program CadastroProdutos;

uses
  Forms,
  Produto in 'Produto.pas',
  UntXmlProduto in 'UntXmlProduto.pas',
  UntUIProduto in 'UntUIProduto.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
