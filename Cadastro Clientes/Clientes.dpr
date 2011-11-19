program Clientes;

uses
  Forms,
  UntCadastroCliente in 'UntCadastroCliente.pas' {UICadastroClientes},
  UntCliente in 'UntCliente.pas',
  UntListaClientes in 'UntListaClientes.pas' {UIListaClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TUIListaClientes, UIListaClientes);
  Application.CreateForm(TUICadastroClientes, UICadastroClientes);
  Application.Run;
end.
