unit ExemploConjuntosNaoEnumerados;

interface


implementation

procedure InicializarConjuntos;
var
  c: set of char;
  n: set of string; // Somente tipos ordinais: char, byte
                    // Não permite string, integer, cardinal, double, real, etc
begin
  // Conjunto de caracteres
  c := ['a', 'b', 'c'];

  c := ['a'..'z', 'A'..'Z', '0', '1'];

end;

end.
