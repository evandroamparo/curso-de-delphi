unit UMovimentacao;

interface
uses
  Generics.Collections, UntAcessoDados, UContaPagar, UContaReceber, UPlanoContas, UConta;

  Type
    TMovimentacao = class
  private
    FPlanoContas: TPlanoContas;
    FContaReceber: TContaReceber;
    FContaPagar: TContaPagar;
    FValorPrevisto: Double;
    FValorRealizado: Double;
    FCodigo: integer;
    Class var FAcessoDados : TAcessoDados;

    procedure SetFContaPagar(const Value: TContaPagar);
    procedure SetFContaReceber(const Value: TContaReceber);
    procedure SetFPlanoContas(const Value: TPlanoContas);
    procedure SetFValorRealizado(const Value: Double);
    procedure SetCodigo(const Value: integer);
  published
      property Codigo : integer read FCodigo write SetCodigo;
      property ContaPagar : TContaPagar read FContaPagar write SetFContaPagar;
      property ContaReceber : TContaReceber read FContaReceber write SetFContaReceber;
      property PlanoContas : TPlanoContas read FPlanoContas write SetFPlanoContas;
      property ValorPrevisto : Double read FValorPrevisto;
      property ValorRealizado : Double read FValorRealizado write SetFValorRealizado;
  public
    Constructor Create;
    Class Function Inserir (Movimentacao : TMovimentacao) : Boolean;
    Class Function Alterar (Movimentacao : TMovimentacao) : Boolean;
    Class Function Excluir (Codigo : integer) : Boolean;
    Class Function Listar : TList<TMovimentacao>;
    Class Function ObterDetalhes (Codigo : integer) : TMovimentacao;
    end;

implementation

{ TMovimentacao }
uses SysUtils, DB, SqlExpr, UDBUtils;
class function TMovimentacao.Alterar(Movimentacao: TMovimentacao): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCALTERARMOVIMENTACAO';
    Procedimento.ParamByName('INCODIGOMOVIMENTACAO').AsInteger := Movimentacao.Codigo;
    Procedimento.ParamByName('INCODIGOCONTAAPAGAR').AsInteger := Movimentacao.ContaPagar.Codigo;
    Procedimento.ParamByName('INCODIGOCONTAARECEBER').AsInteger := Movimentacao.ContaReceber.Codigo;
    Procedimento.ParamByName('INVALORPREVISTO').AsFloat := Movimentacao.ValorPrevisto;
    Procedimento.ParamByName('INVALORREALIZADO').AsFloat := Movimentacao.ValorRealizado;
    Procedimento.ParamByName('INCODIGOPLANOCONTAS').AsInteger := Movimentacao.PlanoContas.Codigo;
    Procedimento.ExecProc;
    Result := True;
  Except
    Result := False;
  End;
end;

constructor TMovimentacao.Create;
begin
  inherited;
  FAcessoDados := TAcessoDados.Create(TDBUtils.CaminhoBanco);
end;

class function TMovimentacao.Excluir(Codigo: integer): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCEXCLUIRMOVIMENTACAO';
    Procedimento.ParamByName('INCODIGOMOVIMENTACAO').AsInteger := Codigo;
    Procedimento.ExecProc;
    result := true;
  Except
    Result := False;
  End;
end;

class function TMovimentacao.Inserir(Movimentacao: TMovimentacao): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  Try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCINSERIRMOVIMENTACAO';
    Procedimento.ParamByName('INCODIGOCONTAAPAGAR').AsInteger := Movimentacao.ContaPagar.Codigo;
    Procedimento.ParamByName('INCODIGOCONTAARECEBER').AsInteger := Movimentacao.ContaReceber.Codigo;
    Procedimento.ParamByName('INVALORPREVISTO').AsFloat := Movimentacao.ValorPrevisto;
    Procedimento.ParamByName('INVALORREALIZADO').AsFloat := Movimentacao.ValorRealizado;
    Procedimento.ParamByName('INCODIGOPLANOCONTAS').AsInteger := Movimentacao.PlanoContas.Codigo;
    Procedimento.ExecProc;
    Result := true;
  Except
    Result := False;
  End;

