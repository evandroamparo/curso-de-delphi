unit UntFormularioPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WideStrings, DB, SqlExpr, StdCtrls, DBXInterbase;

type
  TForm1 = class(TForm)
    Button1: TButton;
    SQLConnection1: TSQLConnection;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UntUIListaPerfis;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  UIListaPerfis := TUIListaPerfis.Create(Application);// Cria o fromulário em tempo de execução e assim que o aplicativo se fecha ele libera da memória.
  UIListaPerfis.Show;
end;

end.
