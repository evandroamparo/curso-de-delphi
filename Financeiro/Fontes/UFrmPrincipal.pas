unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, ToolWin, ActnCtrls,
  ActnMenus, Menus, WideStrings, DB, SqlExpr, DBXInterbase;

type
  TForm1 = class(TForm)
    ActionManager1: TActionManager;
    ActPlanoContas: TAction;
    ActContasPagar: TAction;
    ActContasReceber: TAction;
    ActClientes: TAction;
    ActFornecedores: TAction;
    ActMovimentacoes: TAction;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    PlanodeContas1: TMenuItem;
    Clientes1: TMenuItem;
    procedure ActPlanoContasExecute(Sender: TObject);
    procedure ActClientesExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UFrmConsultaPlanoContas, UFrmConsultaClientes;

{$R *.dfm}

procedure TForm1.ActClientesExecute(Sender: TObject);
begin
  try
    //Cria o formulário em tempo de execução. (Classe, objeto form).
    Application.CreateForm(TFrmConsultaClientes, FrmConsultaClientes);
    FrmConsultaClientes.ShowModal;
  finally
    FrmConsultaClientes.Free;
  end;
end;

procedure TForm1.ActPlanoContasExecute(Sender: TObject);
begin
  try
    //Cria o formulário em tempo de execução. (Classe, objeto form).
    Application.CreateForm(TFrmConsultaPlanoContas, FrmConsultaPlanoContas);
    FrmConsultaPlanoContas.ShowModal;
  finally
    FrmConsultaPlanoContas.Free;
  end;
end;

end.
