unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmPrincipal = class(TForm)
    EdtAdd: TEdit;
    BtnSalvar: TButton;
    MemoNomes: TMemo;
    BtnPesq: TButton;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnPesqClick(Sender: TObject);
  private
    { Private declarations }
  public
    Nomes: array[1..10] of string;//Declara��o de vetor Est�tico.
    Cont : Integer;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnPesqClick(Sender: TObject);
var
  Encontrado: Boolean;
  i: Integer;

begin
  Encontrado:= False;
  for i := 1 to Cont  do
    if Pos(UpperCase(EdtAdd.Text),UpperCase(Nomes[i])) > 0 then//Retorna a posi��o de uma string na primeira ocorr�ncia dentro de uma outra string.
    //UpperCase converte os caracteres para mai�sculo.
    begin
      Application.MessageBox(PWideChar( 'O Elemento foi encontrado na posi��o ' + IntToStr(i)),'Resultado');
      Encontrado:= True;
    end;
    if not Encontrado then
    Application.MessageBox('o elemento n�o foi encontrado.','Resposta');
    EdtAdd.SetFocus;
end;

procedure TFrmPrincipal.BtnSalvarClick(Sender: TObject);
var
  i: Integer;
begin
  if Cont >=10 then
    Application.MessageBox('O n�mero m�ximo de elementos j� foi atingido','Vetor')
  else
  begin
    Cont:= Cont + 1;
    Nomes[Cont]:= EdtAdd.Text;
    MemoNomes.Clear;
    for i := 1 to Cont do
      MemoNomes.Lines.Add(Nomes[i]);

  end;
    EdtAdd.Clear;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Cont:=0;
end;

end.
