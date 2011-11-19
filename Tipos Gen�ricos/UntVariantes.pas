unit UntVariantes;

interface

uses SysUtils, Variants, Dialogs; // Sempre icluir a unit Variants para utilizar o tipo gen�rico.
procedure Variantes;
var
  generica: Variant;//Tipo gen�rico que pode armazenar qualquer valor.
  vetorGenerico : Variant;
implementation

procedure Variantes;
begin
  if VarIsClear(generica) then
    ShowMessage('A vari�vel est� indefinida' );

  generica:= integer(1);
  if VarType(generica) = varInteger then //Testa se a vari�vel "generica" � um tipo inteiro.
    ShowMessage('O tipo � Inteiro');

  vetorGenerico:= VarArrayOf(['Leandro',2,3]);//Vari�vel est� armazenando um vetor do tipo variant.
                                              //O Vetor � um tipo variante e todos os elementos
                                              //s�o do tipo variant.

  ShowMessage(VarArrayGet(vetorGenerico, [0]));//fun��o que retorna um elemento do vetor
                                                // que foi passado no �ndice.
  ShowMessage(vetorGenerico[0]);// retorna o elemento indicado pelo �ndice passado.

end;

end.
