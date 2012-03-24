unit UntIServicoCep;

interface

uses
  UntEndereco;
type
  IServicoCep = interface
    function ConsultaCep (var Endereco : TEndereco): Boolean;
  end;
implementation

end.