end;

class function TMovimentacao.Listar: TList<TMovimentacao>;
var
  Lista : TList<TMovimentacao>;
  Movimentacao : TMovimentacao;
  Consulta : TSQLQuery;
begin
  Lista := TList<TMovimentacao>.Create;
  Consulta := FAcessoDados.ExecutaConsulta('SELECT * FROM MOVIMENTACAO ORDER BY CODIGOMOVIMENTACAO');
  while not Consulta.Eof do begin
    Movimentacao := TMovimentacao.Create;
    Movimentacao.Codigo := Consulta.FieldByName('CODIGOMOVIMENTACAO').AsInteger;
    Movimentacao.ContaPagar.Codigo := Consulta.FieldByName('CODIGOCONTAAPAGAR').AsInteger;
    Movimentacao.ContaReceber.Codigo := Consulta.FieldByName('CODIGOCONTAARECEBER').AsInteger;
    Movimentacao.FValorPrevisto := Consulta.FieldByName('VALORPREVISTO').AsFloat;
    Movimentacao.ValorRealizado := Consulta.FieldByName('VALORREALIZADO').AsFloat;
    Movimentacao.PlanoContas.Codigo := Consulta.FieldByName('CODIGOPLANOCONTAS').AsInteger;
    Lista.Add(Movimentacao);
    Consulta.Next
  end;
  Result := Lista;
end;

class function TMovimentacao.ObterDetalhes(Codigo: integer): TMovimentacao;
var
  Procedimento : TSQLStoredProc;
  Movimentacao : TMovimentacao;
begin
  Procedimento := FAcessoDados.NovoProcedimento;
  Procedimento.StoredProcName := 'PROCRECUPERARMOVIMENTACAO';
  Procedimento.ParamByName('INCODIGOMOVIMENTACAO').AsInteger := Codigo;
  Procedimento.ExecProc;

  Movimentacao := TMovimentacao.Create;
  Movimentacao.ContaPagar.Codigo := Procedimento.FieldByName('OUTCODIGOCONTAAPAGAR').AsInteger;
  Movimentacao.ContaReceber.Codigo := Procedimento.FieldByName('OUTCODIGOCONTAARECEBER').AsInteger;
  Movimentacao.FValorPrevisto := Procedimento.FieldByName('OUTVALORPREVISTO').AsFloat;
  Movimentacao.ValorRealizado := Procedimento.FieldByName('OUTVALORREALIZADO').AsFloat;
  Movimentacao.PlanoContas.Codigo := Procedimento.FieldByName('CODIGOPLANOCONTAS').AsInteger;
  Result := Movimentacao;
end;

procedure TMovimentacao.SetCodigo(const Value: integer);
begin
  FCodigo := Value;
end;

procedure TMovimentacao.SetFContaPagar(const Value: TContaPagar);
begin
  if (value <> nil) and (FContaReceber <> nil) then begin
    raise exception.Create('Não é possível utilizar uma conta a pagar pois o plano '+
                            'já possue uma conta a receber');
    exit;
  end;
  if value <> nil then begin
    FValorPrevisto := Value.ValorTitulo;
  end else begin
        FValorPrevisto := 0;
  end;
  FContaPagar := Value;
end;

procedure TMovimentacao.SetFContaReceber(const Value: TContaReceber);
begin
  if (value <> nil) and (FContaPagar <> nil) then begin
    raise exception.Create('Não é possível utilizar uma conta a receber pois o plano '+
                            'já possue uma conta a pagar');
    exit;
  end;
  if value <> nil then begin
    FValorPrevisto := Value.ValorTitulo;
  end else begin
        FValorPrevisto := 0;
  end;
  FContaReceber := Value;
end;

procedure TMovimentacao.SetFPlanoContas(const Value: TPlanoContas);
begin
  FPlanoContas := Value;
end;

procedure TMovimentacao.SetFValorRealizado(const Value: Double);
begin
  FValorRealizado := Value;
end;

end.
