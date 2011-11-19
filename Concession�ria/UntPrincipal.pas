unit UntPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    mnuFabricantes: TMenuItem;
    mnuCarros: TMenuItem;
    procedure mnuFabricantesClick(Sender: TObject);
    procedure mnuCarrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UntUIListaFabricantes, UntUIListaCarros;

{$R *.dfm}

procedure TForm1.mnuCarrosClick(Sender: TObject);
begin
  Application.CreateForm(TUIListaCarros, UIListaCarros);
  UIListaCarros.ShowModal;
end;

procedure TForm1.mnuFabricantesClick(Sender: TObject);
begin
  Application.CreateForm(TUIListaFabricantes, UIListaFabricantes);// Crio o formulário.
  UIListaFabricantes.ShowModal;

end;

end.
