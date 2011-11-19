unit UIPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ChkNegrito: TCheckBox;
    ChkItalico: TCheckBox;
    ChkSublinhado: TCheckBox;
    ChkTachado: TCheckBox;
    Memo1: TMemo;
    Label1: TLabel;
    LblEstilos: TLabel;
    procedure ChkNegritoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ChkNegritoClick(Sender: TObject);
var
  Estilos: string;
begin
 Estilos := '';

  if ChkNegrito.Checked then
    Memo1.Font.Style := Memo1.Font.Style + [fsBold]
  else
    Memo1.Font.Style := Memo1.Font.Style - [fsBold];

  if ChkItalico.Checked then
    Memo1.Font.Style := Memo1.Font.Style + [fsItalic]
  else
    Memo1.Font.Style := Memo1.Font.Style - [fsItalic];

  if ChkSublinhado.Checked then
    Memo1.Font.Style := Memo1.Font.Style + [fsUnderline]
  else
    Memo1.Font.Style := Memo1.Font.Style - [fsUnderline];

  if ChkTachado.Checked then
    Memo1.Font.Style := Memo1.Font.Style + [fsStrikeOut]
  else
    Memo1.Font.Style := Memo1.Font.Style - [fsStrikeOut];


  if fsBold in Memo1.Font.Style then
    Estilos := Estilos + 'Negrito ';

  if fsItalic in Memo1.Font.Style then
    Estilos := Estilos + 'Itálico ';

  if fsUnderline in Memo1.Font.Style then
    Estilos := Estilos + 'Sublinhado ';

  if fsStrikeOut in Memo1.Font.Style then
    Estilos := Estilos + 'Tachado ';

  if Estilos = '' then
    LblEstilos.Caption := '<Nenhum>'
  else
    LblEstilos.Caption := Estilos;
end;

end.
