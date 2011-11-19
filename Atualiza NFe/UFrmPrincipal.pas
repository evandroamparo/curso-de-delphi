unit UFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, WideStrings, DB, SqlExpr;

type
  TForm1 = class(TForm)
    EdtCaminhoBanco: TEdit;
    EdtCaminhoIni: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BtnAcertarNFe: TButton;
    BtnSair: TButton;
    EdtCodigoNFe: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    EdtChaveAcesso: TEdit;
    Label4: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnSairClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin //Se Clicar em abrir ele passa na validação.
    EdtCaminhoBanco.Text := OpenDialog1.FileName;
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    EdtCaminhoIni.Text := OpenDialog1.FileName;
  end;
end;

end.
