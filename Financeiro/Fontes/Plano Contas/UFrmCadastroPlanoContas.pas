unit UFrmCadastroPlanoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UPlanoContas;

type
  TFrmCadastroPlanoContas = class(TForm)
    EdtDescricao: TEdit;
    GrbTipoOperacao: TGroupBox;
    RbtCredito: TRadioButton;
    RbtDebito: TRadioButton;
    Label1: TLabel;
    BtnSalvar: TButton;
    BtnCancelar: TButton;
    procedure FormShow(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    PlanoContas : TPlanoContas;
  end;

var
  FrmCadastroPlanoContas: TFrmCadastroPlanoContas;

implementation

uses UConstantes;



{$R *.dfm}

procedure TFrmCadastroPlanoContas.BtnSalvarClick(Sender: TObject);
begin
  try
    if PlanoContas = nil then begin
      PlanoContas := TPlanoContas.Create;
    end;
    PlanoContas.Descricao := EdtDescricao.Text;
    if RbtCredito.Checked then begin
      PlanoContas.TipoOperacao := opCredito;
    end
    else begin
      PlanoContas.TipoOperacao := opDebito;
    end;
  except
   on e : Exception do
    Application.MessageBox(PWideChar(e.Message), NOME_SISTEMA);
  end;
end;

procedure TFrmCadastroPlanoContas.FormShow(Sender: TObject);
begin
  if PlanoContas <> nil then begin
    EdtDescricao.Text := PlanoContas.Descricao;

    case PlanoContas.TipoOperacao of
      opCredito :
        RbtCredito.Checked := true;
      opDebito :
        RbtDebito.Checked := true;
    end;
  end;

end;

end.
