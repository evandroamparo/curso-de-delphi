unit UntCalculos;
//Sessão interface, serve para definir o que será visto pelas outras Units.
interface
  //Declaração de tipo enumerado.
  //Cada variável desse tipo só pode ter um dos valores declarados.
  type
  TOperacao=(opSoma,opSubtracao, opMultiplicacao, opDivisao);
  //Declaração de função.
  function soma(x,y:double):double;
  //Declaração de procedimento.
  procedure Soma2(x,y:double);
  //Declaração de função, como parametro de um tipo definido pelo programador.
  function Calcular(x,y:double;operacao:TOperacao):double;
var
  resultado:double;
implementation

function Calcular(x,y:double;operacao:TOperacao):double;
begin
  //Comando de seleção. Equivale a vários ifs.
  //Só podem ser usados tipos ordinais.(Que podem ser representados por um número
  //inteiro).
  case operacao of
    opSoma:Result:=x+y ;
    opSubtracao:Result:=x-y ;
    opMultiplicacao:Result:=x*y ;
    opDivisao:Result:=x/y ;
  end;
end;

function soma(x,y:double):double;
begin
  //É o valor que vai ser retornado pela função.
  Result:=x+y;
end;

procedure Soma2(x,y:double);
begin
  //O Procedure não retorna valor, mas pode armazenar resultados em variavéis.
  resultado:=x+y;
end;
//Sessão que é executada automáticamente, na inicialização do aplicativo.
initialization
  //Soma2(2,3);
end.
