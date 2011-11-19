-- SELECT COM JOIN:
/*
SELECT <lista campos>
FROM <tabela 1>
JOIN <tabela 2> ON <condição do join>
JOIN <tabela 3> ON <condição do join>
JOIN <tabela n> ON <condição do join>...
*/
-- RECUPERAR TODOS O CLIENTES COM PEDIDOS ACIMA DE 1000

SELECT  DISTINCT nome FROM cliente JOIN pedido ON cliente.codigo = pedido.codigocliente WHERE pedido.valor > 1000;-- DISTINCT RETORNA SOMENTE OS REGISTROS DISTINTOS, COMPARANDO OS CAMPOS DO SELECT.

-- RECUPERAR TODOS O CLIENTES QUE FIZERAM PEDIDOS EM 2010

SELECT DISTINCT cliente.* FROM cliente JOIN PEDIDO ON cliente.codigo = PEDIDO.codigocliente WHERE EXTRACT (YEAR FROM pedido.data)= 2010;

-- RECUPERAR O LIMITE DE CRÉDITO E O VALOR COMPRADO DOS CLIENTES QUE COMPRARAM MENOS DE 100 POR PEDIDO NO ANO DE 2011

SELECT cliente.nome, cliente.limitecredito, pedido.valor
FROM cliente
JOIN pedido ON CLIENTE.codigo = pedido.codigocliente
WHERE pedido.valor < 100 AND EXTRACT(YEAR FROM pedido.data) = 2011;

-- RECUPERAR TODOS O CLIENTES QUE NUNCA FIZERAM PEDIDOS

SELECT NOME FROM cliente WHERE NOT EXISTS (SELECT pedido.codigocliente FROM PEDIDO WHERE pedido.codigocliente = cliente.codigo);
--VERIFICA SE O CÓDIGO DO CLIENTE SE ENCONTRA NA TABELA INDICADA, CASO NÃO EXISTA ELE RETORNA A CONSULTA.
