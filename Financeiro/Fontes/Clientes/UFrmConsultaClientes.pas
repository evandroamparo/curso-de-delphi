unit UFrmConsultaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ToolWin, ActnMan, ActnCtrls, Generics.Collections, ActnList,
  PlatformDefaultStyleActnCtrls;

type
  TFrmConsultaClientes = class(TForm)
    ActionToolBar1: TActionToolBar;
    StgClientes: TStringGrid;
    ActionManager1: TActionManager;
    ActIncluir: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    procedure FormShow(Sender: TObject);
    procedure ActIncluirExecute(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
  private
    Procedure AtualizaGrid;
  public
    { Public declarations }
  end;

var
  FrmConsultaClientes : TFrmConsultaClientes;

implementation

uses UCliente, UFrmCadastroCliente, UConstantes, UntDMImagens;

{$R *.dfm}

{ TForm2 }

procedure TFrmConsultaClientes.ActAlterarExecute(Sender: TObject);
var
  Cliente : TCliente;
begin
  Cliente := TCliente(StgClientes.Objects[0, StgClientes.Row]);
  if Cliente = nil then begin
    exit;
  end;
  FrmCadastroCliente := TFrmCadastroCliente.Create(Self);
  try
    FrmCadastroCliente.Cliente := Cliente;
    if FrmCadastroCliente.ShowModal  = mrOk then begin
      if TCliente.Alterar(FrmCadastroCliente.Cliente) then begin
        AtualizaGrid;
      end
      else begin
        Application.MessageBox(MSG_ERRO_ALTCADASTRO, NOME_SISTEMA);
      end;
    end;
  finally
    FrmCadastroCliente.Free;
  end;
end;

procedure TFrmConsultaClientes.ActExcluirExecute(Sender: TObject);
var
  Cliente : TCliente;
begin
  Cliente := TCliente(StgClientes.Objects[0, StgClientes.Row]);
  if Cliente = nil then begin
    exit;
  end;
  if Application.MessageBox(MSG_EXCLUSAO, NOME_SISTEMA, MB_YESNO + MB_DEFBUTTON2) = IDYES then begin
    if TCliente.Excluir(Cliente.Codigo) = true then begin
      AtualizaGrid;
    end
    else begin
      Application.MessageBox(MSG_ERRO_EXCCADASTRO, NOME_SISTEMA);
    end;
  end;
end;

procedure TFrmConsultaClientes.ActIncluirExecute(Sender: TObject);
begin
  FrmCadastroCliente := TFrmCadastroCliente.Create(Self);
  try
    if FrmCadastroCliente.ShowModal = mrOk then begin
      if TCliente.Inserir(FrmCadastroCliente.Cliente) then begin
         AtualizaGrid;
      end
      else begin
        Application.MessageBox(MSG_ERRO_INCCADASTRO, NOME_SISTEMA);
      end;
    end;

  finally
    FrmCadastroCliente.Free;
  end;
end;

procedure TFrmConsultaClientes.AtualizaGrid;
var
   Lista : TList<TCliente>;
   Cliente : TCliente;
   i : integer;
begin
   StgClientes.RowCount := 2;
   StgClientes.Rows[1].Clear;
   Lista := TCliente.Listar;
   //Carrega o grid com os objetos da lista de Clientes.
   for i := 0 to Lista.Count - 1 do begin
      Cliente := Lista[i];
      StgClientes.Cells[0, StgClientes.RowCount - 1] := IntToStr(Cliente.Codigo);
      StgClientes.Cells[1, StgClientes.RowCount - 1] := Cliente.RazaoSocial;
      StgClientes.Cells[2, StgClientes.RowCount - 1] := Cliente.Endereco;
      StgClientes.Cells[3, StgClientes.RowCount - 1] := Cliente.Email;
      StgClientes.Objects[0, StgClientes.RowCount - 1] := Cliente;
      StgClientes.RowCount := StgClientes.RowCount +1;
   end;
   //Verifica se existe algum dado no grid e na lista, caso não tenha, retira a linha em branco do grid.
   if (StgClientes.RowCount > 2) and (Lista.Count > 0) then begin
    StgClientes.RowCount := StgClientes.RowCount - 1;
  end;
end;

procedure TFrmConsultaClientes.FormShow(Sender: TObject);
begin
   StgClientes.Cells[0,0] := 'Código';
   StgClientes.Cells[1,0] := 'Razão Social';
   StgClientes.Cells[2,0] := 'Endereço';
   StgClientes.Cells[3,0] := 'Email';
   AtualizaGrid;
end;

end.
