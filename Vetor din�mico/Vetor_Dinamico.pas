unit Vetor_Dinamico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EdtTamanho: TEdit;
    BtnInicial: TButton;
    BtnTamanho: TButton;
    MemoMostrar: TMemo;
    procedure BtnInicialClick(Sender: TObject);
    procedure BtnTamanhoClick(Sender: TObject);
  private
    { Private declarations }
  public
    Vetor: array of string; //Declaração de vetor Dinâmico(índices de  0 a n-1.).
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnInicialClick(Sender: TObject);
var
  i: Integer;
begin
  SetLength(Vetor,StrToInt(EdtTamanho.Text));//Altera o tamanho do vetor.
  for i := 0 to Length(Vetor) - 1 do
    Vetor[i]:=IntToStr(i);
end;

procedure TForm1.BtnTamanhoClick(Sender: TObject);
var
  i: Integer;
begin
  SetLength(Vetor,StrToInt(EdtTamanho.Text));
  MemoMostrar.Clear;
  for i := 0 to Length(Vetor) - 1 do
    MemoMostrar.Lines.Add((Vetor[i]));//Adiciona ao Memo.
end;

end.
