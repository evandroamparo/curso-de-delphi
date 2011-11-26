unit UFrmCadastroCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UCliente;

type
  TFrmCadastroCliente = class(TForm)
    EdtRazaoSocialNome: TEdit;
    EdtEmail: TEdit;
    MemoEndereco: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    procedure BtnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    Cliente : TCliente;

  end;

var
  FrmCadastroCliente: TFrmCadastroCliente;

implementation

uses UConstantes;

{$R *.dfm}

procedure TFrmCadastroCliente.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroCliente.BtnSalvarClick(Sender: TObject);
begin
  try
    if Cliente = nil then begin
      Cliente := TCliente.Create;
    end;
    Cliente.RazaoSocial := EdtRazaoSocialNome.Text;
    Cliente.Endereco := MemoEndereco.Text;
    Cliente.Email := EdtEmail.Text;
    ModalResult := mrOk;
  except
    on e: Exception do begin
      Application.MessageBox(PWideChar(e.Message), NOME_SISTEMA);
      EdtRazaoSocialNome.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroCliente.FormShow(Sender: TObject);
begin
  if Cliente <> nil then begin
    EdtRazaoSocialNome.Text := Cliente.RazaoSocial;
    EdtEmail.Text := Cliente.Email;
    MemoEndereco.Lines.Text := Cliente.Endereco;
  end;
end;

end.


