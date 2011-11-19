unit UntUIListaCarros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TUIListaCarros = class(TForm)
    sgCarros: TStringGrid;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnExcluir: TButton;
    btnSair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);

  private
    procedure AtualizaLista;
  public
    { Public declarations }
  end;

var
  UIListaCarros: TUIListaCarros;

implementation

uses ClsCarro, UntUICarro;

{$R *.dfm}

procedure TUIListaCarros.AtualizaLista;
var
  i:integer;
begin
  sgCarros.RowCount := 2;
  sgCarros.Rows[1].Clear;
  for i := 0 to TCarro.ListaCarros.count - 1 do
  begin
    sgCarros.Cells[0,i+1]:= IntToStr(TCarro.ListaCarros[i].Codigo);
    sgCarros.Cells[1,i+1]:= IntToStr(TCarro.ListaCarros[i].AnoFabricacao);
    sgCarros.Cells[2,i+1]:= TCarro.ListaCarros[i].Modelo;
    sgCarros.Cells[3,i+1]:= IntToStr(TCarro.ListaCarros[i].CodigoFabricante);
    sgCarros.Cells[4,i+1]:= FloatToStr(TCarro.ListaCarros[i].Motor);
    sgCarros.Objects[0, i+1]:= TCarro.ListaCarros[i];
    sgCarros.RowCount := sgCarros.RowCount + 1;
  end;
   if sgCarros.RowCount > 2 then
    sgCarros.RowCount := sgCarros.RowCount -1;
end;

procedure TUIListaCarros.btnAlterarClick(Sender: TObject);
begin
  Application.CreateForm(TUICarro, UICarro);
  UICarro.Carro := TCarro(sgCarros.Objects[0, sgCarros.Row]);
  if UICarro.ShowModal = mrOk then
  begin
    TCarro.Alterar(UICarro.Carro);
    AtualizaLista;
  end;
end;

procedure TUIListaCarros.btnExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Você deseja excluir?', 'Alerta', MB_YESNO) = mrYes then
  begin
    TCarro.Excluir(TCarro(sgCarros.Objects[0, sgCarros.Row]).Codigo);
    AtualizaLista;
  end;
end;

procedure TUIListaCarros.btnIncluirClick(Sender: TObject);
begin
  Application.CreateForm(TUICarro, UICarro);
  UICarro.Carro := nil;
  if UICarro.ShowModal = mrOk then
  begin
    TCarro.Inserir(UICarro.Carro);
    AtualizaLista;
  end;

end;

procedure TUIListaCarros.FormCreate(Sender: TObject);
begin
  sgCarros.Cells[0,0]:= 'Código';
  sgCarros.Cells[1,0]:= 'Ano Fabricação';
  sgCarros.Cells[2,0]:= 'Modelo';
  sgCarros.Cells[3,0]:= 'Codigo Fabricante';
  sgCarros.Cells[4,0]:= 'Motor';
  AtualizaLista;
end;

end.
