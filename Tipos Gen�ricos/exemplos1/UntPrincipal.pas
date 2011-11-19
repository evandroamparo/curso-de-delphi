unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edttexto: TEdit;
    BtnTestar: TButton;
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
  generica: Variant;
begin

  try
    StrToInt(Edttexto.Text);
    generica := VarAsType(Edttexto.Text, varInteger);//generica recebe o edt convertido para inteiro.
    ShowMessage('É um tipo inteiro');
    ShowMessage(VarTypeAsText(VarType(generica)));
    exit;
  except
  end;
    try
      StrToFloat(Edttexto.Text);
      generica := VarAsType(Edttexto.Text, varDouble);
      ShowMessage('É um tipo Real');
          ShowMessage(VarTypeAsText(VarType(generica)));
      exit;
    except
    end;
  generica := Edttexto.Text;
  ShowMessage('É um tipo String');
  ShowMessage(VarTypeAsText(VarType(generica)));//Retora uma string indicando o tipo
                                                //que foi passado como parâmetro.

end;

end.
