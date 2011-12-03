unit UFrmConsultaPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ActnList, PlatformDefaultStyleActnCtrls, ActnMan, ToolWin,
  ActnCtrls, Generics.Collections, UntAcessoDados, Menus;

type
  TFrmConsultaPlanoContas = class(TForm)
    ActionToolBar1: TActionToolBar;
    ActionManager1: TActionManager;
    ActIncluir: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    StgPlanoContas: TStringGrid;
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
  FrmConsultaPlanoContas: TFrmConsultaPlanoContas;

implementation

uses UPlanoContas, UFrmCadastroPlanoContas , UConstantes, UntDMImagens;

{$R *.dfm}

procedure TFrmConsultaPlanoContas.ActAlterarExecute(Sender: TObject);
var
  PlanoContas : TPlanoContas;
begin
  PlanoContas := TPlanoContas(StgPlanoContas.Objects[0, StgPlanoContas.Row]);
  if PlanoContas = nil then begin
    exit;
  end;
  FrmCadastroPlanoContas := TFrmCadastroPlanoContas.Create(Self);
  try
    FrmCadastroPlanoContas.PlanoContas := PlanoContas;
    if FrmCadastroPlanoContas.ShowModal  = mrOk then begin
      if TPlanoContas.Alterar(FrmCadastroPlanoContas.PlanoContas) then begin
        AtualizaGrid;
      end
      else begin
        Application.MessageBox(MSG_ERRO_ALTCADASTRO, NOME_SISTEMA);
      end;
    end;
  finally
    FrmCadastroPlanoContas.Free;
  end;
end;

procedure TFrmConsultaPlanoContas.ActExcluirExecute(Sender: TObject);
var
  PlanoContas : TPlanoContas;
begin
  PlanoContas := TPlanoContas(StgPlanoContas.Objects[0, StgPlanoContas.Row]);
  if PlanoContas = nil then begin
    exit;
  end;
  if Application.MessageBox(MSG_EXCLUSAO, NOME_SISTEMA, MB_YESNO + MB_DEFBUTTON2) = IDYES then begin
    if TPlanoContas.Excluir(PlanoContas.Codigo) = true then begin
      AtualizaGrid;
    end
    else begin
      Application.MessageBox(MSG_ERRO_EXCCADASTRO, NOME_SISTEMA);
    end;
  end;

end;

procedure TFrmConsultaPlanoContas.ActIncluirExecute(Sender: TObject);
begin
  FrmCadastroPlanoContas := TFrmCadastroPlanoContas.Create(Self);
  try
    if FrmCadastroPlanoContas.ShowModal = mrOk then begin
      if TPlanoContas.Inserir(FrmCadastroPlanoContas.PlanoContas) then begin
         AtualizaGrid;
      end
      else begin
        Application.MessageBox(MSG_ERRO_INCCADASTRO, NOME_SISTEMA);
      end;
    end;

  finally
    FrmCadastroPlanoContas.Free;
  end;
end;

procedure TFrmConsultaPlanoContas.AtualizaGrid;
var
  Lista : TList<TPlanoContas>;
  PlanoContas : TPlanoContas;
  i : integer;
begin
   StgPlanoContas.RowCount := 2;
   StgPlanoContas.Rows[1].Clear;
   Lista := TPlanoContas.Listar;
   for i := 0 to Lista.Count - 1 do begin
    PlanoContas := Lista[i];//Atribuição dos dados da lista no índice indicado para o objeto tipado.
    StgPlanoContas.Cells[0, StgPlanoContas.RowCount -1] := inttostr(PlanoContas.Codigo);
    StgPlanoContas.Cells[1, StgPlanoContas.RowCount -1] := PlanoContas.Descricao;
    StgPlanoContas.Cells[2, StgPlanoContas.RowCount -1] := PlanoContas.NomeTipoOperacao;
    StgPlanoContas.Objects[0, StgPlanoContas.RowCount -1] := PlanoContas;
    StgPlanoContas.RowCount := StgPlanoContas.RowCount + 1;
   end;
  if (StgPlanoContas.RowCount > 2) and (Lista.Count > 0) then begin
    StgPlanoContas.RowCount := StgPlanoContas.RowCount - 1;
  end;
end;

procedure TFrmConsultaPlanoContas.FormShow(Sender: TObject);
begin
  StgPlanoContas.Cells[0,0] := 'Código';
  StgPlanoContas.Cells[1,0] := 'Descrição';
  StgPlanoContas.Cells[2,0] := 'Operação';
  AtualizaGrid;
end;

end.

