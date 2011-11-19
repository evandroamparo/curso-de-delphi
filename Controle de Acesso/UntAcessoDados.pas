unit UntAcessoDados;


interface
uses
   DB, SQLExpr, forms, SysUtils;
   Type
   TAcessoDados = Class
   private
     FBancoDados : TSQLConnection;

   public
     function ExecutaConsulta(Sql : string):TSQLQuery;//Retorna um objeto TSqlQuery.
     Constructor Create (); //Declaração do construtor.
   End;
implementation


{ TAcessoDados }

constructor TAcessoDados.Create();
begin
  FBancoDados := TSQLConnection.Create(nil);//Inicialização da conexão.
  FBancoDados.DriverName:= 'InterBase';
  FBancoDados.LibraryName := 'dbxint.dll';
  FBancoDados.GetDriverFunc :='getSQLDriverINTERBASE';
  FBancoDados.LoginPrompt:= false;
  //FBancoDados.LoadParamsOnConnect := true;
  FBancoDados.Params.add('Database=' + ExtractFilePath(Application.ExeName)+ 'Dados\controleacesso.fdb');//Adiciono o caminho do banco
  FBancoDados.Params.add('UserName=' + 'SYSDBA');// Adiciono o SYSDBA
  FBancoDados.Params.add('PassWord=' + 'masterkey');//Adiciono o masterkey
  FBancoDados.Open;//Abro a conexão
end;

//Método que recebe o sql e faz a consulta ou executa ação do sql no banco.
function TAcessoDados.ExecutaConsulta(Sql: string): TSQLQuery;
var
  Consulta : TSQLQuery;
begin
  Consulta := TSQLQuery.Create(nil);//Criação da variável de consulta.
  Consulta.SQLConnection := FBancoDados;// A Variável com a propriedade de conexão recebe a conexão aberta.
  Consulta.Close;//Garente que a consulta está fechada antes de alterar o sql.
  Consulta.SQL.Add(Sql);//Recebe o sql para ser executado.
  Consulta.Open;//Realiza a consulta se a conexão estiver aberta.
  Result := Consulta;//Retorna a consulta.
end;

initialization

end.
