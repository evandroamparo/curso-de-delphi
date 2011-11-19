unit ClsFabricante;

interface

uses
  classes, generics.collections, sysutils, Forms;

Type
  TFabricante = Class
    Codigo : integer;
    Nome : string;
    DataUltimaCompra : TDateTime;
    Endereco : string;
    Telefone : string;
    Email : string;
    Site : string;
    class var ListaFabricantes : TList<TFabricante>;//Atributo estático, ou seja,
    /// pertence a classe e não a um objeto específico.
    class procedure LerDados;
    class procedure SalvarDados;
    class procedure Inserir(Fabricante : TFabricante);
    class procedure Alterar(Fabricante : TFabricante);
    class procedure Excluir(Codigo : integer);
    class function ObterCodigo : integer;
  End;
implementation




{ TFabricante }

class function TFabricante.ObterCodigo : integer;
var
  maior, i : integer;
begin
  maior := 0;
  for i := 0 to ListaFabricantes.Count - 1 do
    begin
      if ListaFabricantes[i].Codigo > maior then
      begin
        maior := ListaFabricantes[i].Codigo;
      end;
    end;
  result := maior+1;
end;

class procedure TFabricante.Alterar(Fabricante: TFabricante);
var
  i, idLista: Integer;
begin
  idLista := -1;
  for i := 0 to ListaFabricantes.Count - 1 do
    begin
      if ListaFabricantes[i].Codigo = Fabricante.Codigo then
        begin
        idLista := i;
        break;
        end;
    end;
  if idLista <> -1 then
  begin
    ListaFabricantes[idLista].Nome := Fabricante.Nome;
    ListaFabricantes[idLista].DataUltimaCompra := Fabricante.DataUltimaCompra;
    ListaFabricantes[idLista].Endereco := Fabricante.Endereco;
    ListaFabricantes[idLista].Telefone := Fabricante.Telefone;
    ListaFabricantes[idLista].Email := Fabricante.Email;
    ListaFabricantes[idLista].Site := Fabricante.Site;
    SalvarDados;
  end;
end;



class procedure TFabricante.Excluir(Codigo: integer);
var
  i, idLista: Integer;
begin
  idLista := -1;
  for i := 0 to ListaFabricantes.Count - 1 do
    begin
      if ListaFabricantes[i].Codigo = Codigo then
        begin
        idLista := i;
        break;
        end;
    end;
    if idLista <> -1 then
    begin
      ListaFabricantes.Delete(idLista);
      SalvarDados;
    end;

end;

class procedure TFabricante.Inserir(Fabricante: TFabricante);
begin
  Fabricante.Codigo:= ObterCodigo;
  ListaFabricantes.Add(Fabricante);
  SalvarDados;
end;

Class procedure TFabricante.LerDados;
var
  arquivo : TextFile;
  fabricante : TFabricante;
  linha : string;
  atributos : TStringList;
begin
  AssignFile(arquivo, ExtractFilePath(Application.ExeName) + 'fabricantes.txt');
  Reset(arquivo);
  atributos := TStringList.Create;
  try
    while not Eof(arquivo) do
    begin
      Readln(arquivo, linha);
      atributos.Delimiter := ';';
      atributos.DelimitedText := linha;
      fabricante := TFabricante.Create;
      fabricante.Codigo := StrToInt(atributos[0]);
      fabricante.Nome := atributos[1];
      fabricante.DataUltimaCompra := StrToDate(atributos[2]);
      fabricante.Endereco := atributos[3];
      fabricante.Telefone := atributos[4];
      fabricante.Email := atributos[5];
      fabricante.Site := atributos[6];
      ListaFabricantes.Add(fabricante);
    end;
  finally
    atributos.Free;
  end;
end;

Class procedure TFabricante.SalvarDados;
var
  arquivo : TextFile;//Tipo usado para acessar arquivos de texto.
  i: Integer;
  linha : string;
  fabricante : TFabricante;
begin
  //Associa uma variável de arquivo a um arquivo no disco.
  AssignFile(arquivo, ExtractFilePath(Application.ExeName) + 'fabricantes.txt');
  Rewrite(arquivo);//Abre o arquivo para gravação e o reescreve.
  try
    for i := 0 to ListaFabricantes.Count - 1 do
    begin
      fabricante := TFabricante(ListaFabricantes[i]);
      linha := IntToStr(fabricante.Codigo) + ';' +
               fabricante.Nome + ';' +
               DateToStr(fabricante.DataUltimaCompra) + ';' +
               fabricante.Endereco + ';' +
               fabricante.Telefone + ';' +
               fabricante.Email + ';' +
               fabricante.Site;
      Writeln(arquivo, linha);//Grava um alinha de texto no arquivo.
    end;
  finally
    CloseFile(arquivo);// Fecha o arquivo.
  end;
end;

initialization

  TFabricante.ListaFabricantes := TList<TFabricante>.Create;
  TFabricante.LerDados;


//  fabricante := TFabricante.Create;
//  with fabricante do
//  begin
//     Codigo := 1;
//     Nome := 'Fulano';
//     DataUltimaCompra := strtodatetime('01/01/2000');
//  end;
//
//  TFabricante.ListaFabricantes.Add(fabricante);
//
//  fabricante := TFabricante.Create;
//  with fabricante do
//  begin
//     Codigo := 1;
//     Nome := 'Fulano';
//     DataUltimaCompra := strtodatetime('01/01/2000');
//  end;
//
//  TFabricante.ListaFabricantes.Add(fabricante);


end.
