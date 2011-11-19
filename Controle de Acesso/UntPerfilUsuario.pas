unit UntPerfilUsuario;

interface
uses classes, UntAcao, Contnrs, SqlExpr;
  Type
  TPerfilUsuario = class
    private
      FListaUsuarios: TList;
      FListaAcoes: TList;
      FCodigo : integer;
      FDescricao : string;
      class var FListaPerfis : TList;
      procedure SetCodigo(const Value: integer);
      procedure SetDescricao(const Value: string);//Const é um parâmetro de entrada que não pode ser modificado.
      class procedure SalvarDados;//Procedimento estático.
      class procedure LerDados;
    public
      property Codigo : integer read FCodigo write SetCodigo;// A propriedade "Codigo" é lida do atributo FCodigo e grava pelo método SetCodigo.
      property Descricao : string read FDescricao write SetDescricao;
      // métodos específicos de cada perfil
      procedure IncluirUsuario(Codigo : integer);
      procedure IncluirAcao(Codigo : integer);
      procedure ExcluirUsuario(Codigo : integer);
      procedure ExcluirAcao(Codigo : integer);
      function ListarUsuarios : TList;
      function ListarAcoes : TList;
      constructor Create;
      destructor Destroy; override;  // Sobrescreve a implementação deste método na classe
      //ancestral.
      // métodos da classe para gerenciar o cadastro de prefis.
      class function Incluir (Perfil : TPerfilUsuario): Boolean;
      class function Alterar (Perfil : TPerfilUsuario): Boolean;
      class function Excluir (Codigo : integer): TPerfilUsuario;
      class function ObterDetalhes (Codigo : integer): TPerfilUsuario;
      class function ListaPerfis: TList;
  end;
implementation
  uses
   SysUtils, UntAcessoDados;
{ TPerfilUsuario }



class function TPerfilUsuario.Alterar(Perfil: TPerfilUsuario): Boolean;
var
  i: Integer;
begin
  for i := 0 to ListaPerfis.Count - 1 do
  begin
    if TPerfilUsuario(ListaPerfis[i]).Codigo = Perfil.Codigo then
    begin
      ListaPerfis[i]:= Perfil;
      SalvarDados;
      Break;
    end;
  end;
  result := true;//Retorna o tipo da função.
end;

constructor TPerfilUsuario.Create;
begin
  inherited;//Chama o método correspondente da classe ancestral.
  FListaUsuarios := TObjectList.Create;
  FListaAcoes := TObjectList.Create;
end;

destructor TPerfilUsuario.Destroy;
begin
 FListaUsuarios.Free;
 FListaAcoes.Free;
end;

class function TPerfilUsuario.Excluir(Codigo: integer): TPerfilUsuario;
var
  i: Integer;
begin
  for i := 0 to ListaPerfis.Count - 1 do
  begin
    if TPerfilUsuario(ListaPerfis[i]).Codigo = Codigo then
    begin
      ListaPerfis.Delete(i);
      SalvarDados;
      Break;
    end;
  end;
end;

procedure TPerfilUsuario.ExcluirAcao(Codigo: integer);
var
  i: integer;
begin
  for i := 0 to FListaAcoes.Count - 1 do
  begin
    if Integer(FListaAcoes[i]) = Codigo then
    begin
      FListaAcoes.Delete(i);
      Break;
    end;
  end;
end;

procedure TPerfilUsuario.ExcluirUsuario(Codigo: integer);
var
  i: Integer;
begin
  for i := 0 to FListaUsuarios.Count - 1 do
  begin
    if Integer(FListaUsuarios[i]) = Codigo then begin
    FListaUsuarios.Delete(i);
    Break;
    end;
  end;
end;

class function TPerfilUsuario.Incluir(Perfil: TPerfilUsuario): Boolean;
begin
  ListaPerfis.Add(Perfil);
  SalvarDados;
  result := true;
end;

procedure TPerfilUsuario.IncluirAcao(Codigo : integer);
begin
 FListaAcoes.Add(Pointer(Codigo));
end;

procedure TPerfilUsuario.IncluirUsuario(Codigo : integer);
begin
 FListaUsuarios.Add(Pointer(Codigo));
end;

class procedure TPerfilUsuario.LerDados;
begin

end;

class function TPerfilUsuario.ListaPerfis: TList;
var
  Lista : TList;
  Perfil : TPerfilUsuario;
  Acao: TAcao;
  AcessoDados : TAcessoDados;
  ConsultaPerfis, ConsultaAcoes : TSQLQuery;
begin
  Lista := TList.Create;
  AcessoDados := TAcessoDados.Create;
  ConsultaPerfis := AcessoDados.ExecutaConsulta('SELECT CODIGO, DESCRICAO FROM PERFIL ORDER BY DESCRICAO');//Order by ordem crescente de acordo com o campo.

  while not ConsultaPerfis.eof do begin
    // Dados do perfil
    Perfil:= TPerfilUsuario.Create;
    Perfil.Codigo:= ConsultaPerfis.FieldByName('CODIGO').AsInteger;
    Perfil.Descricao:= ConsultaPerfis.FieldByName('DESCRICAO').AsString;

    // Dados das ações de cada perfil
    ConsultaAcoes := AcessoDados.ExecutaConsulta('SELECT CODIGOACAO FROM ACAOPERFIL WHERE CODIGOPERFIL = '+
     ConsultaPerfis.FieldByName('CODIGO').AsString);

    while not ConsultaAcoes.Eof do
    begin
      Acao := TAcao.ObterDetalhes(ConsultaAcoes.FieldByName('CODIGOACAO').AsInteger);
      Perfil.FListaAcoes.Add(Acao);
      ConsultaAcoes.Next;
    end;

    // Preencher a lista
    Lista.Add(Perfil);
    ConsultaPerfis.Next;
  end;
  Result:= Lista;
end;

function TPerfilUsuario.ListarAcoes: TList;
var 
  Lista : TList;
  i: Integer;
begin
  Result := FListaAcoes;
//  Lista := TList.Create;
//  for i := 0 to FListaAcoes.Count - 1 do
//  begin
//    Lista.Add(TAcao.ObterDetalhes(Integer(FListaAcoes[i])));
//  end;
//  result:= Lista;
end;

function TPerfilUsuario.ListarUsuarios: TList;
begin

end;

class function TPerfilUsuario.ObterDetalhes(Codigo: integer): TPerfilUsuario;
var
  i: Integer;
begin
  for i := 0 to FListaPerfis.Count - 1 do
  begin
    if TPerfilUsuario(FListaPerfis[i]).Codigo = Codigo then
    begin
      result := TPerfilUsuario(FListaPerfis[i]);//Retorna o objeto do tipo TPerfilUsuario Selecionado.
      Exit;
    end;
  end;
  Result := nil;
end;

class procedure TPerfilUsuario.SalvarDados;
begin

end;

procedure TPerfilUsuario.SetCodigo(const Value: integer);
begin
  if FCodigo <> Value then begin
    if Value <= 0 then begin
      Raise Exception.Create('O Código do Perfil deve ser um número positivo.');
    end;
    FCodigo := Value;
  end;
end;

procedure TPerfilUsuario.SetDescricao(const Value: string);
begin
  if FDescricao <> Value then begin
    if Value = '' then
      Raise Exception.Create ('A descrição do Perfil é obrigatória.');
    FDescricao := Value;
  end;
end;
 initialization
  TPerfilUsuario.FListaPerfis := TList.Create;
  TPerfilUsuario.FListaPerfis := TPerfilUsuario.ListaPerfis;
 finalization
  TPerfilUsuario.FListaPerfis.Free;
end.
