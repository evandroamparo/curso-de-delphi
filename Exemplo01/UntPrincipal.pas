unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFrmPrincipal = class(TForm)
    BtnOk: TButton;
    EdtNome: TEdit;
    ChkStatus: TCheckBox;
    procedure BtnOkClick(Sender: TObject);
    procedure EdtNomeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.BtnOkClick(Sender: TObject);
begin
   if ChkStatus.Checked then
    ShowMessage('Olá '+ EdtNome.Text +', seu cadastro está ativo.')
   else
    ShowMessage('Olá '+ EdtNome.Text +', seu cadastro está inativo.');
end;

procedure TFrmPrincipal.EdtNomeChange(Sender: TObject);
begin
    if EdtNome.Text <> '' then
    begin
       BtnOk.Enabled := True;
       ChkStatus.Enabled := True;
    end
    else
    begin
        BtnOk.Enabled := False;
        ChkStatus.Enabled := False;
    end;
end;

end.
