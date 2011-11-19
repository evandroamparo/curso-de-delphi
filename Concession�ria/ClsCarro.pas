unit ClsCarro;

interface

uses
  DateUtils, SysUtils, classes, generics.collections, forms;

Type
  TTipoDirecao = (tdHidraulica , tdEletrica, tdNormal);
Type
  TCarro = class
    Codigo : integer;
    AnoFabricacao : word;
    AnoModelo : word;
    Modelo : string;
    CodigoFabricante : integer;
    Cor : string;
    Motor : Double;
    Portas : word;
    Direcao : TTipoDirecao;
    Placa : string;
    class var ListaCarros : TList<TCarro>;
    class procedure SalvarDados;
    class procedure LerDados;
    class procedure Inserir(Carro : TCarro);
    class procedure Alterar(Carro : TCarro);
    class procedure Excluir(Codigo : integer);
    class function ObterCodigo : integer;
    constructor Create; overload;// Método que inicializa um objeto da classe
    constructor Create(AnoFab, AnoModelo : word); overload;//Overload significa que o método é sobrecarregado.
  end;
implementation

class function TCarro.ObterCodigo: integer;
var
 maior, i : integer;
begin
  maior := 0;
  for i := 0 to ListaCarros.Count - 1 do
  begin
    if ListaCarros[i].Codigo > maior then
    begin
      maior := ListaCarros[i].Codigo;
    end;
  end;
  result := maior + 1;
end;

constructor TCarro.Create;
begin
  AnoFabricacao := YearOf(Date);//Retorno o ano da data passada como parâmetro.
  AnoModelo := YearOf(Date);
end;

class procedure TCarro.Alterar(Carro : TCarro);
var
  i, idLista : integer;
begin
  idLista := -1;
  for i := 0 to ListaCarros.Count - 1 do
    begin
      if ListaCarros[i].Codigo = Carro.Codigo then
      begin
        idLista:= i;
        Break;
      end;
    end;
  if idLista <> -1 then
  begin
    ListaCarros[idLista].AnoFabricacao := Carro.AnoFabricacao;
    ListaCarros[idLista].AnoModelo := Carro.AnoModelo;
    ListaCarros[idLista].Modelo := Carro.Modelo;
    ListaCarros[idLista].CodigoFabricante := Carro.CodigoFabricante;
    ListaCarros[idLista].Cor := Carro.Cor;
    ListaCarros[idLista].Motor := Carro.Motor;
    ListaCarros[idLista].Portas := Carro.Portas;
    ListaCarros[idLista].Direcao:= Carro.Direcao;
    ListaCarros[idLista].Placa := Carro.Placa;
    SalvarDados;
  end;
end;

constructor TCarro.Create(AnoFab, AnoModelo: word);
begin
  AnoFabricacao := AnoFab;
  Self.AnoModelo := AnoModelo;//Self é o objeto que estiver sendo usado no momento.
end;

class procedure TCarro.Excluir(Codigo : integer);
var
  i, idLista: Integer;
begin
  idLista := -1;
  for i := 0 to ListaCarros.Count - 1 do
    begin
      if ListaCarros[i].Codigo = Codigo then
        begin
        idLista := i;
        break;
        end;
    end;
    if idLista <> -1 then
    begin
      ListaCarros.Delete(idLista);
      SalvarDados;
    end;
end;

class procedure TCarro.Inserir(Carro : TCarro);
begin
  Carro.Codigo := ObterCodigo;
  ListaCarros.Add(Carro);
  SalvarDados;
end;

class procedure TCarro.LerDados;
var
  arquivo : TextFile;
  carro : TCarro;
  linha : string;
  atributos : TStringList;
begin
  AssignFile(arquivo, ExtractFilePath(Application.ExeName) + 'carros.txt');
  Reset(arquivo);
  atributos := TStringList.Create;
  try
    while not Eof(arquivo) do
    begin
      Readln(arquivo, linha);
      atributos.Delimiter := ';';
      atributos.DelimitedText := linha;
      carro := TCarro.Create;
      carro.Codigo := StrToInt(atributos[0]);
      carro.AnoFabricacao := strtoint(atributos[1]);
      carro.AnoModelo := StrToInt(atributos[2]);
      carro.Modelo := atributos[3];
      carro.CodigoFabricante := StrToInt(atributos[4]);
      carro.Cor := atributos[5];
      carro.Motor := StrToFloat(atributos[6]);
      carro.Portas := StrToInt(atributos[7]);
      carro.Direcao :=  TTipoDirecao(strtoint(atributos[8]));
      carro.Placa := atributos[9];
      Listacarros.Add(carro);
    end;
  finally
    atributos.Free;
    CloseFile(arquivo);
  end;
end;

class procedure TCarro.SalvarDados;
var
  arquivo : TextFile;
  linha : string;
  carro : TCarro;
  i: Integer;
begin
  AssignFile(arquivo, ExtractFilePath(Application.ExeName) + 'carros.txt');
  Rewrite(arquivo);
  try
    for i := 0 to ListaCarros.Count - 1 do
    begin
      carro := TCarro(ListaCarros[i]);
      linha := IntToStr(carro.Codigo) + ';' +
               IntToStr(carro.AnoFabricacao) +';'+
               IntToStr(carro.AnoModelo) +';'+
               carro.Modelo +';'+
               IntToStr(carro.CodigoFabricante)+';'+
               carro.Cor +';'+
               FloatToStr(carro.Motor) +';'+
               IntToStr(carro.Portas) +';'+
               IntToStr(Integer(carro.Direcao))+';'+
               carro.Placa;
      Writeln(arquivo, linha);
    end;
  finally
    CloseFile(arquivo);
  end;
end;
initialization
  TCarro.ListaCarros := TList<TCarro>.Create;//Inicializa a lista.
  TCarro.LerDados;
end.
