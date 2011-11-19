object DmDados: TDmDados
  OldCreateOrder = False
  Height = 150
  Width = 372
  object SqlConection: TSQLConnection
    DriverName = 'InterBase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxint.dll'
    LoginPrompt = False
    Params.Strings = (
      
        'Database=D:\Meus documentos\Curso Delphi\Controle de Acesso\Dado' +
        's\controleacesso.fdb'
      'User=SYSDBA'
      'Password=masterkey')
    VendorLib = 'gds32.dll'
    Connected = True
    Left = 16
    Top = 16
  end
  object TabAcao: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SqlConection
    Left = 80
    Top = 16
  end
  object TabUsuario: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SqlConection
    Left = 144
    Top = 16
  end
  object TabPerfil: TSQLTable
    Active = True
    MaxBlobSize = -1
    SQLConnection = SqlConection
    TableName = 'PERFIL'
    Left = 208
    Top = 16
  end
  object TabAcaoPerfil: TSQLTable
    MaxBlobSize = -1
    SQLConnection = SqlConection
    Left = 272
    Top = 16
  end
  object DsPerfis: TDataSource
    DataSet = TabPerfil
    Left = 208
    Top = 72
  end
end
