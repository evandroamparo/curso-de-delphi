unit UntValidacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;


  function RemoveAspas(texto: string): string;
implementation

{$R *.dfm}
function RemoveAspas(texto: string): string;
var
  i: Integer;
begin
  for i := 1 to Length(texto) do
  begin
    if texto[i] <> #39 then
    begin
      Result := Result + texto[i];
    end;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Edit1.Text  := RemoveAspas(Edit1.Text);
end;



end.
