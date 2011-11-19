unit UntUsuario;

interface

uses classes, UntPerfilUsuario;
 Type
 TUsuario = class
 private
    FCodigo : integer;//Declaração de atributo.
    FDescricao : string;
    FCodigoPerfil : integer;
    FSenha: string;
    FLogin: string;
    procedure SetCodigo(const Value : integer);//Declaração de Procedimento de escrita no atributo.
    procedure SetDescricao(const Value : string);
    class procedure LerDados();
    class procedure SalvarDados();
    class var FListaUsuarios : TList;
    procedure SetLogin(const Value: string);
    procedure SetSenha(const Value: string);
    function GetPerfil: TPerfilUsuario;
    procedure SetPerfil(const Value: TPerfilUsuario);

  public
   Property Codigo : integer read FCodigo write SetCodigo;//Propriedade que manipula o atributo.
   Property Descricao : string read FDescricao write SetDescricao;
   class function Incluir(Usuario : TUsuario): Boolean;
   class function Alterar(Usuario : TUsuario):Boolean;
   class function Excluir(Codigo : integer): Boolean;
   class Property ListaUsuarios : TList read FListaUsuarios;
   class function ObterDetalhes(Codigo : integer) :TUsuario;//Retorna um tipo TUsuario.
   Property Login : string read FLogin write SetLogin;
   Property Senha : string read FSenha Write SetSenha;
   Property Perfil : TPerfilUsuario read GetPerfil write SetPerfil;
 end;
implementation
uses SysUtils;
{ TUsuario }

class function TUsuario.Alterar(Usuario: TUsuario): Boolean;
var
  i: Integer;
begin
  for i := 0 to ListaUsuarios.Count - 1 do
  begin
    if TUsuario(ListaUsuarios[i]).Codigo = Usuario.Codigo then begin
      ListaUsuarios[i]:= Usuario;
      SalvarDados;
      break;
    end;
  end;
  Result := true;
end;

class function TUsuario.Excluir(Codigo: integer): Boolean;
var
  i: Integer;
begin
  for i := 0 to ListaUsuarios.Count - 1 do
  begin
    if TUsuario(ListaUsuarios[i]).Codigo = Codigo then begin
      ListaUsuarios.Delete(Codigo);
      SalvarDados;
      Break;
    end;
  end;
  Result := true;
end;

function TUsuario.GetPerfil: TPerfilUsuario;
begin
  result := TPerfilUsuario.ObterDetalhes(FCodigoPerfil);
end;

class function TUsuario.Incluir(Usuario: TUsuario): Boolean;
begin
  ListaUsuarios.Add(Usuario);
  SalvarDados;
end;

class procedure TUsuario.LerDados;
begin

end;

class function TUsuario.ObterDetalhes(Codigo: integer): TUsuario;
var
  i: Integer;
begin
  for i := 0 to ListaUsuarios.Count - 1 do
  begin
    if TUsuario(ListaUsuarios[i]).Codigo = Codigo then begin
      Result := TUsuario(ListaUsuarios[i]); //Retorna o Objeto da Posição i da ListaUsuarios.
      break;
    end;
  end;
  Result := nil;//Retorna nulo.
end;

class procedure TUsuario.SalvarDados;
begin

end;

procedure TUsuario.SetCodigo(const Value: integer);
begin
  if FCodigo <> Value then begin
    if Value <= 0 then
      Raise Exception.Create('O Código do usuário deve ser um número positivo.');
    FCodigo := Value;
  end;
end;

procedure TUsuario.SetDescricao(const Value: string);
begin
  if FDescricao <> Value then begin
    if Value = '' then
      Raise Exception.Create('A descrição do Usuário é obrigatória.');
    FDescricao := Value;
  end;
end;

procedure TUsuario.SetLogin(const Value: string);
begin
  if FLogin <> Value then begin
    if Value = '' then
      Raise Exception.Create('O Login não pode ser vazio.');
    FLogin := Value;
  end;
end;

procedure TUsuario.SetPerfil(const Value: TPerfilUsuario);
begin
  if Value = nil then begin
    raise Exception.Create('O Perfil do usuário não pode ser nulo.');
  end;
  FCodigoPerfil := Value.Codigo;
end;

procedure TUsuario.SetSenha(const Value: string);
begin
  if FSenha <> Value then begin
     if Length(Value)< 6  then
       Raise Exception.Create('A senha deve conter no mínimo 6 caracteres.');
     FSenha := Value;
  end;

end;

end.
