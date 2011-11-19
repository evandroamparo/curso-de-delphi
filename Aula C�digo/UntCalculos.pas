unit UntCalculos;
//Sess�o interface, serve para definir o que ser� visto pelas outras Units.
interface
  //Declara��o de tipo enumerado.
  //Cada vari�vel desse tipo s� pode ter um dos valores declarados.
  type
  TOperacao=(opSoma,opSubtracao, opMultiplicacao, opDivisao);
  //Declara��o de fun��o.
  function soma(x,y:double):double;
  //Declara��o de procedimento.
  procedure Soma2(x,y:double);
  //Declara��o de fun��o, como parametro de um tipo definido pelo programador.
  function Calcular(x,y:double;operacao:TOperacao):double;
var
  resultado:double;
implementation

function Calcular(x,y:double;operacao:TOperacao):double;
begin
  //Comando de sele��o. Equivale a v�rios ifs.
  //S� podem ser usados tipos ordinais.(Que podem ser representados por um n�mero
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
  //� o valor que vai ser retornado pela fun��o.
  Result:=x+y;
end;

procedure Soma2(x,y:double);
begin
  //O Procedure n�o retorna valor, mas pode armazenar resultados em variav�is.
  resultado:=x+y;
end;
//Sess�o que � executada autom�ticamente, na inicializa��o do aplicativo.
initialization
  //Soma2(2,3);
end.
