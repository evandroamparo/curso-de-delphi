unit UntVariantes;

interface

uses SysUtils, Variants, Dialogs; // Sempre icluir a unit Variants para utilizar o tipo genérico.
procedure Variantes;
var
  generica: Variant;//Tipo genérico que pode armazenar qualquer valor.
  vetorGenerico : Variant;
implementation

procedure Variantes;
begin
  if VarIsClear(generica) then
    ShowMessage('A variável está indefinida' );

  generica:= integer(1);
  if VarType(generica) = varInteger then //Testa se a variável "generica" é um tipo inteiro.
    ShowMessage('O tipo é Inteiro');

  vetorGenerico:= VarArrayOf(['Leandro',2,3]);//Variável está armazenando um vetor do tipo variant.
                                              //O Vetor é um tipo variante e todos os elementos
                                              //são do tipo variant.

  ShowMessage(VarArrayGet(vetorGenerico, [0]));//função que retorna um elemento do vetor
                                                // que foi passado no índice.
  ShowMessage(vetorGenerico[0]);// retorna o elemento indicado pelo índice passado.

end;

end.
