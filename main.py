import sqlite3
from tabulate import tabulate

conn = sqlite3.connect("database.db")
cursor = conn.cursor()


def print_table(title, description, headers, rows):
    print(f"\n{title}")
    print(description)
    print(tabulate(rows, headers=headers, tablefmt="github"))


# INNER JOIN – Clientes com pedidos
# Retorna apenas clientes que possuem pedidos registrados
cursor.execute("""
SELECT
    c.nome,
    p.valor
FROM clientes c
INNER JOIN pedidos p
    ON c.id = p.cliente_id
""")

print_table(
    title="INNER JOIN – Clientes com pedidos",
    description="Clientes que possuem pedidos e o valor de cada pedido:\n",
    headers=["Cliente", "Valor do Pedido"],
    rows=cursor.fetchall()
)


# LEFT JOIN – Todos os clientes
# Inclui clientes com e sem pedidos
cursor.execute("""
SELECT
    c.nome,
    COALESCE(p.valor, 0) AS valor
FROM clientes c
LEFT JOIN pedidos p
    ON c.id = p.cliente_id
""")

print_table(
    title="LEFT JOIN – Todos os clientes",
    description="Todos os clientes (clientes sem pedidos aparecem com valor 0):\n",
    headers=["Cliente", "Valor do Pedido"],
    rows=cursor.fetchall()
)


# CLIENTES SEM PEDIDO
# Identifica clientes que nunca realizaram compras
cursor.execute("""
SELECT
    c.nome
FROM clientes c
LEFT JOIN pedidos p
    ON c.id = p.cliente_id
WHERE p.cliente_id IS NULL
""")

print_table(
    title="CLIENTES SEM PEDIDO",
    description="Clientes que ainda não realizaram nenhuma compra:\n",
    headers=["Cliente"],
    rows=cursor.fetchall()
)


# TOTAL GASTO POR CLIENTE
# Relatório agregado por cliente
cursor.execute("""
SELECT
    c.nome,
    COALESCE(SUM(p.valor), 0) AS total_gasto
FROM clientes c
LEFT JOIN pedidos p
    ON c.id = p.cliente_id
GROUP BY c.nome
""")

print_table(
    title="TOTAL GASTO POR CLIENTE",
    description="Soma do valor total gasto por cliente:\n",
    headers=["Cliente", "Total Gasto"],
    rows=cursor.fetchall()
)

conn.close()
