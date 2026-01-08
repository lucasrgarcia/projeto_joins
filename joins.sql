-- ANÁLISE DE CLIENTES E PEDIDOS

-- OBJETIVO: Analisar o relacionamento entre clientes e pedidos,
-- identificar padrões de compra e problemas de integridade

-- LIMPEZA DAS TABELAS (ATUALIZAÇÃO DO BANCO)
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

-- 1. CRIAÇÃO DAS TABELAS
CREATE TABLE clientes (
    id INT,
    nome VARCHAR(50)
);

CREATE TABLE pedidos (
    id INT,
    cliente_id INT,
    valor DECIMAL(10,2)
);

-- 2. INSERÇÃO DOS DADOS
INSERT INTO clientes (id, nome) VALUES
(1, 'Lucas'),
(2, 'Laylana'),
(3, 'Ayla');

INSERT INTO pedidos (id, cliente_id, valor) VALUES
(1, 1, 100),
(2, 1, 200),
(3, 4, 150); --  (problema de integridade - pedido sem cliente associado)

-- 3. CLIENTES COM PEDIDOS (INNER JOIN)
-- Apenas clientes que possuem registros de pedidos
SELECT
    c.id,
    c.nome,
    p.valor
FROM clientes c
INNER JOIN pedidos p
    ON c.id = p.cliente_id;

-- 4. TODOS OS CLIENTES (LEFT JOIN)
-- Inclui clientes com e sem pedidos
SELECT
    c.id,
    c.nome,
    COALESCE(p.valor, 0) AS valor_pedido
FROM clientes c
LEFT JOIN pedidos p
    ON c.id = p.cliente_id;

-- 5. CLIENTES SEM PEDIDOS
-- Identifica clientes que nunca compraram
SELECT
    c.id,
    c.nome
FROM clientes c
LEFT JOIN pedidos p
    ON c.id = p.cliente_id
WHERE p.cliente_id IS NULL;

-- 6. PEDIDOS SEM CLIENTE
-- Simulação de RIGHT JOIN
SELECT
    p.id AS pedido_id,
    p.cliente_id,
    p.valor
FROM pedidos p
LEFT JOIN clientes c
    ON c.id = p.cliente_id
WHERE c.id IS NULL;



-- 7. RELATÓRIO AGREGADO POR CLIENTE
-- Quantidade de pedidos e total gasto
SELECT
    c.id,
    c.nome,
    COUNT(p.id) AS qtd_pedidos,
    COALESCE(SUM(p.valor), 0) AS total_gasto
FROM clientes c
LEFT JOIN pedidos p
    ON c.id = p.cliente_id
GROUP BY c.id, c.nome;

-- 8. VERSÃO CTE
-- Separação de lógica e leitura facilitada
WITH pedidos_por_cliente AS (
    SELECT
        cliente_id,
        COUNT(id) AS qtd_pedidos,
        SUM(valor) AS total_gasto
    FROM pedidos
    GROUP BY cliente_id
)

SELECT
    c.id,
    c.nome,
    COALESCE(p.qtd_pedidos, 0) AS qtd_pedidos,
    COALESCE(p.total_gasto, 0) AS total_gasto
FROM clientes c
LEFT JOIN pedidos_por_cliente p
    ON c.id = p.cliente_id;

-- 9. INSIGHTS ESPERADOS:

-- • Lucas realizou 2 pedidos e gastou 300 no total
-- • Laylana e Ayla não realizaram compras
-- • Existe pedido sem cliente associado (cliente_id = 4)