unit UntDmDados;

interface

uses
  SysUtils, Classes, WideStrings, DBXInterbase, FMTBcd, DB, SqlExpr;

type
  TDmDados = class(TDataModule)
    SqlConection: TSQLConnection;
    TabAcao: TSQLTable;
    TabUsuario: TSQLTable;
    TabPerfil: TSQLTable;
    TabAcaoPerfil: TSQLTable;
    DsPerfis: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmDados: TDmDados;

implementation

{$R *.dfm}

end.
