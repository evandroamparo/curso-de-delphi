/*

Sintaxe: DELETE FROM <tabela>
         [WHERE <CONDIÇÃO>]
*/

-- EXCLUIR TODOS OS PEDIDOS FEITOS HÁ MAIS DE 1 ANO (365 DIAS)
DELETE FROM pedido WHERE DATA < CURRENT_DATE - 365;

-- EXCLUIR O CLIENTE MAIS NOVO E SEUS PEDIDOS
DELETE FROM PEDIDO
WHERE pedido.codigocliente
IN (SELECT cliente.codigo
    FROM cliente WHERE cliente.datanascimento
    = (SELECT MAX(DATANASCIMENTO)
    FROM CLIENTE));

DELETE FROM cliente
WHERE CODIGO IN (SELECT cliente.codigo
                 FROM cliente WHERE cliente.datanascimento
                 = (SELECT MAX(DATANASCIMENTO)
                 FROM CLIENTE));



