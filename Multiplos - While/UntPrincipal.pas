unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EdtNum: TEdit;
    BtnCalc: TButton;
    BtnLimpar: TButton;
    MemoMult: TMemo;
    LblNum: TLabel;
    LblMult: TLabel;
    BtnSair: TButton;
    procedure BtnCalcClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnCalcClick(Sender: TObject);
var
  i: integer;
  calc: integer;
begin
  calc := StrToInt(EdtNum.Text);
  i:= 1;
  while i <= 200 do
  begin
    if i mod calc = 0 then
      MemoMult.Lines.Add(IntToStr(i));
    i:=i+1;
  end;
end;

procedure TForm1.BtnLimparClick(Sender: TObject);
begin
  EdtNum.Clear; //Limpa o EditText.
  MemoMult.Clear; //Limpa o Memo.
end;

procedure TForm1.BtnSairClick(Sender: TObject);
begin
  Close;
end;

end.
