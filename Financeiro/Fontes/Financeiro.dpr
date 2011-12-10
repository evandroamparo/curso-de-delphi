program Financeiro;

uses
  Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {Form1},
  UPlanoContas in 'Plano Contas\UPlanoContas.pas',
  UntAcessoDados in 'Acesso Dados\UntAcessoDados.pas',
  UCliente in 'Clientes\UCliente.pas',
  UFornecedor in 'Fornecedores\UFornecedor.pas',
  UConta in 'Contas\UConta.pas',
  UContaPagar in 'Contas\UContaPagar.pas',
  UContaReceber in 'Contas\UContaReceber.pas',
  UMovimentacao in 'Movimentação\UMovimentacao.pas',
  UFrmConsultaPlanoContas in 'Plano Contas\UFrmConsultaPlanoContas.pas' {FrmConsultaPlanoContas},
  UFrmCadastroPlanoContas in 'Plano Contas\UFrmCadastroPlanoContas.pas' {FrmCadastroPlanoContas},
  UConstantes in 'Util\UConstantes.pas',
  UDBUtils in 'Util\UDBUtils.pas',
  UFrmConsultaClientes in 'Clientes\UFrmConsultaClientes.pas' {FrmConsultaClientes},
  RegExpr in 'Util\RegExpr.pas',
  UFrmCadastroCliente in 'Clientes\UFrmCadastroCliente.pas' {FrmCadastroCliente},
  UFrmConsultaFornecedores in 'Fornecedores\UFrmConsultaFornecedores.pas' {FrmConsultaFornecedores},
  UntDMImagens in 'UntDMImagens.pas' {DataModule1: TDataModule},
  UFrmCadastroFornecedor in 'Fornecedores\UFrmCadastroFornecedor.pas' {FrmCadastroFornecedor},
  UFrmConsultaContasPagar in 'Contas\UFrmConsultaContasPagar.pas' {FrmConsultaContasPagar},
  UFrmCadastroContaPagar in 'Contas\UFrmCadastroContaPagar.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
