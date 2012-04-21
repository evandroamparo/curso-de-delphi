
{****************************************************************************************}
{                                                                                        }
{                                    XML Data Binding                                    }
{                                                                                        }
{         Generated on: 21/04/2012 15:39:18                                              }
{       Generated from: D:\Meus documentos\Curso Delphi\Manipulação de XML\exemplo.xml   }
{   Settings stored in: D:\Meus documentos\Curso Delphi\Manipulação de XML\exemplo.xdb   }
{                                                                                        }
{****************************************************************************************}

unit UntXmlProduto;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLProdutosType = interface;
  IXMLProdutoType = interface;

{ IXMLProdutosType }

  IXMLProdutosType = interface(IXMLNodeCollection)
    ['{02D94ABD-9ABD-433E-B4B2-8091EC826608}']
    { Property Accessors }
    function Get_Produto(Index: Integer): IXMLProdutoType;
    { Methods & Properties }
    function Add: IXMLProdutoType;
    function Insert(const Index: Integer): IXMLProdutoType;
    property Produto[Index: Integer]: IXMLProdutoType read Get_Produto; default;
  end;

{ IXMLProdutoType }

  IXMLProdutoType = interface(IXMLNode)
    ['{8216CCBD-F503-49FF-B42C-2DF94838C105}']
    { Property Accessors }
    function Get_Descricao: WideString;
    function Get_Valor: Double;
    function Get_Categoria: WideString;
    function Get_Unidademedida: WideString;
    procedure Set_Descricao(Value: WideString);
    procedure Set_Valor(Value: Double);
    procedure Set_Categoria(Value: WideString);
    procedure Set_Unidademedida(Value: WideString);
    { Methods & Properties }
    property Descricao: WideString read Get_Descricao write Set_Descricao;
    property Valor: Double read Get_Valor write Set_Valor;
    property Categoria: WideString read Get_Categoria write Set_Categoria;
    property Unidademedida: WideString read Get_Unidademedida write Set_Unidademedida;
  end;

{ Forward Decls }

  TXMLProdutosType = class;
  TXMLProdutoType = class;

{ TXMLProdutosType }

  TXMLProdutosType = class(TXMLNodeCollection, IXMLProdutosType)
  protected
    { IXMLProdutosType }
    function Get_Produto(Index: Integer): IXMLProdutoType;
    function Add: IXMLProdutoType;
    function Insert(const Index: Integer): IXMLProdutoType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLProdutoType }

  TXMLProdutoType = class(TXMLNode, IXMLProdutoType)
  protected
    { IXMLProdutoType }
    function Get_Descricao: WideString;
    function Get_Valor: Double;
    function Get_Categoria: WideString;
    function Get_Unidademedida: WideString;
    procedure Set_Descricao(Value: WideString);
    procedure Set_Valor(Value: Double);
    procedure Set_Categoria(Value: WideString);
    procedure Set_Unidademedida(Value: WideString);
  end;

{ Global Functions }

function Getprodutos(Doc: IXMLDocument): IXMLProdutosType;
function Loadprodutos(const FileName: WideString): IXMLProdutosType;
function Newprodutos: IXMLProdutosType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function Getprodutos(Doc: IXMLDocument): IXMLProdutosType;
begin
  Result := Doc.GetDocBinding('produtos', TXMLProdutosType, TargetNamespace) as IXMLProdutosType;
end;

function Loadprodutos(const FileName: WideString): IXMLProdutosType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('produtos', TXMLProdutosType, TargetNamespace) as IXMLProdutosType;
end;

function Newprodutos: IXMLProdutosType;
begin
  Result := NewXMLDocument.GetDocBinding('produtos', TXMLProdutosType, TargetNamespace) as IXMLProdutosType;
end;

{ TXMLProdutosType }

procedure TXMLProdutosType.AfterConstruction;
begin
  RegisterChildNode('produto', TXMLProdutoType);
  ItemTag := 'produto';
  ItemInterface := IXMLProdutoType;
  inherited;
end;

function TXMLProdutosType.Get_Produto(Index: Integer): IXMLProdutoType;
begin
  Result := List[Index] as IXMLProdutoType;
end;

function TXMLProdutosType.Add: IXMLProdutoType;
begin
  Result := AddItem(-1) as IXMLProdutoType;
end;

function TXMLProdutosType.Insert(const Index: Integer): IXMLProdutoType;
begin
  Result := AddItem(Index) as IXMLProdutoType;
end;

{ TXMLProdutoType }

function TXMLProdutoType.Get_Descricao: WideString;
begin
  Result := ChildNodes['descricao'].Text;
end;

procedure TXMLProdutoType.Set_Descricao(Value: WideString);
begin
  ChildNodes['descricao'].NodeValue := Value;
end;

function TXMLProdutoType.Get_Valor: Double;
begin
  Result := ChildNodes['valor'].NodeValue;
end;

procedure TXMLProdutoType.Set_Valor(Value: Double);
begin
  ChildNodes['valor'].NodeValue := Value;
end;

function TXMLProdutoType.Get_Categoria: WideString;
begin
  Result := ChildNodes['categoria'].Text;
end;

procedure TXMLProdutoType.Set_Categoria(Value: WideString);
begin
  ChildNodes['categoria'].NodeValue := Value;
end;

function TXMLProdutoType.Get_Unidademedida: WideString;
begin
  Result := ChildNodes['unidademedida'].Text;
end;

procedure TXMLProdutoType.Set_Unidademedida(Value: WideString);
begin
  ChildNodes['unidademedida'].NodeValue := Value;
end;

end.