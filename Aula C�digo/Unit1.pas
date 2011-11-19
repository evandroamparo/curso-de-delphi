unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EdtNum1: TEdit;
    EdtNum2: TEdit;
    BtnCalcular: TButton;
    EdtResultado: TEdit;
    RbtSoma: TRadioButton;
    Rbtsubtracao: TRadioButton;
    RbtMultiplicacao: TRadioButton;
    RbtDivisao: TRadioButton;
    procedure BtnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UntCalculos;


{$R *.dfm}

procedure TForm1.BtnCalcularClick(Sender: TObject);
var
  operacao: TOperacao;
begin
  {EdtResultado.Text:=FloatToStr(soma(StrToFloat(EdtNum1.Text),
  StrToFloat(EdtNum2.Text)));
  Soma2(StrToFloat(EdtNum1.Text),StrToFloat(EdtNum2.Text));
  EdtResultado.Text:=FloatToStr(resultado);}
  if RbtSoma.Checked then
  operacao:=opSoma;
  if Rbtsubtracao.Checked then
  operacao:=opSubtracao;
  if RbtMultiplicacao.Checked then
  operacao:=opMultiplicacao;
  if RbtDivisao.Checked then
  operacao:=opDivisao;
  EdtResultado.Text:=FloatToStr(Calcular(StrToFloat(EdtNum1.Text),
  StrToFloat(EdtNum2.Text),operacao));
end;


end.
