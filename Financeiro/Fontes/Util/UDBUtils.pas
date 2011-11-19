unit UDBUtils;

interface
uses SysUtils, Forms;

  Type
  TDBUtils = class
    public
      class function CaminhoBanco : string;
  end;
implementation

{ DBUtils }

class function TDBUtils.CaminhoBanco: string;
begin
  Result :=   ExtractFilePath(Application.ExeName) + '..\Dados\Financeiro.fdb';
end;

end.
