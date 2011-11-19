unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    BtnSalvar: TButton;
    BtnMaiorMenor: TButton;
    EdtNome: TEdit;
    EdtNota: TEdit;
    LblNome: TLabel;
    LblNota: TLabel;
    MemoMostrar: TMemo;
    LblMostrar: TLabel;
    BtnMaiorNota: TButton;
    BtnMenorNota: TButton;
    BtnAprovado: TButton;
    BtnReprovado: TButton;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnMaiorMenorClick(Sender: TObject);
    procedure EdtNomeChange(Sender: TObject);
    procedure EdtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure BtnMaiorNotaClick(Sender: TObject);
    procedure BtnMenorNotaClick(Sender: TObject);
    procedure BtnAprovadoClick(Sender: TObject);
    procedure BtnReprovadoClick(Sender: TObject);
  private
    { Private declarations }
  public
   VetorNome: Array of String;
   VetorNota: Array of Double;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnAprovadoClick(Sender: TObject);
var
  i: Integer;
begin
  MemoMostrar.Clear;
  for i := 0 to Length(VetorNota) - 1 do
  begin
    if VetorNota[i]>= 6 then
      MemoMostrar.Lines.Add(VetorNome[i]+' '+FloatToStr(VetorNota[i]));
  end;
end;

procedure TForm1.BtnMaiorMenorClick(Sender: TObject);
var
  maior, menor: double;
  i: Integer;
begin
  maior:= 0;
  menor:= 10;
  for i := 0 to Length(VetorNota) - 1 do
  begin
    if VetorNota[i] > maior then
      maior:= VetorNota[i];
    if VetorNota[i] < menor then
    menor:= VetorNota[i];
  end;
  Application.MessageBox(PWideChar('A maior nota é: '+FloatToStr(maior)+', e a menor é: '+
  FloatToStr(menor)), 'Resposta');
  EdtNome.SetFocus;
end;

procedure TForm1.BtnMaiorNotaClick(Sender: TObject);
var
  maior: double;
  i:integer;
begin
  maior:= 0;
    for i := 0 to Length(VetorNota) - 1 do
    begin
      if VetorNota[i] > maior then
        maior:= VetorNota[i];
    end;
    MemoMostrar.Clear;
    for i := 0 to Length(VetorNota) - 1 do
    begin
      if maior = VetorNota[i] then
        MemoMostrar.Lines.Add(VetorNome[i]+ ' ' +FloatToStr(VetorNota[i]));
    end;
end;

procedure TForm1.BtnMenorNotaClick(Sender: TObject);
var
  menor: double;
  i:integer;
begin
  menor:= 10;

    for i := 0 to Length(VetorNota) - 1 do
    begin
      if VetorNota[i] < menor then
        menor:= VetorNota[i];
    end;
    MemoMostrar.Clear;
    for i := 0 to Length(VetorNota) - 1 do
    begin
      if menor = VetorNota[i] then
        MemoMostrar.Lines.Add(VetorNome[i]+ ' ' +FloatToStr(VetorNota[i]));
    end;
end;

procedure TForm1.BtnReprovadoClick(Sender: TObject);
var
  i: Integer;
begin
  MemoMostrar.Clear;
  for i := 0 to Length(VetorNota) - 1 do
  begin
    if VetorNota[i]< 6 then
      MemoMostrar.Lines.Add(VetorNome[i]+' '+FloatToStr(VetorNota[i]));
  end;
end;

procedure TForm1.BtnSalvarClick(Sender: TObject);
var
  i: integer;
begin
  if (EdtNome.Text <> '') and (EdtNota.Text <> '') then
  begin
    SetLength(VetorNome,Length(VetorNome)+1);
    SetLength(VetorNota,Length(VetorNota)+1);
    i:= Length(VetorNome)-1;
    VetorNome[i]:=EdtNome.Text;
    VetorNota[i]:=StrToFloat(EdtNota.Text);
    EdtNome.Clear;
    EdtNota.Clear;
  end
  else
    Application.MessageBox('Preencha todos os campo.','Alerta');
  EdtNome.SetFocus;
  BtnMaiorMenor.Enabled:= True;
  BtnMaiorNota.Enabled:= True;
  BtnMenorNota.Enabled:= True;
  BtnAprovado.Enabled:= True;
  BtnReprovado.Enabled:= True;
end;

procedure TForm1.EdtNomeChange(Sender: TObject);
begin

end;
//Evento que é acionado no pressionamento da tecla, do edit.
procedure TForm1.EdtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = char(VK_RETURN) then  //Testa se qual tecla foi pressionada.(VK_RETURN = Enter).
    SelectNext(TWinControl(Sender), true, true);//Passa o foco para o próximo controle.
end;

end.
