unit UFrmConsultaFornecedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, Generics.Collections;

type
  TFrmConsultaFornecedores = class(TForm)
    ActionToolBar1: TActionToolBar;
    ActionManager1: TActionManager;
    ActIncluir: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    StgFornecedores: TStringGrid;
    procedure FormShow(Sender: TObject);
    procedure ActIncluirExecute(Sender: TObject);
    procedure ActAlterarExecute(Sender: TObject);
    procedure ActExcluirExecute(Sender: TObject);
  private
   procedure AtualizaGrid;
  public
    { Public declarations }
  end;

var
  FrmConsultaFornecedores: TFrmConsultaFornecedores;

implementation

uses UFornecedor, UntDMImagens, UFrmCadastroFornecedor, UConstantes;

{$R *.dfm}

procedure TFrmConsultaFornecedores.ActAlterarExecute(Sender: TObject);
var
  Fornecedor : TFornecedor;
begin
  Fornecedor := TFornecedor(StgFornecedores.Objects[0, StgFornecedores.Row]);
  if Fornecedor = nil then exit;
  FrmCadastroFornecedor := TFrmCadastroFornecedor.Create(Self);
  try
    FrmCadastroFornecedor.Fornecedor := Fornecedor;
    if FrmCadastroFornecedor.ShowModal = mrOk then begin
      if TFornecedor.Alterar(FrmCadastroFornecedor.Fornecedor) then begin
        AtualizaGrid
      end
      else begin
        Application.MessageBox(MSG_ERRO_ALTCADASTRO, NOME_SISTEMA);
      end;
    end;
  Except
    on e: Exception do begin
      Application.MessageBox(PWideChar(e.Message), NOME_SISTEMA);
    end;
  end;

end;

procedure TFrmConsultaFornecedores.ActExcluirExecute(Sender: TObject);
var
  Fornecedor : TFornecedor;
begin
  Fornecedor := TFornecedor(StgFornecedores.Objects[0,StgFornecedores.Row]);
  if Fornecedor = nil then Exit;
  if Application.MessageBox(MSG_EXCLUSAO, NOME_SISTEMA, MB_YESNO + MB_DEFBUTTON2) = IDYES then begin
    if TFornecedor.Excluir(Fornecedor.Codigo) then begin
      AtualizaGrid;
    end
    Else begin
      Application.MessageBox(MSG_ERRO_EXCCADASTRO, NOME_SISTEMA);
    end;
  end;
end;

procedure TFrmConsultaFornecedores.ActIncluirExecute(Sender: TObject);
begin
  FrmCadastroFornecedor := TFrmCadastroFornecedor.Create(Self);
  try
    if FrmCadastroFornecedor.ShowModal = mrOk then begin
      if TFornecedor.Inserir(FrmCadastroFornecedor.Fornecedor) then begin
          AtualizaGrid;
      end
      else begin
        Application.MessageBox(MSG_ERRO_INCCADASTRO, NOME_SISTEMA);
      end;
    end;
  finally
    FrmCadastroFornecedor.Free;
  end;
end;

procedure TFrmConsultaFornecedores.AtualizaGrid;
var
   Lista : TList<TFornecedor>;
   Fornecedor : TFornecedor;
   i : integer;
begin
   StgFornecedores.RowCount := 2;
   StgFornecedores.Rows[1].Clear;
   Lista := TFornecedor.Listar;
  for i := 0 to Lista.Count - 1 do begin
  Fornecedor := Lista[i];
  StgFornecedores.Cells[0, StgFornecedores.RowCount - 1] := IntToStr(Fornecedor.Codigo);
  StgFornecedores.Cells[1, StgFornecedores.RowCount - 1] := Fornecedor.RazaoSocial;
  StgFornecedores.Cells[2, StgFornecedores.RowCount - 1] := Fornecedor.Endereco;
  StgFornecedores.Cells[3, StgFornecedores.RowCount - 1] := Fornecedor.Email;
  StgFornecedores.Objects[0, StgFornecedores.RowCount - 1] := Fornecedor;
  StgFornecedores.RowCount := StgFornecedores.RowCount +1;
   end;
   //Verifica se existe algum dado no grid e na lista, caso n�o tenha, retira a linha em branco do grid.
   if (StgFornecedores.RowCount > 2) and (Lista.Count > 0) then begin
    StgFornecedores.RowCount := StgFornecedores.RowCount - 1;
  end;
end;

procedure TFrmConsultaFornecedores.FormShow(Sender: TObject);
begin
   StgFornecedores.Cells[0,0] := 'C�digo';
   StgFornecedores.Cells[1,0] := 'Raz�o Social';
   StgFornecedores.Cells[2,0] := 'Endere�o';
   StgFornecedores.Cells[3,0] := 'Email';
   AtualizaGrid;
end;

end.
