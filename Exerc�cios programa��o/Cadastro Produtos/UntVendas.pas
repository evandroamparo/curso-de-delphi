unit UntVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TUIVenda = class(TForm)
    EdtNome: TEdit;
    EdtDescricao: TEdit;
    EdtQuantidade: TEdit;
    EdtValorTotal: TEdit;
    BtnVender: TButton;
    BtnCancelar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtValorUnitario: TEdit;
    Label5: TLabel;
    procedure EdtQuantidadeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UIVenda: TUIVenda;

implementation

uses UntListProduto, UntVenda;

{$R *.dfm}

procedure TUIVenda.EdtQuantidadeChange(Sender: TObject);
begin
 try
  EdtValorTotal.Text := FloatToStr(StrToFloat(EdtQuantidade.Text) * StrToFloat(EdtValorUnitario.Text));
 except
  EdtValorTotal.Clear;
 end;
end;

procedure TUIVenda.FormShow(Sender: TObject);
begin
  EdtQuantidade.SetFocus;
end;

end.
