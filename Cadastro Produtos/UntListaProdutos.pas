unit UntListaProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids;

type
  TForm1 = class(TForm)
    SGProdutos: TStringGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  SGProdutos.Cells[0,0]:= 'CODIGO';
  SGProdutos.Cells[1,0]:= 'NOME';
  SGProdutos.Cells[2,0]:= 'DESCRIÇÃO';
  SGProdutos.Cells[3,0]:= 'VALOR';
  SGProdutos.Cells[4,0]:= 'QUANT ESTOQUE';
end;

end.
