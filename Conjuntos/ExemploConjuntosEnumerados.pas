unit ExemploConjuntosEnumerados;

interface

// Tipo enumerado comum
type TEstiloFonte = (efNegrito, efItalico, efSublinhado, efTachado);

// tipo conjunto que pode conter v�rios valores do tipo enumerado
// ou nenhum deles. Qualquer combina��o de valores � v�lida.
type TEstilosFonte = set of TEstiloFonte;



implementation

procedure InicializarEstilos;
var
  Estilo: TEstiloFonte; // vari�vel que s� pode conter um valor TEstiloFonte
  Estilos: TEstilosFonte; // vari�vel que pode conter um conjunto de valores
                          // do tipo TEstiloFonte
begin
  Estilo := efNegrito;
  // sintaxe de conjuntos: valores entre colchetes ou [] (conjunto vazio)
  Estilos := [efItalico, efNegrito];

  // Operador est� contido: in
  if efNegrito in Estilos then
    // o conjunto cont�m o valor efNegrito

  if not (efSublinhado in Estilos) then
    // o conjunto n�o cont�m o valor efSublinhado

  // Adicionar valores a um conjunto
  Estilos := Estilos + [efSublinhado]; // Estilos = [efItalico, efNegrito, efSublinhado]

  // Remover valores de um conjunto
  Estilos := Estilos - [efItalico]; // Estilos = [efNegrito, efSublinhado]

end;

end.
