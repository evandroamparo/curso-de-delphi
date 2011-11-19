program Cadastro;

uses
  Forms,
  UntListProduto in 'UntListProduto.pas' {UntListaProdutos},
  UntProdutos in 'UntProdutos.pas',
  UntCadastroProdutos in 'UntCadastroProdutos.pas' {UICadastro},
  UntVendas in 'UntVendas.pas' {UIVenda},
  UntVenda in 'UntVenda.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUntListaProdutos, UntListaProdutos);
  Application.CreateForm(TUICadastro, UICadastro);
  Application.CreateForm(TUIVenda, UIVenda);
  Application.Run;
end.
