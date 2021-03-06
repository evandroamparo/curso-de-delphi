/*

Sintaxe: INSERT INTO <tabela>
         (<lista campos>)
         VALUES (<lista valores>)

         INSERT INTO <tabela>
         VALUES (<lista valores>)
*/

-- INSERIR UM CLIENTE
INSERT INTO CLIENTE
(NOME, LIMITECREDITO, DATANASCIMENTO)
VALUES ('CARLOS HENRIQUE',2200,'01.09.1984');

-- INSERIR UM CLIENTE COM SOMENTE NOME E DATA DE NASCIMENTO
INSERT INTO cliente
(NOME, DATANASCIMENTO)
VALUES('GABRIELE', '05.06.1982');

-- INSERIR UM PEDIDO PARA O �LTIMO CLIENTE CADASTRADO COM A DATA CORRENTE
-- E COM O VALOR IGUAL A 500,00
INSERT INTO pedido
(CODIGOCLIENTE, VALOR, DATA)
VALUES(GEN_ID(gen_cliente_id, 0), 500, CURRENT_DATE);
