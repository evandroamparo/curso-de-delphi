unit UContaPagar;

interface
uses Generics.Collections, UntAcessoDados, UConta, UFornecedor;

  Type
    TContaPagar = class (TConta)
  private
    FFornecedor: TFornecedor;
    procedure SetFornecedor(const Value: TFornecedor);
  published
    //Declaração de uma propriedade do tipo TFornecedor. Ela contém os atributos do tipo TFornecedor.
      property Fornecedor : TFornecedor read FFornecedor write SetFornecedor;

  public
    Constructor Create;
    class Function Inserir (ContaPagar : TContaPagar) : Boolean;
    Class Function Alterar (ContaPagar : TContaPagar) : Boolean;
    Class Function Excluir (Codigo : integer) : Boolean;
    Class Function Listar : TList<TContaPagar>;
    Class Function ObterDetalhes (Codigo : Integer) : TContaPagar;
    end;
implementation

{ TContaPagar }
uses
  SysUtils, DB, SQLExpr, UDBUtils;
class function TContaPagar.Alterar(ContaPagar: TContaPagar): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCALTERARCONTAAPAGAR';
    Procedimento.ParamByName('INCODIGOCONTAAPAGAR').AsInteger := ContaPagar.Codigo;
    Procedimento.ParamByName('INDESCRICAO').AsString := ContaPagar.Descricao;
    Procedimento.ParamByName('INDATAEMISSAO').AsDate := ContaPagar.DataEmissao;
    Procedimento.ParamByName('INDATAVENCIMENTO').AsDate := ContaPagar.DataVencimento;
    Procedimento.ParamByName('INVALORTITULO').AsFloat := ContaPagar.ValorTitulo;
    Procedimento.ParamByName('INDATARECEBIMENTO').AsDate := ContaPagar.DataRecebimento;
    Procedimento.ParamByName('INVALORRECEBIDO').AsFloat := ContaPagar.ValorRecebido;
    Procedimento.ParamByName('INCODIGOFORNECEDOR').AsInteger := ContaPagar.Fornecedor.Codigo;
    Procedimento.ExecProc;
    result := True;
  Except
    result := False;
  end;
end;
//Construtor da classe.
constructor TContaPagar.Create;
begin
  inherited;
  FAcessoDados := TAcessoDados.Create(TDBUtils.CaminhoBanco);
end;

class function TContaPagar.Excluir(Codigo: integer): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCEXCLUIRCONTAAPAGAR';
    Procedimento.ParamByName('INCODIGOCONTAAPAGR').AsInteger := Codigo;
    Procedimento.ExecProc;
    result := true;
  Except
    result := false;
  End;
end;

class function TContaPagar.Inserir(ContaPagar: TContaPagar): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCINSERIRCONTAAPAGAR';
    Procedimento.ParamByName('INDESCRICAO').AsString := ContaPagar.Descricao;
    Procedimento.ParamByName('INDATAEMISSAO').AsDate := ContaPagar.DataEmissao;
    Procedimento.ParamByName('INDATAVENCIMENTO').AsDate := ContaPagar.DataVencimento;
    Procedimento.ParamByName('INVALORTITULO').AsFloat := ContaPagar.ValorTitulo;
    Procedimento.ParamByName('INDATARECEBIMENTO').AsDate := ContaPagar.DataRecebimento;
    Procedimento.ParamByName('INVALORRECIBO').AsFloat := ContaPagar.ValorRecebido;
    Procedimento.ParamByName('INCODIGOFORNECEDOR').AsInteger := ContaPagar.Fornecedor.Codigo;
    Procedimento.ExecProc;
    Result := True;
  Except
    Result := False;
  end;
end;

class function TContaPagar.Listar: TList<TContaPagar>;
var
  Lista : TList<TContaPagar>;
  ContaPagar : TContaPagar;
  Consulta : TSQLQuery;
begin
  Lista := TList<TContaPagar>.Create;
  Consulta := FAcessoDados.ExecutaConsulta('SELECT * FROM CONTAAPAGAR ORDER BY CODIGOCONTAAPAGAR');
  while not Consulta.Eof do begin
    ContaPagar := TContaPagar.Create;
    ContaPagar.Codigo := Consulta.FieldByName('CODIGOCONTAAPAGAR').AsInteger;
    ContaPagar.Descricao := Consulta.FieldByName('DESCRICAO').AsString;
    ContaPagar.DataEmissao := Consulta.FieldByName('DATAEMISSAO').AsDateTime;
    ContaPagar.DataVencimento := Consulta.FieldByName('DATAVENCIMENTO').AsDateTime;
    ContaPagar.ValorTitulo := Consulta.FieldByName('VALORTITULO').AsFloat;
    ContaPagar.DataRecebimento := Consulta.FieldByName('DATARECEBIMENTO').AsDateTime;
    ContaPagar.ValorRecebido := Consulta.FieldByName('VALORRECEBIDO').AsFloat;
    ContaPagar.Fornecedor.Codigo := Consulta.FieldByName('CODIGOFORNECEDOR').AsInteger;
    Lista.Add(ContaPagar);
    Consulta.Next;
  end;
  Result := Lista;
end;

class function TContaPagar.ObterDetalhes(Codigo: Integer): TContaPagar;
var
  Procedimento : TSQLStoredProc;
  ContaPagar : TContaPagar;
begin
  Procedimento := FAcessoDados.NovoProcedimento;
  Procedimento.StoredProcName := 'PROCRECUPERARCONTAAPAGAR';
  Procedimento.ParamByName('INCODIGOCONTAAPAGAR').AsInteger := Codigo;
  Procedimento.ExecProc;

  ContaPagar := TContaPagar.Create.Create;
  ContaPagar.Descricao := Procedimento.FieldByName('OUTDESCRICAO').AsString;
  ContaPagar.DataEmissao := Procedimento.FieldByName('OUTDATAEMISSAO').AsDateTime;
  ContaPagar.DataVencimento := Procedimento.FieldByName('OUTDATAVENCIMENTO').AsDateTime;
  ContaPagar.ValorTitulo := Procedimento.FieldByName('OUTVALORTITULO').AsFloat;
  ContaPagar.DataRecebimento := Procedimento.FieldByName('OUTDATARECEBIMENTO').AsDateTime;
  ContaPagar.ValorRecebido := Procedimento.FieldByName('VALORRECEBIDO').AsFloat;
  ContaPagar.Fornecedor.Codigo := Procedimento.FieldByName('CODIGOFORNECEDOR').AsInteger;
  Result := ContaPagar;
end;

procedure TContaPagar.SetFornecedor(const Value: TFornecedor);
begin
    FFornecedor := Value;
end;

end.
