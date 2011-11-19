/*

Sintaxe: UPDATE <tabela>
         SET <campo1> = <valor1>,
             <campo2> = <valor2>,
             ...
             <campo n> = <valor n>
         [WHERE <condicao>]

*/

-- ATUALIZAR TODOS OS LIMITES DE CRÉDITO PARA 2.000
UPDATE cliente SET cliente.limitecredito = 2000;
COMMIT WORK

-- ATUALIZAR PARA O LIMITE DE CRÉDITO PARA
-- 1.000, PARA OS CLIENTES NASCIDOS APÓS 1980
-- 1.500, PARA OS DEMAIS CLIENTES
UPDATE cliente SET cliente.limitecredito = 1000 WHERE  EXTRACT(YEAR FROM cliente.datanascimento) > 1980;
UPDATE CLIENTE SET LIMITECREDITO = 1500 WHERE EXTRACT (YEAR FROM DATANASCIMENTO) <= 1980;

-- DAR UM DESCONTO DE 10% NOS PEDIDOS DOS CLIENTES QUE TENHAM LIMITE DE CREDITO ATÉ 1.000
UPDATE pedido
SET pedido.valor = VALOR*0.9 -- OU: VALOR = VALOR - (VALOR * 0.1)
WHERE pedido.codigocliente
IN (SELECT cliente.codigo               -- Este select retorna todos os códigos de clientes com a condição dada
FROM cliente                            -- Os códigos são comparados com a tabela de pedidos para determinar quais
WHERE cliente.limitecredito <= 1000);   -- pedios devem ser atualizados


