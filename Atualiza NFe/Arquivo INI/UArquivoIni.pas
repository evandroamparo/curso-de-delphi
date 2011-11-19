unit UArquivoIni;


interface
uses
  IniFiles, SysUtils;
  Type
    TArquivoIni = class
      class function LeValor (CaminhoArquivo, Nome : String): String;
    end;
implementation

{ TArquivoIni }

class function TArquivoIni.LeValor(CaminhoArquivo, Nome: String): String;
var
  Arquivo : TextFile;
  Linha : String;
  NomeEncontrado : String;
begin
  Result := '';
  AssignFile(Arquivo, CaminhoArquivo);//Associa a variável Arquivo ao Arquivo do disco.
  Reset(Arquivo);//Abre o arqivo pra leiitura.
  while not Eof(Arquivo) do begin
    Readln(Arquivo, Linha);//Lê a Linha do Arquivo
    NomeEncontrado := Copy(Linha, 1, Pos('=', Linha)-1 );
    if NomeEncontrado = Nome then begin
      Result := Copy(Linha, Pos('=', Linha)+1, Length(Linha));
      Break;
    end;
  end;
  CloseFile(Arquivo);
end;

end.
