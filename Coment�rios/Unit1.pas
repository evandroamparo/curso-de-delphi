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

// Coment�rio de uma linha.
{ Coment�rio de v�rias linhas

}
(* coment�rio de v�rias Linhas

*)

procedure Teste;
var
  x:Integer;
begin
  //Coment�rios aninhados.
  (*x := 0;
  (*x := x + 1;*) //T�rmino nessa linha.
  *)
end;

end.
