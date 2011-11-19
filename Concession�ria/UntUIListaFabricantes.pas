unit UntUIListaFabricantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls;

type
  TUIListaFabricantes = class(TForm)
    sgFabricantes: TStringGrid;
    BtnIncluir: TButton;
    BtnExcluir: TButton;
    BtnAlterar: TButton;
    BtnSair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    procedure AtualizarLista;
  public
    { Public declarations }
  end;

var
  UIListaFabricantes: TUIListaFabricantes;

implementation

uses ClsFabricante, UntUIFabricante;

{$R *.dfm}

procedure TUIListaFabricantes.AtualizarLista;
var
  i:integer;
begin
  sgFabricantes.RowCount := 2;
  sgFabricantes.Rows[1].Clear;

  for i := 0 to TFabricante.ListaFabricantes.Count - 1 do
  begin
    sgFabricantes.Cells[0,i+1]:= IntToStr(TFabricante.ListaFabricantes[i].Codigo);
    sgFabricantes.Cells[1,i+1]:= TFabricante.ListaFabricantes[i].Nome;
    sgFabricantes.Cells[2,i+1]:= FormatDateTime('mm/dd/yyyy', TFabricante.ListaFabricantes[i].DataUltimaCompra);
    sgFabricantes.Cells[3,i+1]:= TFabricante.ListaFabricantes[i].Telefone;
    sgFabricantes.Objects[0, i+1] := TFabricante.ListaFabricantes[i];//Armazena um objeto associado a uma célula.
    sgFabricantes.RowCount := sgFabricantes.RowCount + 1;
  end;

  if sgFabricantes.RowCount > 2 then
    sgFabricantes.RowCount := sgFabricantes.RowCount - 1;
end;

procedure TUIListaFabricantes.BtnAlterarClick(Sender: TObject);

begin
  Application.CreateForm(TUIFabricante,UIFabricante);
  UIFabricante.Fabricante := TFabricante(sgFabricantes.Objects[0, sgFabricantes.Row]);//Convert o Objeto para o tipo TFabricantes
  if UIFabricante.ShowModal = mrOk then
  begin
    TFabricante.Alterar(UIFabricante.Fabricante);
    AtualizarLista;
  end;
end;

procedure TUIListaFabricantes.BtnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Você deseja excluir?', 'Alerta', MB_YESNO) = mrYes then
  begin
    TFabricante.Excluir(TFabricante(sgFabricantes.Objects[0, sgFabricantes.Row]).Codigo);
    AtualizarLista;
  end;

end;

procedure TUIListaFabricantes.BtnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TUIFabricante,UIFabricante);//Cria um formulário dinâmicamente.
  //UIFabricante := TUIFabricante.Create(Application); Alternativa para criação do form.
  UIFabricante.Fabricante := nil;//Garante que o objeto vai estar realmente zerado.
  if UIFabricante.ShowModal = mrOk then
  begin
    TFabricante.Inserir(UIFabricante.Fabricante);
    AtualizarLista;
  end;

end;

procedure TUIListaFabricantes.FormCreate(Sender: TObject);
begin
  sgFabricantes.Cells[0,0]:= 'Código';
  sgFabricantes.Cells[1,0]:= 'Nome';
  sgFabricantes.Cells[2,0]:= 'Data da Última Compra';
  sgFabricantes.Cells[3,0]:= 'Telefone';
  AtualizarLista;
end;

end.
