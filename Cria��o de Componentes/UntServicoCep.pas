unit UntServicoCep;

interface

uses
  UntIServicoCep;
type
  TServicoCep = class(TInterfacedObject, IServicoCep)
    constructor Create(const Login: string; const Senha: string)
  end;
implementation

end.
