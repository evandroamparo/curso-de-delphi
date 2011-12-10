unit UFrmConsultaContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ToolWin, ActnMan, ActnCtrls, PlatformDefaultStyleActnCtrls,
  Grids, generics.Collections;

type
  TFrmConsultaContasPagar = class(TForm)
    ActionManager1: TActionManager;
    ActionToolBar1: TActionToolBar;
    ActInserir: TAction;
    ActAlterar: TAction;
    ActExcluir: TAction;
    StgContasPagar: TStringGrid;
    procedure FormShow(Sender: TObject);
  private
    Procedure AtualizaGrid;
  public
    { Public declarations }
  end;

var
  FrmConsultaContasPagar: TFrmConsultaContasPagar;

implementation

uses UntDMImagens, UContaPagar;

{$R *.dfm}

procedure TFrmConsultaContasPagar.AtualizaGrid;
var
   Lista : TList<TContaPagar>;
   Conta : TContaPagar;
   i : integer;
begin
   StgContasPagar.RowCount := 2;
   StgContasPagar.Rows[1].Clear;
   Lista := TContaPagar.Listar;
   //Carrega o grid com os objetos da lista de Clientes.
   for i := 0 to Lista.Count - 1 do begin
      Conta := Lista[i];
      StgContasPagar.Cells[0, StgContasPagar.RowCount - 1] := IntToStr(Conta.Codigo);
      StgContasPagar.Cells[1, StgContasPagar.RowCount - 1] := Conta.Descricao;
      StgContasPagar.Cells[2, StgContasPagar.RowCount - 1] := DateToStr(Conta.DataEmissao);
      StgContasPagar.Cells[3, StgContasPagar.RowCount - 1] := DateToStr(Conta.DataVencimento);
      StgContasPagar.Cells[4, StgContasPagar.RowCount - 1] := Format('%2f', [conta.ValorTitulo]);
      StgContasPagar.Cells[5, StgContasPagar.RowCount - 1] := DateToStr(Conta.DataRecebimento);
      StgContasPagar.Cells[6, StgContasPagar.RowCount - 1] := Format('%2f', [conta.ValorRecebido]);
      StgContasPagar.Objects[0, StgContasPagar.RowCount - 1] := Conta;
      StgContasPagar.RowCount := StgContasPagar.RowCount +1;
   end;
   //Verifica se existe algum dado no grid e na lista, caso não tenha, retira a linha em branco do grid.
   if (StgContasPagar.RowCount > 2) and (Lista.Count > 0) then begin
    StgContasPagar.RowCount := StgContasPagar.RowCount - 1;
  end;
end;

procedure TFrmConsultaContasPagar.FormShow(Sender: TObject);
begin
  StgContasPagar.Cells[0,0] := 'Código';
  StgContasPagar.Cells[1,0] := 'Descrição';
  StgContasPagar.Cells[2,0] := 'Data Emissão';
  StgContasPagar.Cells[3,0] := 'Data Vencimento';
  StgContasPagar.Cells[4,0] := 'Valor Título';
  StgContasPagar.Cells[5,0] := 'Data Recebimento';
  StgContasPagar.Cells[5,0] := 'Valor Recebido';
end;

end.
