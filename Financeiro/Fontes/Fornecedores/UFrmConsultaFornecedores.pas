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
  private
   procedure AtualizaGrid;
  public
    { Public declarations }
  end;

var
  FrmConsultaFornecedores: TFrmConsultaFornecedores;

implementation

uses UFornecedor, UntDMImagens;

{$R *.dfm}

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
   //Verifica se existe algum dado no grid e na lista, caso não tenha, retira a linha em branco do grid.
   if (StgFornecedores.RowCount > 2) and (Lista.Count > 0) then begin
    StgFornecedores.RowCount := StgFornecedores.RowCount - 1;
  end;
end;

procedure TFrmConsultaFornecedores.FormShow(Sender: TObject);
begin
   StgFornecedores.Cells[0,0] := 'Código';
   StgFornecedores.Cells[1,0] := 'Razão Social';
   StgFornecedores.Cells[2,0] := 'Endereço';
   StgFornecedores.Cells[3,0] := 'Email';
   AtualizaGrid;
end;

end.
