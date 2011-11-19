unit UContaReceber;

interface
uses Generics.Collections, UntAcessoDados, UConta, UCliente;
  Type
    TContaReceber = class (TConta)

    private
      FCliente : TCliente;

    procedure SetCliente(const Value: Tcliente);

    published
    property Cliente : Tcliente read FCliente write SetCliente;

    public
    Constructor Create;
    Class Function Inserir (ContaReceber : TContaReceber) : Boolean;
    Class Function Alterar (ContaReceber : TContaReceber) : Boolean;
    Class Function Excluir (Codigo : integer) : Boolean;
    Class Function Listar : TList<TContaReceber>;
    Class Function ObterDetalhes (Codigo : integer) : TContaReceber;
    end;
implementation

{ TContaReceber }
uses SysUtils, DB, SqlExpr, UDBUtils;
class function TContaReceber.Alterar(ContaReceber: TContaReceber): Boolean;
var
  Procedimento :  TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCALTERARCONTAARECEBER';
    Procedimento.ParamByName('INCODIGOCONTAARECEBER').AsInteger := ContaReceber.Codigo;
    Procedimento.ParamByName('INDESCRICAO').AsString := ContaReceber.Descricao;
    Procedimento.ParamByName('INDATAEMISSÃO').AsDate := ContaReceber.DataEmissao;
    Procedimento.ParamByName('INDATAVENCIMENTO').AsDate := ContaReceber.DataVencimento;
    Procedimento.ParamByName('INVALORTITULO').AsFloat := ContaReceber.ValorTitulo;
    Procedimento.ParamByName('INDATARECEBIMENTO').AsDate := ContaReceber.DataRecebimento;
    Procedimento.ParamByName('INVALORRECEBIDO').AsFloat := ContaReceber.ValorRecebido;
    Procedimento.ParamByName('INCODIGOCLIENTE').AsInteger := ContaReceber.Cliente.Codigo;
    Procedimento.ExecProc;
    Result := True;
  Except
    Result := False;
  End;
end;

constructor TContaReceber.Create;
begin
  inherited;
  //FAcessoDados foi herdado da classe TConta, e está sendo criado para transações com a classe TAcessoDados.
  FAcessoDados := TAcessoDados.Create(TDBUtils.CaminhoBanco);
end;

class function TContaReceber.Excluir(Codigo: integer): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCEXCLUIRCONTAARECEBER';
    Procedimento.ParamByName('INCODIGOCONTAARECEBER').AsInteger := Codigo;
    Procedimento.ExecProc;
    Result := True;
  Except
    Result := False;
  End;
end;

class function TContaReceber.Inserir(ContaReceber: TContaReceber): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCINSERIRCONTAARECEBER';
    Procedimento.ParamByName('INDESCRICAO').AsString := ContaReceber.Descricao;
    Procedimento.ParamByName('INDATAEMISSÃO').AsDate := ContaReceber.DataEmissao;
    Procedimento.ParamByName('INDATAVENCIMENTO').AsDate := ContaReceber.DataVencimento;
    Procedimento.ParamByName('INVALORTITULO').AsFloat := ContaReceber.ValorTitulo;
    Procedimento.ParamByName('INDATARECEBIMENTO').AsDate := ContaReceber.DataRecebimento;
    Procedimento.ParamByName('INVALORRECEBIDO').AsFloat := ContaReceber.ValorRecebido;
    Procedimento.ParamByName('INCODIGOCLIENTE').AsInteger := ContaReceber.Cliente.Codigo;
    Procedimento.ExecProc;
    Result := True;
  Except
    Result := False;
  End;
end;

class function TContaReceber.Listar: TList<TContaReceber>;
var
  Lista : TList<TContaReceber>;
  ContaReceber : TContaReceber;
  Consulta : TSQLQuery;
begin
  Lista := TList<TContaReceber>.Create;
  Consulta := FAcessoDados.ExecutaConsulta('SELECT * FROM CONTAARECEBER ORDER BY CODIGOCONTAARECEBER');

  while not Consulta.Eof do
  begin
    ContaReceber := TContaReceber.Create;
    ContaReceber.Codigo := Consulta.FieldByName('CODIGOCONTAARECEBER').AsInteger;
    ContaReceber.Descricao := Consulta.FieldByName('DESCRICAO').AsString;
    ContaReceber.DataEmissao := Consulta.FieldByName('DATAEMISSAO').AsDateTime;
    ContaReceber.DataVencimento := Consulta.FieldByName('DATAVENCIMENTO').AsDateTime;
    ContaReceber.ValorTitulo := Consulta.FieldByName('VALORTITULO').AsFloat;
    ContaReceber.DataRecebimento := Consulta.FieldByName('DATARECEBIMENTO').AsDateTime;
    ContaReceber.ValorRecebido := Consulta.FieldByName('VALORRECEBIDO').AsFloat;
    ContaReceber.Cliente.Codigo := Consulta.FieldByName('CODIGOCLIENTE').AsInteger;
    Lista.Add(ContaReceber);
    Consulta.Next;
  end;
  Result := Lista;
end;

class function TContaReceber.ObterDetalhes(Codigo: integer): TContaReceber;
var
  Procedimento : TSQLStoredProc;
  ContaReceber : TContaReceber;
begin
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCRECUPERARCONTAARECEBER';
    Procedimento.ParamByName('INCODIGOCONTAARECEBER').AsInteger := Codigo;
    Procedimento.ExecProc;
    ContaReceber := TContaReceber.Create;
    ContaReceber.Descricao := Procedimento.FieldByName('OUTDESCRICAO').AsString;
    ContaReceber.DataEmissao := Procedimento.FieldByName('DATAEMISSAO').AsDateTime;
    ContaReceber.DataVencimento := Procedimento.FieldByName('DATAVENCIMENTO').AsDateTime;
    ContaReceber.ValorTitulo := Procedimento.FieldByName('VALORTITULO').AsFloat;
    ContaReceber.DataRecebimento := Procedimento.FieldByName('DATARECEBIMENTO').AsDateTime;
    ContaReceber.ValorRecebido := Procedimento.FieldByName('VALORRECEBIDO').AsFloat;
    ContaReceber.Cliente.Codigo := Procedimento.FieldByName('CODIGOCLIENTE').AsInteger;
    Result := ContaReceber;
end;

procedure TContaReceber.SetCliente(const Value: Tcliente);
begin
  FCliente := Value;
end;

end.
