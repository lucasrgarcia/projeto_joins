# SQL Joins – Fundamentos de Análise Relacional

Projeto em SQL e Python focado nos fundamentos de modelagem relacional e uso de JOINs, aplicado a um cenário simples de clientes e pedidos.  
O objetivo é demonstrar clareza na construção de consultas, tratamento de dados ausentes, agregações e comunicação dos resultados de forma legível e reproduzível.

---

## Objetivo do Projeto

- Demonstrar o uso correto de `INNER JOIN` e `LEFT JOIN`
- Identificar registros sem correspondência entre tabelas
- Tratar dados ausentes (`NULL`) de forma adequada
- Gerar relatórios agregados a partir de múltiplas tabelas
- Apresentar resultados de forma clara no terminal usando Python

---

## Modelo de Dados

### Clientes
- `id`: identificador do cliente
- `nome`: nome do cliente

### Pedidos
- `id`: identificador do pedido
- `cliente_id`: referência ao cliente
- `valor`: valor do pedido

O modelo inclui propositalmente:
- clientes sem pedidos
- pedido sem cliente associado  

Esses casos permitem analisar diferentes comportamentos dos JOINs e problemas de integridade de dados.

---

## Tecnologias Utilizadas

- SQL (SQLite)
- Python
- PyCharm
- Biblioteca `tabulate` para visualização no terminal

---

## Consultas Realizadas

- **INNER JOIN**  
  Clientes que possuem pedidos registrados.

- **LEFT JOIN**  
  Todos os clientes, incluindo aqueles sem pedidos.

- **Clientes sem pedido**  
  Identificação de clientes que nunca realizaram compras.

- **Total gasto por cliente**  
  Relatório agregado com soma do valor gasto por cliente.

---

## Exemplo de Saída

As consultas são exibidas no terminal em formato tabular, facilitando a leitura e interpretação dos resultados.

Exemplo:

