unit UPlanoContas;

interface

uses Generics.Collections, UntAcessoDados;

  type
    TTipoOperacao = (opCredito, opDebito);
    TPlanoContas = class
  private

    FCodigo: integer;
    FDescricao: string;
    FTipoOperacao: TTipoOperacao;
    class var FAcessoDados: TAcessoDados;
    procedure SetCodigo(const Value: integer);
    procedure SetDescricao(const Value: string);
    procedure SetTipoOperacao(const Value: TTipoOperacao);
    function GetNomeTipoOperacao: string;
  published
    property Codigo : integer read FCodigo write SetCodigo;
    property Descricao : string read FDescricao write SetDescricao;
    property TipoOperacao : TTipoOperacao read FTipoOperacao write SetTipoOperacao;
    property NomeTipoOperacao : string read GetNomeTipoOperacao;
  public
    Constructor Create;
    class function Inserir (PlanoContas : TPlanoContas): Boolean;
    class function Alterar (PlanoContas : TPlanoContas): Boolean;
    class function Excluir (Codigo : integer): Boolean;
    class function Listar: TList<TPlanoContas>;
    class function ObterDetalhes (Codigo : integer): TPlanoContas;
  end;

implementation

uses
  SysUtils, DB, SQLExpr, UDBUtils;

{ TPlanoContas }

class function TPlanoContas.Alterar(PlanoContas: TPlanoContas): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCALTERARPLANOCONTAS';
    Procedimento.ParamByName('INCODIGOPLANOCONTAS').AsInteger := PlanoContas.Codigo;
    case PlanoContas.TipoOperacao of
      opCredito:
        Procedimento.Params.ParamByName('INTIPOOPERACAO').AsString := 'C';
      opDebito:
        Procedimento.Params.ParamByName('INTIPOOPERACAO').AsString := 'D';
    end;
    Procedimento.Params.ParamByName('INDESCRICAO').AsString := PlanoContas.Descricao;
    Procedimento.ExecProc;
    result := true;
  except
    result := false;
  end;
end;

constructor TPlanoContas.Create;
begin
  inherited;
  FAcessoDados := TAcessoDados.Create(TDBUtils.CaminhoBanco);
end;

class function TPlanoContas.Excluir(Codigo: integer): Boolean;
var
  Procedimento : TSQLStoredProc;
begin
  try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCEXCLUIRPLANOCONTAS';
    Procedimento.ParamByName('INCODIGOPLANOCONTAS').AsInteger := Codigo;
    Procedimento.ExecProc;
    Result := true;
  except
    Result := false;
  end;
end;
//Retorna a string do tipo de operação.
function TPlanoContas.GetNomeTipoOperacao: string;
begin
  case TipoOperacao of
    opCredito://Variável carregada quando o método lista ou obterdetalhes for chamado.
      result := 'Crédito';
    opDebito:
      result := 'Débito';
  end;
end;

class function TPlanoContas.Inserir(PlanoContas: TPlanoContas): Boolean;
var
  Procedimento: TSQLStoredProc;
begin
  try
    Procedimento := FAcessoDados.NovoProcedimento;
    Procedimento.StoredProcName := 'PROCINSERIRPLANOCONTAS';
    case PlanoContas.TipoOperacao of
      opCredito:
        Procedimento.Params.ParamByName('INTIPOOPERACAO').AsString := 'C';
      opDebito:
        Procedimento.Params.ParamByName('INTIPOOPERACAO').AsString := 'D';
    end;
    Procedimento.Params.ParamByName('INDESCRICAO').AsString := PlanoContas.Descricao;
    Procedimento.ExecProc;
    result := true;
  except
    result := false;
  end;
end;

class function TPlanoContas.Listar: TList<TPlanoContas>;
var
  Lista : TList<TPlanoContas>;
  PlanoContas : TPlanoContas;
  Consulta : TSQLQuery;//Classe utilizada para fazer consulta no banco.
begin
  //criar lista a ser retornada
  Lista := TList<TPlanoContas>.create;

  //executar consulta para recuperar todos os registros do BD
  Consulta := FAcessoDados.ExecutaConsulta('select * from planocontas order by descricao');

  //enquanto houver mais registros...
  while not Consulta.Eof do begin
    //criar um novo objeto
    PlanoContas := TPlanoContas.Create;
    //popular o objeto
    PlanoContas.Codigo := Consulta.FieldByName('codigoplanocontas').AsInteger;
    if Consulta.FieldByName('tipooperacao').AsString = 'D' then
      PlanoContas.TipoOperacao := opDebito
    else
      PlanoContas.TipoOperacao := opCredito;
    PlanoContas.Descricao := Consulta.FieldByName('descricao').AsString;
    //adicionar o objeto à lista
    Lista.Add(PlanoContas);
    //avançar para o próximo registro
    Consulta.Next;
  end;
  //retornar a lista de objetos
  result := Lista;
end;

class function TPlanoContas.ObterDetalhes(Codigo: integer): TPlanoContas;
var
  Procedimento : TSQLStoredProc;
  PlanoContas : TPlanoContas;
begin
  //criar um novo objeto para executar um procedimento armazenado
  Procedimento := FAcessoDados.NovoProcedimento;
  //definir o nome e os parâmetros do procedimento
  Procedimento.StoredProcName := 'PROCRECUPERARPLANOCONTAS';
  Procedimento.ParamByName('INCODIGOPLANOCONTAS').AsInteger := Codigo;
  //executar o procedimento
  Procedimento.ExecProc;
  //criar um novo objeto para representar o registro retornado
  PlanoContas := TPlanoContas.Create;
  PlanoContas.Codigo := Codigo;
  if Procedimento.ParamByName('OUTTIPOOPERACAO').AsString = 'D' then
    PlanoContas.TipoOperacao := opDebito
  ELSE
    PlanoContas.TipoOperacao := opCredito;
  PlanoContas.Descricao := Procedimento.ParamByName('OUTDESCRICAO').AsString;
  //retornar o objeto
  RESULT := PlanoContas;
end;

procedure TPlanoContas.SetCodigo(const Value: integer);
begin
  if Value <> FCodigo then begin
    if Value <= 0 then begin
      raise Exception.Create('O Código do plano de contas não pode ser menor igual a zero.');
    end;
    FCodigo := Value;
  end;
end;

procedure TPlanoContas.SetDescricao(const Value: string);
begin
  if Value <> FDescricao then begin
    if Value = '' then begin
      raise Exception.Create('A descrição do plano de contas não pode ser vazia.');
    end;
  FDescricao := Value;
  end;
end;

procedure TPlanoContas.SetTipoOperacao(const Value: TTipoOperacao);
begin
  FTipoOperacao := Value;
end;

initialization
   TPlanoContas.FAcessoDados := TAcessoDados.Create(TDBUtils.CaminhoBanco);

end.
