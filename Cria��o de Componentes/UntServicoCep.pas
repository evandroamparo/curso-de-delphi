unit UntServicoCep;

interface

uses
  UntIServicoCep, UntEndereco, SysUtils;
type
  TServicoCep = class(TInterfacedObject, IServicoCep)
    constructor Create(const Login: string; const Senha: string);
    function ConsultaCep(var Endereco : TEndereco): Boolean;
    private
      FLogin: string;
      FSenha: string;
      procedure ExtraiEndereco (var Endereco: TEndereco; DadosEndereco: string); overload;
      procedure ExtraiEndereco (var Endereco: TEndereco; DadosEndereco: array of string); overload;
  end;

  ECepException = class(exception);
implementation

uses WebServiceCep, RegExpr;

{ TServicoCep }

function TServicoCep.ConsultaCep(var Endereco: TEndereco): Boolean;
var
  Servico: CEPServicePort;
begin
  if Endereco <> nil then begin
    Servico := GetCEPServicePort();
    try
      if Endereco.Cep <> '' then begin
        ExtraiEndereco(Endereco, Servico.obterLogradouroAuth(Endereco.Cep, FLogin, FSenha));
      end
      else
        ExtraiEndereco(Endereco, Servico.obterCEPAuth(Endereco.Logradouro, Endereco.Localidade,
                                                      Endereco.Estado, FLogin, FSenha));
      Result := true;
    Except
      Result:= false;
    end;
  end
  else begin
    raise ECepException.Create('O endereço não foi definido.');
  end;

end;

constructor TServicoCep.Create(const Login, Senha: string);
begin
  FLogin := Login;
  FSenha := Senha;
end;

procedure TServicoCep.ExtraiEndereco(var Endereco: TEndereco; DadosEndereco: array of string);
begin
  if Length(DadosEndereco)> 0 then
    ExtraiEndereco(Endereco, DadosEndereco[0]);
end;

procedure TServicoCep.ExtraiEndereco(var Endereco: TEndereco; DadosEndereco: string);
var
  Expressao: TRegExpr;
  Const ExpressaoRegular : string = '(\d{8}) (?-g)(.*) (.*), (.*), (.*), (?g)(.*)';
begin
  Expressao:= TRegExpr.Create;
  Expressao.Expression := ExpressaoRegular;
  if Expressao.Exec(DadosEndereco) then begin
     Endereco.Cep := Expressao.Match[1];
     Endereco.TipoLogradouro := Expressao.Match[2];
     Endereco.Logradouro := Expressao.Match[3];
     Endereco.Bairro:= Expressao.Match[5];
     Endereco.Localidade:= Expressao.Match[6];
  end;
end;

end.
