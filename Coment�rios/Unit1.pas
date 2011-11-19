unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

// Comentário de uma linha.
{ Comentário de várias linhas

}
(* comentário de várias Linhas

*)

procedure Teste;
var
  x:Integer;
begin
  //Comentários aninhados.
  (*x := 0;
  (*x := x + 1;*) //Término nessa linha.
  *)
end;

end.
