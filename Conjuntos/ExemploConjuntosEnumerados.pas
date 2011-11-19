unit ExemploConjuntosEnumerados;

interface

// Tipo enumerado comum
type TEstiloFonte = (efNegrito, efItalico, efSublinhado, efTachado);

// tipo conjunto que pode conter vários valores do tipo enumerado
// ou nenhum deles. Qualquer combinação de valores é válida.
type TEstilosFonte = set of TEstiloFonte;



implementation

procedure InicializarEstilos;
var
  Estilo: TEstiloFonte; // variável que só pode conter um valor TEstiloFonte
  Estilos: TEstilosFonte; // variável que pode conter um conjunto de valores
                          // do tipo TEstiloFonte
begin
  Estilo := efNegrito;
  // sintaxe de conjuntos: valores entre colchetes ou [] (conjunto vazio)
  Estilos := [efItalico, efNegrito];

  // Operador está contido: in
  if efNegrito in Estilos then
    // o conjunto contém o valor efNegrito

  if not (efSublinhado in Estilos) then
    // o conjunto não contém o valor efSublinhado

  // Adicionar valores a um conjunto
  Estilos := Estilos + [efSublinhado]; // Estilos = [efItalico, efNegrito, efSublinhado]

  // Remover valores de um conjunto
  Estilos := Estilos - [efItalico]; // Estilos = [efNegrito, efSublinhado]

end;

end.
