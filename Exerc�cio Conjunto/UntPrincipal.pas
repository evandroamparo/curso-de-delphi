unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    RbtUniao: TRadioButton;
    RbtDiferenca: TRadioButton;
    BtnCalcular: TButton;
    Memo3: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Rbtintercecao: TRadioButton;
    procedure BtnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnCalcularClick(Sender: TObject);
var
  i: Integer;
  conjunto1, conjunto2, conjunto3: set of char;
  conj: char;
begin
  Memo3.Lines.Clear;
  conjunto1:= [];
  conjunto2:= [];
  conjunto3:= [];
  for i := 0 to Memo1.Lines.Count -1 do //Retorna o número de linhas.
  begin
    if Length(Memo1.Lines[i])>1 then //Tamanho da linha do Memo.
    begin
      ShowMessage('Os elementos só podem conter um caracter por linha');
      exit;
    end;
  end;
  for i := 0 to Memo2.Lines.Count - 1 do
  begin
    if Length(Memo2.Lines[i])>1 then
    begin
      ShowMessage('Os elementos só podem conter um caracter por linha');
      exit;
    end;
  end;
  for i := 0 to Memo1.Lines.Count - 1 do
  begin
    conjunto1:= conjunto1 + [Memo1.Lines[i][1]];
  end;

  for i := 0 to Memo2.Lines.Count - 1 do
  begin
    conjunto2:= conjunto2 + [Memo2.Lines[i][1]];
  end;

  if RbtUniao.Checked then
    conjunto3:= conjunto1 + conjunto2
  else if RbtDiferenca.Checked then
    conjunto3:= conjunto1 - conjunto2
    else
      conjunto3:= conjunto1 * conjunto2;

  for conj in conjunto3 do //Percorre o conjunto.
  begin
    Memo3.Lines.Add(conj);
  end;


end;

end.
