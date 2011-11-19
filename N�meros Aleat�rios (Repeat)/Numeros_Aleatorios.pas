unit Numeros_Aleatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    EdtNum: TEdit;
    BtnTestar: TButton;
    LblNum: TLabel;
    procedure BtnTestarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnTestarClick(Sender: TObject);
var
  num: integer;
  continuar: Boolean;
begin
  Randomize;
  repeat
    num:= Random(10)+1;
    if num <> StrToInt(EdtNum.Text) then
      continuar:=Application.MessageBox(PWideChar('N�mero diferente do n�mero digitado: '+IntToStr(num)+'. Deseja continuar?'), 'Teste Aleat�rios', MB_YESNO+MB_ICONQUESTION)= ID_YES
    else
    begin
      Application.MessageBox(PWideChar('N�mero igual ao n�mero digitado: '+ IntToStr(num)),'Teste Aleat�rios');
      continuar:= False;
    end;
  until (not continuar);
  EdtNum.Clear;
end;

end.
