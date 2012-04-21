unit UntUIProduto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UntXmlProduto, Produto, XMLIntf, XMLDoc;

type
  TForm1 = class(TForm)
    EdtDescricao: TEdit;
    EdtCategoria: TEdit;
    EdtUnidadeMedida: TEdit;
    EdtValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    BtnSalvar: TButton;
    Button2: TButton;
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnSalvarClick(Sender: TObject);
var
  XmlProdutos : IXMLProdutosType;
  XmlProduto : IXMLProdutoType;
  Xml : IXMLDocument;
begin
  Xml := TXMLDocument.Create('exemplo.xml');
  XmlProdutos := Getprodutos(Xml);
  XmlProduto := XmlProdutos.Add;
  XmlProduto.Descricao := EdtDescricao.Text;
  XmlProduto.Categoria := EdtCategoria.Text;
  XmlProduto.Unidademedida := EdtUnidadeMedida.Text;
  XmlProduto.Valor := StrToFloat(EdtValor.Text);
  xml.SaveToFile('exemplo.xml');
end;

end.
