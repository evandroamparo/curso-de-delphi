unit UFrmCadastroFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UFornecedor;

type
  TFrmCadastroFornecedor = class(TForm)
    Label1: TLabel;
    EdtRazaoSocialNome: TEdit;
    Label2: TLabel;
    MemoEndereco: TMemo;
    Label3: TLabel;
    EdtEmail: TEdit;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Fornecedor : TFornecedor;
  end;

var
  FrmCadastroFornecedor: TFrmCadastroFornecedor;

implementation

uses UConstantes;



{$R *.dfm}

procedure TFrmCadastroFornecedor.BtnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroFornecedor.BtnSalvarClick(Sender: TObject);
begin
  try
    if Fornecedor = nil then Fornecedor := TFornecedor.Create;
    Fornecedor.RazaoSocial := EdtRazaoSocialNome.Text;
    Fornecedor.Endereco := MemoEndereco.Text;
    Fornecedor.Email := EdtEmail.Text;
    ModalResult := mrOk;
  Except
    on e: Exception do begin
      Application.MessageBox(PWideChar(e.Message), NOME_SISTEMA);
      EdtRazaoSocialNome.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroFornecedor.FormShow(Sender: TObject);
begin
  if Fornecedor <> nil then begin
    EdtRazaoSocialNome.Text := Fornecedor.RazaoSocial;
    EdtEmail.Text := Fornecedor.Email;
    MemoEndereco.Lines.Add(Fornecedor.Endereco);
  end;
end;

end.
