unit UntUIListaPerfis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ActnList, PlatformDefaultStyleActnCtrls, ActnMan,
  StdCtrls, CheckLst;

type
  TUIListaPerfis = class(TForm)
    ActionManager1: TActionManager;
    ActIncluirPerfil: TAction;
    ActExcluirPerfil: TAction;
    ActAlterarPerfil: TAction;
    ActIncluirAcoes: TAction;
    ClbAcoes: TCheckListBox;
    LbPerfis: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure LbPerfisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UIListaPerfis: TUIListaPerfis;

implementation

uses UntAcao, UntPerfilUsuario;


{$R *.dfm}

procedure TUIListaPerfis.FormShow(Sender: TObject);
var
  ListaAcoes, ListaPerfis : TList;
  i: Integer;
begin
  ListaPerfis:= TPerfilUsuario.ListaPerfis;
  for i := 0 to ListaPerfis.Count - 1 do begin
    LbPerfis.Items.AddObject(TPerfilUsuario(ListaPerfis[i]).Descricao, ListaPerfis[i]);
  end;

  ListaAcoes:= TAcao.ListaAcoes;
  for i := 0 to ListaAcoes.Count - 1 do
  begin
    ClbAcoes.Items.AddObject(TAcao(ListaAcoes[i]).Descricao, ListaAcoes[i]); //Adiciona ao Checklistbox  e associa um objeto a ele.
  end;
end;

procedure TUIListaPerfis.LbPerfisClick(Sender: TObject);
var
  PerfilSelecionado : TPerfilUsuario;
  AcaoPerfil, Acao : TAcao;
  i,j : integer;
begin
  // Desmarcar todas os checkboxes
  for i := 0 to ClbAcoes.Items.Count - 1 do begin
    ClbAcoes.Checked[i] := false;
  end;
  // Caso haja algum item selecionado
  if LbPerfis.ItemIndex <> -1 then begin
  // Caso o objeto do item selecionado não seja nil
    if LbPerfis.Items.Objects[LbPerfis.ItemIndex] <> nil then begin
       // Guardar o perfil selecionado
       PerfilSelecionado:= TPerfilUsuario(LbPerfis.Items.Objects[LbPerfis.ItemIndex]);
       // Percorrer a lista de ações do perfil selecionado
       for i := 0 to PerfilSelecionado.ListarAcoes.Count - 1 do begin
         // Guardar cada ação encontrada para comparação
         AcaoPerfil:= PerfilSelecionado.ListarAcoes[i];
         // Percorrer a lista de ações da interecace e verificar qual delas
         // é igual à encontrada acima
         for j := 0 to ClbAcoes.Items.Count - 1 do begin
            // Guardar a ação atual
            Acao:= TAcao(ClbAcoes.Items.Objects[j]);
            // Comparar as ações pelo código e marcar, se necessário
            if AcaoPerfil.Codigo = Acao.Codigo then begin
              ClbAcoes.Checked[j]:= true;
            end;
         end;
       end;
    end;
  end;
end;

end.
