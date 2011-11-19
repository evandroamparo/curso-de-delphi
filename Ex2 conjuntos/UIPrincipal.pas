unit UIPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Memo2: TMemo;
    Label2: TLabel;
    Memo3: TMemo;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    RbtUniao: TRadioButton;
    RbtDiferenca: TRadioButton;
    Label3: TLabel;
    BtnCalcular: TButton;
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
  ConjuntoA, ConjuntoB, Resultado: set of char;
  c: Char;
begin
  Memo3.Lines.Clear;

  // Validar os elementos
  for i := 0 to Memo1.Lines.Count - 1 do
  begin
    if Length(Memo1.Lines[i]) > 1 then
    begin
      Application.MessageBox('Os elementos só podem conter um caractere.',
          'Erro', MB_OK + MB_ICONERROR);
      exit;
    end;
  end;

  for i := 0 to Memo2.Lines.Count - 1 do
  begin
    if Length(Memo2.Lines[i]) > 1 then
    begin
      Application.MessageBox('Os elementos só podem conter um caractere.',
          'Erro', MB_OK + MB_ICONERROR);
      exit;
    end;
  end;

  // Inicializar os conjuntos
  ConjuntoA := [];
  for i := 0 to Memo1.Lines.Count - 1 do
    ConjuntoA := ConjuntoA + [Memo1.Lines[i][1]];

  ConjuntoB := [];
  for i := 0 to Memo2.Lines.Count - 1 do
    ConjuntoB := ConjuntoB + [Memo2.Lines[i][1]];

  // Fazer a operação
  if RbtUniao.Checked then
    Resultado := ConjuntoA + ConjuntoB
  else
    Resultado := ConjuntoA - ConjuntoB;

  // Mostrar o resultado
  for c in Resultado do
    Memo3.Lines.Add(c);
end;

end.
