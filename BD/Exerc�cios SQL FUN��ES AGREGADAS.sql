/*
  Funções agregadas:

  Mínimo: MIN(<campo>)
  Máximo: MAX(<campo>)
  Média:  AVG(<campo>)
  Soma:   SUM(<campo>)
  Contagem: COUNT ([DISTINCT] <campo>)

  Agrupamento:
  SELECT <campos> FROM <tabelas>
  ...
  GROUP BY <expressão>
*/

-- RECUPERAR O MENOR LIMITE DE CRÉDITO
SELECT MIN (LIMITECREDITO) FROM cliente;

-- RECUPERAR O MAIOR CÓDIGO DE CLIENTE
SELECT MAX (CODIGO) FROM CLIENTE;

-- RECUPERAR O MAIOR ANO DE NASCIMENTO ENTRE TODOS OS CLIENTES
SELECT MAX (EXTRACT(YEAR FROM DATANASCIMENTO)) FROM CLIENTE;

-- RECUPERAR A MÉDIA DE LIMITE DE CRÉDITO DE TODOS OS CLIENTES NASCIDOS APÓS 1980
SELECT AVG (cliente.limitecredito) FROM CLIENTE WHERE EXTRACT(YEAR FROM cliente.datanascimento)> 1980;

-- RECUPERAR A SOMA DOS PEDIDOS DE TODOS OS CLIENTES QUE TENHAM LIMITE DE CRÉDITO ACIMA DE 2.000
SELECT SUM (VALOR)
FROM pedido
JOIN CLIENTE ON PEDIDO.codigocliente = cliente.codigo
WHERE cliente.limitecredito > 2000;

-- CONTAR O NÚMERO DE CLIENTES QUE FIZERAM PEDIDOS NO ANO DE 2011
SELECT COUNT (cliente.codigo)
FROM cliente
JOIN pedido ON cliente.codigo = pedido.codigocliente
WHERE EXTRACT(YEAR FROM pedido.data) = 2011;

-- RECUPERAR O NOME E A QUANTIDADE DE PEDIDOS DE CADA CLIENTE
SELECT cliente.nome,cliente.datanascimento,COUNT (pedido.codigo)
FROM cliente
JOIN pedido ON cliente.codigo = pedido.codigocliente
GROUP BY cliente.nome, cliente.datanascimento;

-- RECUPERAR OS PEDIDOS QUE TENHAM O MAIOR VALOR
select * from pedido
where pedido.valor =
 ( select max(valor)
from pedido)
