unit UntAcao;

interface
uses Classes, DB, SQLExpr;
  Type
  TAcao = class
    private

      FCodigo : integer;
      FDescricao : string;
      class var FListaAcoes : TList;
      procedure SetCodigo(const Value: integer);
      procedure SetDescricao(const Value: string);
      class Procedure SalvarDados;
      class Procedure LerDados;


    public
      Property Codigo : integer read FCodigo write SetCodigo;
      Property Descricao : string read FDescricao write SetDescricao;
      class function Incluir(Acao : TAcao): Boolean;
      class function Alterar(Acao : TAcao): Boolean;
      class function Excluir(Codigo : integer): Boolean;
      class function ListaAcoes : TList ;
      class function ObterDetalhes(Codigo : integer): TAcao;

  end;
implementation
Uses SysUtils, UntAcessoDados;
{ TAcao }



class function TAcao.Alterar(Acao: TAcao): Boolean;
var
  i: Integer;
begin
  for i := 0 to ListaAcoes.Count - 1 do
  begin
    if TAcao(ListaAcoes[i]).FCodigo = Acao.Codigo then //Conversão para ter acesso aos atributos.
    begin
      ListaAcoes[i] := Acao;
      SalvarDados;
      break;
    end;
  end;
end;

class function TAcao.Excluir(Codigo: integer): Boolean;
var
  i: Integer;
begin
  for i := 0 to ListaAcoes.Count - 1 do
  begin
    if TAcao(ListaAcoes[i]).Codigo = Codigo then
    begin
      ListaAcoes.Delete(i);
      SalvarDados;
      Break;
    end;
  end;
end;

class function TAcao.Incluir(Acao: TAcao): Boolean;
begin
  FListaAcoes.Add(Acao);
  result := true;
  SalvarDados;
end;

class procedure TAcao.LerDados;
begin

end;

class function TAcao.ListaAcoes: TList;
var
  Lista : TList;
  Acao : TAcao;
  AcessoDados : TAcessoDados;
  Consulta : TSQLQuery;
begin
  Lista := TList.Create;//Cria a lista
  AcessoDados := TAcessoDados.Create;
  Consulta := AcessoDados.ExecutaConsulta('SELECT CODIGO, DESCRICAO FROM ACAO');//Sql de consulta na tabela.

  while not Consulta.Eof do
  begin
    Acao := TAcao.Create;
    Acao.Codigo := Consulta.FieldByName('CODIGO').AsInteger;//O objeto esta recebendo o valor de um campo retornado pela consulta.
    Acao.Descricao := Consulta.FieldByName('DESCRICAO').AsString;
    Lista.Add(Acao);
    Consulta.Next;//Passa para o próximo registro no banco, para não cair num loop infinito.
  end;
  result := Lista;
end;

class function TAcao.ObterDetalhes(Codigo: integer): TAcao;
var
  i: Integer;
begin
  for i := 0 to FListaAcoes.Count - 1 do
  begin
    if TAcao(FListaAcoes[i]).Codigo = Codigo then
    begin
      result:= TAcao(FListaAcoes[i]);//Retorna o tipo da função que é TAcao.
      Exit;
    end;
  end;
  Result := nil;
end;

class procedure TAcao.SalvarDados;
begin

end;

procedure TAcao.SetCodigo(const Value: integer);
begin
  if FCodigo <> Value then begin
    if Value <= 0 then
      Raise Exception.Create('O Código da Ação deve ser um número positivo.');
    FCodigo := Value;
  end;
end;

procedure TAcao.SetDescricao(const Value: string);
begin
  if FDescricao <> Value then begin
    if Value = '' then
      Raise Exception.Create('A descrição da Ação é obrigatória.');
    FDescricao := Value;
  end;

end;
initialization
  TAcao.FListaAcoes:= TList.Create; //Inicialização da lista.
  TAcao.FListaAcoes := TAcao.ListaAcoes;

finalization
  TAcao.FListaAcoes.Free;//Destroe a lista.
end.
